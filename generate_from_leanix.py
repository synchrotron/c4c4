#!/usr/bin/env python3
"""
generate_from_leanix.py - Generate Structurizr DSL from LeanIX

Main generator that fetches architecture data from LeanIX and creates
the Channel 4 Core workspace DSL.
"""

import os
from pathlib import Path
from leanix.client import LeanIXClient
from leanix.mapper import LeanIXMapper


def main():
    """Generate DSL from LeanIX data."""
    
    # Configuration - CHANGED: Use tag instead of hardcoded ID
    tag_name = "Enterprise System"  # Tag to filter platforms
    output_dir = Path("dsl")
    output_file = output_dir / "c4-core-workspace.dsl"
    
    print("=" * 70)
    print("Channel 4 Core - LeanIX to Structurizr DSL Generator")
    print("=" * 70)
    print()
    
    # Create output directory
    output_dir.mkdir(exist_ok=True)
    
    # Step 1: Connect to LeanIX
    print("Step 1: Connecting to LeanIX...")
    print("-" * 70)
    try:
        client = LeanIXClient()
        print("✓ Connected to LeanIX")
    except Exception as e:
        print(f"✗ Failed to connect: {e}")
        return 1
    print()
    
    # Step 2: Fetch all platforms with the specified tag
    print(f"Step 2: Fetching platforms with tag '{tag_name}'")
    print("-" * 70)
    try:
        platforms_edges = client.get_platforms_by_tag(tag_name, limit=100)
        platforms_data = [edge.get('node', {}) for edge in platforms_edges]
        
        print(f"✓ Fetched {len(platforms_data)} platforms")
        
        if platforms_data:
            print()
            print("Platforms found:")
            for idx, platform in enumerate(platforms_data, 1):
                platform_name = platform.get('displayName') or platform.get('name')
                platform_type = platform.get('type')
                app_count = len(platform.get('relTechPlatformToApplication', {}).get('edges', []))
                print(f"  {idx}. {platform_name} ({platform_type}) - {app_count} applications")
        else:
            print(f"⚠️  No platforms found with tag '{tag_name}'")
            print("Please check:")
            print("  1. Tag name is correct (case-sensitive)")
            print("  2. Platforms in LeanIX have this tag applied")
            return 1
            
    except Exception as e:
        print(f"✗ Failed to fetch platforms: {e}")
        import traceback
        traceback.print_exc()
        return 1
    print()
    
    # Step 3: Fetch Interfaces
    print("Step 3: Fetching Interfaces (integrations)")
    print("-" * 70)
    try:
        all_interfaces = client.get_all_interfaces()
        print(f"✓ Fetched {len(all_interfaces)} interfaces")
    except Exception as e:
        print(f"✗ Failed to fetch interfaces: {e}")
        return 1
    print()
    
    # Step 4: Map to Structurizr DSL
    print("Step 4: Mapping LeanIX data to Structurizr DSL")
    print("-" * 70)
    try:
        mapper = LeanIXMapper()
        
        # CHANGED: Use new multi-platform method if multiple platforms
        if len(platforms_data) == 1:
            # Single platform - use existing method
            print(f"Generating DSL for single platform: {platforms_data[0].get('displayName')}")
            dsl = mapper.map_platform_to_dsl(platforms_data[0], all_interfaces)
        else:
            # Multiple platforms - use new method
            print(f"Generating DSL for {len(platforms_data)} platforms")
            dsl = mapper.map_multiple_platforms_to_dsl(platforms_data, all_interfaces)
        
        print("✓ DSL generated successfully")
    except Exception as e:
        print(f"✗ Failed to generate DSL: {e}")
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
        print(f"✓ Saved to: {output_file}")
        
        # Show stats
        lines = dsl.split('\n')
        print(f"  Total lines: {len(lines)}")
        
        # Count elements
        person_count = dsl.count('person "')
        software_system_count = dsl.count('softwareSystem "')
        container_count = dsl.count('container "')
        relationship_count = dsl.count(' -> ')
        
        print(f"  Teams: {person_count}")
        print(f"  Platforms: {software_system_count}")
        print(f"  Applications: {container_count}")
        print(f"  Relationships: {relationship_count}")
        
    except Exception as e:
        print(f"✗ Failed to save file: {e}")
        return 1
    print()
    
    # Summary
    print("=" * 70)
    print("✓ Generation Complete!")
    print("=" * 70)
    print()
    print(f"Output: {output_file}")
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