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
from service.generator import DSLGeneratorService


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

  # Generate with a different year filter
  python generate_from_leanix.py --year 2027

  # Generate directly to c4-lite project
  python generate_from_leanix.py --output ../c4-lite/core/c4-core-workspace.dsl

  # Generate to absolute path with custom year
  python generate_from_leanix.py -o /path/to/workspace.dsl -y 2027
        """
    )

    parser.add_argument(
        '-o', '--output',
        type=str,
        help='Output file path (default: dsl/c4-core-workspace.dsl)',
        default='dsl/c4-core-workspace.dsl'
    )

    parser.add_argument(
        '-y', '--year',
        type=int,
        help='Filter projects by year (default: 2026)',
        default=2026
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
    print(f"  - Project year filter: {args.year}")
    print(f"  - Projects rendered as both tags and perspectives")
    print(f"  - Platform perspectives derived from child applications")
    print()

    # Create output directory
    try:
        output_dir.mkdir(parents=True, exist_ok=True)
    except Exception as e:
        print(f"Error: Cannot create output directory {output_dir}: {e}")
        return 1

    # Step 1-4: Generate DSL using service layer
    print("Step 1: Connecting to LeanIX...")
    print("-" * 70)

    try:
        service = DSLGeneratorService()
        print("Connected to LeanIX")
        print()

        print(f"Step 2-4: Fetching data and generating DSL")
        print("-" * 70)
        print(f"Fetching platforms with tag '{tag_name}'")
        print("Fetching interfaces (integrations)")
        print(f"Generating DSL with enhancements:")
        print("  - LeanIX URLs for each application")
        print(f"  - Projects filtered by year: {args.year}")
        print("  - Projects (including parent projects) as both tags and perspectives")
        print("  - Platform perspectives derived from child application projects")
        print("  - 'Impact' tag when projects are present")
        print("  - SSO tags for implemented SSO")
        print("  - Category tags for persons")
        print("  - Integration tags for relationships")

        result = service.generate_dsl(year=args.year, tag_name=tag_name)
        dsl = result.dsl

        print()
        print(f"Fetched {result.metadata['platform_count']} platforms")
        print("Platforms found:")
        for idx, platform in enumerate(result.metadata['platforms'], 1):
            print(f"  {idx}. {platform['name']} ({platform['type']}) - {platform['app_count']} applications")

        print()
        print(f"Fetched {result.metadata['interface_count']} interfaces")
        print()
        print("DSL generated successfully")

    except ValueError as e:
        print(f"Error: {e}")
        return 1
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