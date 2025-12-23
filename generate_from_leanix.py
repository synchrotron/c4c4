#!/usr/bin/env python3
"""
generate_from_leanix.py - Generate Structurizr DSL from LeanIX

Main generator that fetches architecture data from LeanIX and creates
the Channel 4 Core workspace DSL with configurable metadata:
1. LeanIX URL for each application
2. Projects (including parent projects) as tags and/or perspectives (configurable via CLI flag)
3. SSO tags for applications with implemented SSO
4. Category tags for persons (teams/organisations)
5. Integration tags for relationships
6. 'Impact' tag when projects are associated with elements

Use --help to see configuration options for rendering projects.
"""

import os
import re
import argparse
from pathlib import Path
from leanix.client import LeanIXClient
from leanix.mapper import LeanIXMapper


def main():
    """Generate DSL from LeanIX data."""

    # Parse command-line arguments
    parser = argparse.ArgumentParser(
        description='Generate Structurizr DSL from LeanIX',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Note: Projects (including parent projects/initiatives) are always rendered as both tags and perspectives.
      Platform perspectives are derived from child application projects.

Examples:
  # Generate to default location (local testing)
  python generate_from_leanix.py

  # Generate directly to c4-lite project
  python generate_from_leanix.py --output ../c4-lite/core/c4-core-workspace.dsl

  # Generate to absolute path
  python generate_from_leanix.py -o /path/to/workspace.dsl
        """
    )

    parser.add_argument(
        '-o', '--output',
        type=str,
        help='Output file path (default: dsl/c4-core-workspace.dsl)',
        default='dsl/c4-core-workspace.dsl'
    )

    args = parser.parse_args()

    # Configuration
    tag_name = "Enterprise System"  # Tag to filter platforms
    output_file = Path(args.output)
    output_dir = output_file.parent

    print("=" * 70)
    print("Channel 4 Core - LeanIX to Structurizr DSL Generator")
    print("=" * 70)
    print(f"Configuration:")
    print(f"  - Output file: {output_file}")
    print(f"  - Projects rendered as both tags and perspectives")
    print(f"  - Platform perspectives derived from child applications")
    print()

    # Create output directory
    try:
        output_dir.mkdir(parents=True, exist_ok=True)
    except Exception as e:
        print(f"Error: Cannot create output directory {output_dir}: {e}")
        return 1
    
    # Step 1: Connect to LeanIX
    print("Step 1: Connecting to LeanIX...")
    print("-" * 70)
    try:
        client = LeanIXClient()
        print("Connected to LeanIX")
    except Exception as e:
        print(f"Failed to connect: {e}")
        return 1
    print()
    
    # Step 2: Fetch all platforms with the specified tag
    print(f"Step 2: Fetching platforms with tag '{tag_name}'")
    print("-" * 70)
    try:
        platforms_edges = client.get_platforms_by_tag(tag_name, limit=100)
        platforms_data = [edge.get('node', {}) for edge in platforms_edges]
        
        print(f"Fetched {len(platforms_data)} platforms")
        
        if platforms_data:
            print()
            print("Platforms found:")
            for idx, platform in enumerate(platforms_data, 1):
                platform_name = platform.get('displayName') or platform.get('name')
                platform_type = platform.get('type')
                app_count = len(platform.get('relTechPlatformToApplication', {}).get('edges', []))
                print(f"  {idx}. {platform_name} ({platform_type}) - {app_count} applications")
        else:
            print(f"No platforms found with tag '{tag_name}'")
            print("Please check:")
            print("  1. Tag name is correct (case-sensitive)")
            print("  2. Platforms in LeanIX have this tag applied")
            return 1
            
    except Exception as e:
        print(f"Failed to fetch platforms: {e}")
        import traceback
        traceback.print_exc()
        return 1
    print()
    
    # Step 3: Fetch Interfaces
    print("Step 3: Fetching Interfaces (integrations)")
    print("-" * 70)
    try:
        all_interfaces = client.get_all_interfaces()
        print(f"Fetched {len(all_interfaces)} interfaces")
    except Exception as e:
        print(f"Failed to fetch interfaces: {e}")
        return 1
    print()
    
    # Step 4: Map to Structurizr DSL
    print("Step 4: Mapping LeanIX data to Structurizr DSL")
    print("-" * 70)
    try:
        mapper = LeanIXMapper()

        # Use multi-platform method for all cases (works for single platform too)
        print(f"Generating DSL for {len(platforms_data)} platform(s) with enhancements:")
        print("  - LeanIX URLs for each application")
        print("  - Projects (including parent projects) as both tags and perspectives")
        print("  - Platform perspectives derived from child application projects")
        print("  - 'Impact' tag when projects are present")
        print("  - SSO tags for implemented SSO")
        print("  - Category tags for persons")
        print("  - Integration tags for relationships")
        dsl = mapper.map_multiple_platforms_to_dsl(platforms_data, all_interfaces)
        
        print("DSL generated successfully")
    except Exception as e:
        print(f"Failed to generate DSL: {e}")
        import traceback
        traceback.print_exc()
        return 1
    print()
    
    # Step 5: Save to file
    print("Step 5: Saving DSL to file")
    print("-" * 70)
    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(dsl)
        print(f"Saved to: {output_file}")
        
        # Show stats
        lines = dsl.split('\n')
        print(f"  Total lines: {len(lines)}")
        
        # Count elements
        person_count = dsl.count('person "')
        software_system_count = dsl.count('softwareSystem "')
        container_count = dsl.count('container "')
        relationship_count = dsl.count(' -> ')
        url_count = dsl.count('url https://channel4.leanix.net')
        
        # Count tags on different element types
        # Application tags (inside container blocks)
        app_tag_count = len(re.findall(r'container.*?\{[^}]*tags "[^"]+', dsl, re.DOTALL))
        
        # Person tags (inside person blocks)
        person_tag_count = len(re.findall(r'person.*?\{[^}]*tags "[^"]+', dsl, re.DOTALL))
        
        # SSO perspectives
        sso_count = dsl.count('SSO "Authenticated using SSO"')
        
        # Relationship tags with Impact (indicating project tags)
        rel_with_project_count = len(re.findall(r' -> [^"]*"[^"]*"[^"]*"[^"]*Impact', dsl))
        
        print(f"  Teams: {person_count}")
        print(f"  Platforms: {software_system_count}")
        print(f"  Applications: {container_count}")
        print(f"  Relationships: {relationship_count}")
        print(f"  URLs added: {url_count}")
        print(f"  Applications with project tags: {app_tag_count}")
        print(f"  Persons with tags (category/projects): {person_tag_count}")
        print(f"  Applications with SSO perspective: {sso_count}")
        print(f"  Relationships with project tags: {rel_with_project_count}")
        
    except Exception as e:
        print(f"Failed to save file: {e}")
        return 1
    print()
    
    # Summary
    print("=" * 70)
    print("Generation Complete!")
    print("=" * 70)
    print()
    print(f"Output: {output_file}")
    print()
    print("Enhancements applied:")
    print("  1. LeanIX URL added to each application")
    print("  2. Projects (including parent projects) rendered as both tags and perspectives")
    print("  3. Platform perspectives derived from child application projects")
    print("  4. 'Impact' tag when projects are present")
    print("  5. SSO tags for applications with implemented SSO")
    print("  6. Category tags for persons (including 'Team')")
    print("  7. Integration tags for relationships")
    print()
    print("Next steps:")
    print("  1. Review the generated DSL")
    print("  2. Upload to Structurizr or run Structurizr Lite")
    print("  3. Verify all platforms, applications and relationships are correct")
    print()
    print("To preview:")
    print(f"  cat {output_file}")
    print()
    print("To upload with Structurizr CLI:")
    print(f"  structurizr-cli push -workspace {output_file} ...")
    print()
    print("=" * 70)
    
    return 0


if __name__ == "__main__":
    exit(main())