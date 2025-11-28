"""
leanix/mapper.py - LeanIX to Structurizr Mapper

Maps LeanIX fact sheets to Structurizr DSL format.
"""

import re
from typing import Dict, List, Tuple


class LeanIXMapper:
    """Maps LeanIX data to Structurizr DSL format."""
    
    def __init__(self):
        self.theme_url = "https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/c4-default-theme.json"
        self.logo_url = "https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/4-logo-black.png"
        self.font_name = "4Text"
        self.font_url = "https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/4Text-Regular.ttf"
        self.missing_acronyms = []  # Track elements missing acronyms
        self.duplicate_acronyms = []  # Track duplicate acronym conflicts
    
    def _generate_temp_acronym(self, name: str) -> str:
        """
        Generate a temporary acronym from a name.
        
        Args:
            name: Display name
            
        Returns:
            Temporary acronym (uppercase initials or first 3-4 chars)
        """
        # Remove special characters and split
        clean = re.sub(r'[^a-zA-Z0-9\s-]', '', name)
        words = clean.split()
        
        if not words:
            return 'TMP'
        
        # If multiple words, use initials
        if len(words) > 1:
            acronym = ''.join(word[0].upper() for word in words if word)
            return acronym[:4] if len(acronym) > 4 else acronym
        
        # Single word - use first 3-4 characters
        word = words[0]
        return word[:4].upper() if len(word) >= 4 else word[:3].upper()
    
    def _get_identifier_from_acronym(self, element_name: str, element_type: str, 
                                     acronym: str = None, element_id: str = None) -> str:
        """
        Get identifier from acronym field, or generate temporary one if missing.
        
        Args:
            element_name: Display name of element
            element_type: Type of element (for logging - 'Platform', 'Application', 'Organisation', 'Interface')
            acronym: Acronym from LeanIX
            element_id: LeanIX ID for reference in logs
            
        Returns:
            Valid identifier (lowercase acronym or generated temporary)
        """
        if acronym and acronym.strip():
            # Use provided acronym (lowercase for identifier)
            return acronym.strip().lower()
        else:
            # Generate temporary acronym and log
            temp_acronym = self._generate_temp_acronym(element_name)
            self.missing_acronyms.append({
                'type': element_type,
                'name': element_name,
                'id': element_id,
                'temp_acronym': temp_acronym
            })
            return temp_acronym.lower()
    
    def _ensure_unique_identifier(self, identifier: str, used_identifiers: set, 
                                  element_name: str, element_type: str) -> str:
        """
        Ensure identifier is unique by appending 'X' if duplicate.
        
        Args:
            identifier: Proposed identifier
            used_identifiers: Set of already used identifiers
            element_name: Display name for logging
            element_type: Type of element for logging
            
        Returns:
            Unique identifier
        """
        if identifier not in used_identifiers:
            used_identifiers.add(identifier)
            return identifier
        
        # Duplicate found - append X and log
        original = identifier
        identifier = identifier + 'X'
        
        # Keep adding X until unique
        while identifier in used_identifiers:
            identifier = identifier + 'X'
        
        self.duplicate_acronyms.append({
            'type': element_type,
            'name': element_name,
            'original': original,
            'modified': identifier
        })
        
        used_identifiers.add(identifier)
        return identifier
    
    def _to_identifier(self, name: str) -> str:
        """
        Convert a name to a valid DSL identifier.
        
        Args:
            name: Display name (used as identifier)
            
        Returns:
            Valid identifier (camelCase, alphanumeric)
        """
        # Remove special characters and split
        clean = re.sub(r'[^a-zA-Z0-9\s-]', '', name)
        words = clean.split()
        
        if not words:
            return 'element'
        
        # camelCase
        identifier = words[0].lower() + ''.join(word.capitalize() for word in words[1:])
        return identifier
    
    def _clean_description(self, desc: str) -> str:
        """
        Clean description text - single line, reasonable length.
        
        Args:
            desc: Raw description text
            
        Returns:
            Cleaned description text
        """
        if not desc:
            return ''
        
        # Replace newlines with spaces
        desc = ' '.join(desc.split())
        
        # Trim to reasonable length (100 chars)
        if len(desc) > 100:
            desc = desc[:97] + '...'
        
        return desc
    
    def map_platform_to_dsl(self, platform_data: dict, all_interfaces: list) -> str:
        """
        Map a LeanIX platform (Application) to Structurizr DSL.
        
        Args:
            platform_data: Platform fact sheet from LeanIX
            all_interfaces: List of all interface fact sheets
            
        Returns:
            Complete Structurizr DSL as string
        """
        # Reset tracking lists for this generation
        self.missing_acronyms = []
        self.duplicate_acronyms = []
        
        # Track all used identifiers to prevent duplicates
        used_identifiers = set()
        
        platform_id = platform_data.get('id')
        platform_name = platform_data.get('displayName') or platform_data.get('name')
        platform_desc = platform_data.get('description', 'Platform from LeanIX')
        platform_acronym = platform_data.get('acronym')
        
        # Get platform identifier from acronym
        platform_identifier = self._get_identifier_from_acronym(
            platform_name, 'Platform', platform_acronym, platform_id
        )
        platform_identifier = self._ensure_unique_identifier(
            platform_identifier, used_identifiers, platform_name, 'Platform'
        )
        
        # Extract child applications (containers)
        applications = []
        rel_to_apps = platform_data.get('relTechPlatformToApplication', {}).get('edges', [])
        for edge in rel_to_apps:
            app = edge.get('node', {}).get('factSheet', {})
            if app:
                applications.append(app)
        
        # Build application ID to identifier mapping using acronyms
        app_id_map = {}
        app_ids = set()
        for app in applications:
            app_id = app.get('id')
            app_ids.add(app_id)
            app_display_name = app.get('displayName') or app.get('name')
            app_name = app.get('name') or app_display_name
            app_acronym = app.get('acronym')
            
            # Get identifier from acronym
            app_identifier = self._get_identifier_from_acronym(
                app_display_name, 'Application', app_acronym, app_id
            )
            app_identifier = self._ensure_unique_identifier(
                app_identifier, used_identifiers, app_display_name, 'Application'
            )
            
            app_id_map[app_id] = (app_identifier, app_name)
        
        # Extract organisations (persons) and their relationships to applications
        organizations = {}  # org_id -> (org_display_name, org_name, org_desc, org_acronym)
        org_to_app_relationships = []  # (org_id, app_id, relationship_desc)
        
        # Get orgs from each application
        for app in applications:
            app_id = app.get('id')
            app_orgs = app.get('relApplicationToUserGroup', {}).get('edges', [])
            
            for edge in app_orgs:
                org = edge.get('node', {}).get('factSheet', {})
                if org:
                    org_id = org.get('id')
                    org_display_name = org.get('displayName')
                    org_name = org.get('name') or org_display_name
                    org_desc = org.get('description', '')
                    org_acronym = org.get('acronym')
                    
                    # Store organisation
                    if org_id not in organizations:
                        organizations[org_id] = (org_display_name, org_name, org_desc, org_acronym)
                    
                    # Store relationship
                    org_to_app_relationships.append((org_id, app_id, 'Uses'))
        
        # Extract application-to-application relationships from interfaces
        app_relationships = []
        relationship_counter = {}  # Track how many relationships per interface
        
        for interface_edge in all_interfaces:
            interface = interface_edge.get('node', {})
            interface_id = interface.get('id')
            interface_display_name = interface.get('displayName') or interface.get('name', 'Integration')
            interface_name = interface.get('name') or interface_display_name
            interface_desc = self._clean_description(interface.get('description', ''))
            interface_acronym = interface.get('acronym')
            
            # Get base identifier from acronym
            base_interface_identifier = self._get_identifier_from_acronym(
                interface_display_name, 'Interface', interface_acronym, interface_id
            )
            
            # Get provider (source) and consumer relationships
            providers = interface.get('relInterfaceToProviderApplication', {}).get('edges', [])
            consumers = interface.get('relInterfaceToConsumerApplication', {}).get('edges', [])
            
            # Track relationships for this interface
            relationship_count = 0
            
            for provider_edge in providers:
                provider_app = provider_edge.get('node', {}).get('factSheet', {})
                provider_id = provider_app.get('id')
                
                for consumer_edge in consumers:
                    consumer_app = consumer_edge.get('node', {}).get('factSheet', {})
                    consumer_id = consumer_app.get('id')
                    
                    # Only include if both are in our platform
                    if provider_id in app_ids and consumer_id in app_ids:
                        # Create unique identifier for this specific relationship
                        if relationship_count == 0:
                            # First relationship uses base identifier
                            interface_identifier = base_interface_identifier
                        else:
                            # Subsequent relationships append counter
                            interface_identifier = f"{base_interface_identifier}{relationship_count + 1}"
                        
                        # Ensure unique across all identifiers
                        interface_identifier = self._ensure_unique_identifier(
                            interface_identifier, used_identifiers, 
                            f"{interface_display_name} (relationship {relationship_count + 1})", 'Interface'
                        )
                        
                        relationship_count += 1
                        
                        app_relationships.append((
                            interface_identifier,
                            provider_id,
                            consumer_id,
                            interface_name,
                            interface_desc
                        ))
        
        # Generate DSL
        dsl = self._generate_dsl(
            platform_identifier,
            platform_name,
            platform_desc,
            organizations,
            org_to_app_relationships,
            applications,
            app_id_map,
            app_relationships,
            used_identifiers
        )
        
        # Print warnings about missing and duplicate acronyms
        self._print_acronym_warnings()
        
        return dsl
    
    
    def _print_acronym_warnings(self):
        """Print warnings about missing and duplicate acronyms."""
        if self.missing_acronyms:
            print()
            print("⚠️  WARNING: Missing Acronyms")
            print("-" * 70)
            print("The following elements are missing acronyms in LeanIX.")
            print("Temporary acronyms have been generated:")
            print()
            for item in self.missing_acronyms:
                print(f"  {item['type']}: {item['name']}")
                print(f"    → Temporary acronym: {item['temp_acronym']}")
                print(f"    → LeanIX ID: {item['id']}")
                print()
            print("Please add acronyms in LeanIX for these elements.")
            print("-" * 70)
        
        if self.duplicate_acronyms:
            print()
            print("⚠️  WARNING: Duplicate Acronyms")
            print("-" * 70)
            print("The following elements have duplicate acronyms.")
            print("'X' has been appended to resolve conflicts:")
            print()
            for item in self.duplicate_acronyms:
                print(f"  {item['type']}: {item['name']}")
                print(f"    → Original: {item['original']}")
                print(f"    → Modified: {item['modified']}")
                print()
            print("Please ensure acronyms are unique in LeanIX.")
            print("-" * 70)
    
    def _generate_dsl(
        self,
        platform_identifier: str,
        platform_name: str,
        platform_desc: str,
        organizations: Dict[str, Tuple[str, str, str, str]],
        org_to_app_relationships: List[Tuple[str, str, str]],
        applications: List[dict],
        app_id_map: Dict[str, Tuple[str, str]],
        app_relationships: List[Tuple[str, str, str, str, str]],
        used_identifiers: set
    ) -> str:
        """Generate the complete DSL string."""
        
        # Start DSL
        dsl = f'''workspace "Channel 4 Core" "Base Line Model - Generated from LeanIX" {{

    !identifiers flat

    model {{
    
        archetypes {{
            application = container
        }}
        
        /* ============================================================
           ORGANISATIONS / TEAMS (from LeanIX UserGroups)
           ============================================================ */
        
'''
        
        # Add organisations as persons using acronyms
        org_id_map = {}
        for org_id, (org_display_name, org_name, org_desc, org_acronym) in organizations.items():
            # Get identifier from acronym
            org_identifier = self._get_identifier_from_acronym(
                org_display_name, 'Organisation', org_acronym, org_id
            )
            org_identifier = self._ensure_unique_identifier(
                org_identifier, used_identifiers, org_display_name, 'Organisation'
            )
            
            org_id_map[org_id] = org_identifier
            cleaned_desc = self._clean_description(org_desc)
            desc_str = f' "{cleaned_desc}"' if cleaned_desc else ' ""'
            dsl += f'        {org_identifier} = person "{org_name}"{desc_str}\n'
        
        dsl += f'''
        /* ============================================================
           {platform_name.upper()}
           ============================================================ */
        
        {platform_identifier} = softwareSystem "{platform_name}" "{platform_desc}" {{
            
'''
        
        # Add applications as containers
        for app in applications:
            app_id = app.get('id')
            app_identifier, app_name = app_id_map.get(app_id)
            app_desc = self._clean_description(app.get('description', ''))
            
            dsl += f'            {app_identifier} = container "{app_name}" "{app_desc}" "Application"\n'
        
        dsl += '''        }
        
        /* ============================================================
           PERSON -> APPLICATION RELATIONSHIPS
           ============================================================ */
        
'''
        
        # Add person to application relationships
        for org_id, app_id, rel_desc in org_to_app_relationships:
            org_identifier = org_id_map.get(org_id)
            app_identifier, _ = app_id_map.get(app_id)
            
            if org_identifier and app_identifier:
                rel_identifier = f"{org_identifier}To{app_identifier[0].upper()}{app_identifier[1:]}"
                dsl += f'        {rel_identifier} = {org_identifier} -> {app_identifier} "{rel_desc}"\n'
        
        dsl += '''
        /* ============================================================
           APPLICATION -> APPLICATION RELATIONSHIPS (from LeanIX Interfaces)
           ============================================================ */
        
'''
        
        # Add application to application relationships
        seen_relationships = {}  # Track to detect duplicates
        for interface_identifier, provider_id, consumer_id, interface_name, interface_desc in app_relationships:
            provider_identifier, _ = app_id_map.get(provider_id)
            consumer_identifier, _ = app_id_map.get(consumer_id)
            
            if provider_identifier and consumer_identifier:
                # Always use interface name for the relationship label
                relationship_key = f"{interface_identifier}:{provider_identifier}:{consumer_identifier}"
                
                # Check for duplicate relationships
                if relationship_key in seen_relationships:
                    print(f"⚠️  WARNING: Duplicate relationship detected!")
                    print(f"    Identifier: {interface_identifier}")
                    print(f"    Provider: {provider_identifier}")
                    print(f"    Consumer: {consumer_identifier}")
                    print(f"    Name: {interface_name}")
                    print(f"    First seen: {seen_relationships[relationship_key]}")
                    print()
                else:
                    seen_relationships[relationship_key] = interface_name
                    dsl += f'        {interface_identifier} = {provider_identifier} -> {consumer_identifier} "{interface_name}" "TBC" "Integration"\n'
        
        dsl += '''        
    }
    
    views {
        
        terminology {
            person "Team"
            softwareSystem "Platform"
            container "Application"
        }
        
'''
        
        dsl += f'''        themes {self.theme_url}
        
        branding {{
            logo {self.logo_url}
            font "{self.font_name}" {self.font_url}
        }}
        
        systemContext {platform_identifier} "{platform_identifier}Context" {{
            include *
            autoLayout
        }}
        
        container {platform_identifier} "{platform_identifier}Containers" {{
            include *
            autoLayout
        }}
    }}
}}'''
        
        return dsl


def main():
    """Test the mapper with sample data."""
    from .client import LeanIXClient
    
    print("=" * 70)
    print("LeanIX to Structurizr Mapper Test")
    print("=" * 70)
    print()
    
    # Finance Systems Platform ID
    platform_id = "3f828194-de4a-4dee-9ca6-e071cc2e0eae"
    
    print(f"Fetching platform: {platform_id}")
    client = LeanIXClient()
    platform_data = client.get_platform_by_id(platform_id)
    
    print(f"âœ“ Fetched: {platform_data.get('displayName')}")
    print(f"  Type: {platform_data.get('type')}")
    print(f"  Applications: {len(platform_data.get('relTechPlatformToApplication', {}).get('edges', []))}")
    print()
    
    print("Fetching interfaces...")
    all_interfaces = client.get_all_interfaces()
    print(f"âœ“ Fetched {len(all_interfaces)} interfaces")
    print()
    
    print("Mapping to Structurizr DSL...")
    mapper = LeanIXMapper()
    dsl = mapper.map_platform_to_dsl(platform_data, all_interfaces)
    
    print("âœ“ DSL generated")
    print()
    print("Preview (first 80 lines):")
    print("-" * 70)
    lines = dsl.split('\n')
    for line in lines[:80]:
        print(line)
    print()
    print("=" * 70)


if __name__ == "__main__":
    main()