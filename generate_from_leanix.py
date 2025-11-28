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
    
    # Configuration
    platform_id = "3f828194-de4a-4dee-9ca6-e071cc2e0eae"  # Finance Systems Platform
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
    
    # Step 2: Fetch Platform data
    print(f"Step 2: Fetching Finance Systems Platform")
    print("-" * 70)
    print(f"  Platform ID: {platform_id}")
    try:
        platform_data = client.get_platform_by_id(platform_id)
        platform_name = platform_data.get('displayName') or platform_data.get('name')
        platform_type = platform_data.get('type')
        app_count = len(platform_data.get('relTechPlatformToApplication', {}).get('edges', []))
        
        print(f"✓ Fetched: {platform_name}")
        print(f"  Type: {platform_type}")
        print(f"  Applications: {app_count}")
    except Exception as e:
        print(f"✗ Failed to fetch platform: {e}")
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
        dsl = mapper.map_platform_to_dsl(platform_data, all_interfaces)
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
        container_count = dsl.count('container "')
        relationship_count = dsl.count(' -> ')
        
        print(f"  Teams: {person_count}")
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
    print("  3. Verify all applications and relationships are correct")
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