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
                                  element_name: str, element_type: str, 
                                  scope: str = 'global') -> str:
        """
        Ensure identifier is unique within its scope.
        
        With hierarchical identifiers:
        - Platforms, Persons, and Interfaces need global uniqueness
        - Applications/Containers are scoped within their platform, so duplicates across platforms are OK
        
        Args:
            identifier: Proposed identifier
            used_identifiers: Set of already used identifiers (pass platform-scoped set for containers)
            element_name: Display name for logging
            element_type: Type of element for logging
            scope: 'global' for platforms/persons/interfaces, 'platform' for containers
            
        Returns:
            Unique identifier (within scope)
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
        
        # Only log if it's a global-scope duplicate (cross-platform duplicates are now OK for containers)
        if scope == 'global':
            self.duplicate_acronyms.append({
                'type': element_type,
                'name': element_name,
                'original': original,
                'modified': identifier,
                'reason': 'Global scope conflict'
            })
        else:
            # Platform-scoped duplicate (within same platform - should be rare)
            self.duplicate_acronyms.append({
                'type': element_type,
                'name': element_name,
                'original': original,
                'modified': identifier,
                'reason': f'Duplicate within {scope}'
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
        Clean description text for DSL output.
        
        Rules:
        - Single line (no newlines)
        - No double quotes (replace with single quotes)
        - Maximum 100 characters
        - Trim whitespace
        
        Args:
            desc: Raw description text
            
        Returns:
            Cleaned description text safe for DSL
        """
        if not desc:
            return ''
        
        # Replace newlines with spaces
        desc = ' '.join(desc.split())
        
        # Replace double quotes with single quotes
        desc = desc.replace('"', "'")
        
        # Trim to reasonable length (100 chars)
        if len(desc) > 100:
            desc = desc[:97] + '...'
        
        # Final trim
        desc = desc.strip()
        
        return desc
    
    def _extract_technology_from_components(self, it_components: list) -> str:
        """
        Extract technology keywords from IT component names.
        
        Looks for: Mule, Automate, SFTP, HTTP in component names.
        
        Args:
            it_components: List of IT component fact sheets
            
        Returns:
            Comma-separated technology string or "Alternative" if none found
        """
        keywords = ['Mule', 'Automate', 'SFTP', 'HTTP']
        found_technologies = []
        
        for component in it_components:
            component_name = component.get('name', '') or component.get('displayName', '')
            
            # Check for each keyword in the component name (case-insensitive)
            for keyword in keywords:
                if keyword.lower() in component_name.lower():
                    if keyword not in found_technologies:
                        found_technologies.append(keyword)
        
        if found_technologies:
            return ', '.join(found_technologies)
        else:
            return 'Alternative'
    
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
        
        # Track identifiers: global for platforms/persons/interfaces, per-platform for containers
        global_identifiers = set()
        platform_container_identifiers = set()  # Scoped to this platform only
        
        platform_id = platform_data.get('id')
        platform_name = platform_data.get('displayName') or platform_data.get('name')
        platform_desc = platform_data.get('description', 'Platform from LeanIX')
        platform_acronym = platform_data.get('acronym')
        
        # Get platform identifier from acronym (globally unique)
        platform_identifier = self._get_identifier_from_acronym(
            platform_name, 'Platform', platform_acronym, platform_id
        )
        platform_identifier = self._ensure_unique_identifier(
            platform_identifier, global_identifiers, platform_name, 'Platform', 'global'
        )
        
        # Extract child applications (containers) with hosting type
        applications = []
        app_hosting_types = {}  # app_id -> hosting_type
        rel_to_apps = platform_data.get('relTechPlatformToApplication', {}).get('edges', [])
        for edge in rel_to_apps:
            app = edge.get('node', {}).get('factSheet', {})
            if app:
                applications.append(app)
                app_id = app.get('id')
                # Extract lxHostingType
                hosting_type = app.get('lxHostingType', '') or ''
                app_hosting_types[app_id] = hosting_type
        
        # Build application ID to identifier mapping using acronyms
        # Containers only need uniqueness within their platform
        app_id_map = {}
        app_ids = set()
        for app in applications:
            app_id = app.get('id')
            app_ids.add(app_id)
            app_display_name = app.get('displayName') or app.get('name')
            app_name = app.get('name') or app_display_name
            app_acronym = app.get('acronym')
            
            # Get identifier from acronym (platform-scoped uniqueness)
            app_identifier = self._get_identifier_from_acronym(
                app_display_name, 'Application', app_acronym, app_id
            )
            app_identifier = self._ensure_unique_identifier(
                app_identifier, platform_container_identifiers, app_display_name, 'Application', f'platform:{platform_identifier}'
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
                # Get the relationship node which contains both description and factSheet
                node = edge.get('node', {})
                
                # Get relationship description from the node and clean it
                raw_rel_description = node.get('description', '').strip()
                rel_description = self._clean_description(raw_rel_description) or 'Uses'
                
                # Get the actual UserGroup factSheet
                org = node.get('factSheet', {})
                if org:
                    org_id = org.get('id')
                    org_display_name = org.get('displayName')
                    org_name = org.get('name') or org_display_name
                    org_desc = org.get('description', '')
                    org_acronym = org.get('acronym')
                    
                    # Store organisation
                    if org_id not in organizations:
                        organizations[org_id] = (org_display_name, org_name, org_desc, org_acronym)
                    
                    # Store relationship with cleaned description from node
                    org_to_app_relationships.append((org_id, app_id, rel_description))
        
        # Extract application-to-application relationships from interfaces
        app_relationships = []
        relationship_counter = {}  # Track how many relationships per interface
        
        for interface_edge in all_interfaces:
            interface = interface_edge.get('node', {})
            interface_id = interface.get('id')
            interface_display_name = interface.get('displayName') or interface.get('name', 'Integration')
            # Use interface name for description (not the description field)
            interface_name = interface.get('name') or interface_display_name
            interface_acronym = interface.get('acronym')
            
            # Get IT components to extract technology
            it_components_edges = interface.get('relInterfaceToITComponent', {}).get('edges', [])
            it_components = [edge.get('node', {}).get('factSheet', {}) for edge in it_components_edges]
            technology = self._extract_technology_from_components(it_components)
            
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
                        
                        # Ensure unique globally (interfaces are relationship identifiers)
                        interface_identifier = self._ensure_unique_identifier(
                            interface_identifier, global_identifiers, 
                            f"{interface_display_name} (relationship {relationship_count + 1})", 'Interface', 'global'
                        )
                        
                        relationship_count += 1
                        
                        app_relationships.append((
                            interface_identifier,
                            provider_id,
                            consumer_id,
                            interface_name,
                            technology
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
            app_hosting_types,
            app_relationships,
            global_identifiers
        )
        
        # Print warnings about missing and duplicate acronyms
        self._print_acronym_warnings()
        
        return dsl
    
    def map_multiple_platforms_to_dsl(self, platforms_data: list, all_interfaces: list) -> str:
        """
        Map multiple LeanIX platforms to a single Structurizr DSL workspace.
        
        With hierarchical identifiers, containers (applications) are scoped within their
        platform, so the same acronym can be reused across platforms (e.g., fsp.ebs and hrp.ebs).
        
        Args:
            platforms_data: List of platform fact sheets from LeanIX
            all_interfaces: List of all interface fact sheets
            
        Returns:
            Complete Structurizr DSL as string
        """
        # Reset tracking lists for this generation
        self.missing_acronyms = []
        self.duplicate_acronyms = []
        
        # Track identifiers: global for platforms/persons/interfaces only
        global_identifiers = set()
        
        # Collect all platforms with their data
        all_platforms = []
        all_applications = {}  # app_id -> (app_identifier, app_name, platform_identifier, app_desc, hosting_type)
        all_organizations = {}  # org_id -> (org_display_name, org_name, org_desc, org_acronym)
        all_org_to_app_relationships = []
        
        # Process each platform
        for platform_data in platforms_data:
            platform_id = platform_data.get('id')
            platform_name = platform_data.get('displayName') or platform_data.get('name')
            platform_desc = self._clean_description(platform_data.get('description', ''))
            if not platform_desc:
                platform_desc = 'Platform from LeanIX'
            platform_acronym = platform_data.get('acronym')
            
            # Get platform identifier from acronym (globally unique)
            platform_identifier = self._get_identifier_from_acronym(
                platform_name, 'Platform', platform_acronym, platform_id
            )
            platform_identifier = self._ensure_unique_identifier(
                platform_identifier, global_identifiers, platform_name, 'Platform', 'global'
            )
            
            # Extract child applications
            applications = []
            rel_to_apps = platform_data.get('relTechPlatformToApplication', {}).get('edges', [])
            for edge in rel_to_apps:
                app = edge.get('node', {}).get('factSheet', {})
                if app:
                    applications.append(app)
            
            # Store platform info
            all_platforms.append({
                'identifier': platform_identifier,
                'name': platform_name,
                'desc': platform_desc,
                'applications': []
            })
            
            # Platform-scoped container identifiers (can duplicate across platforms!)
            platform_container_identifiers = set()
            
            # Process applications for this platform
            for app in applications:
                app_id = app.get('id')
                app_display_name = app.get('displayName') or app.get('name')
                app_name = app.get('name') or app_display_name
                app_acronym = app.get('acronym')
                app_desc = self._clean_description(app.get('description', ''))
                # Extract lxHostingType
                hosting_type = app.get('lxHostingType', '') or ''
                
                # Get identifier from acronym (platform-scoped, NOT globally unique!)
                app_identifier = self._get_identifier_from_acronym(
                    app_display_name, 'Application', app_acronym, app_id
                )
                app_identifier = self._ensure_unique_identifier(
                    app_identifier, platform_container_identifiers, app_display_name, 'Application', f'platform:{platform_identifier}'
                )
                
                # Store application with hosting type
                all_applications[app_id] = (app_identifier, app_name, platform_identifier, app_desc, hosting_type)
                all_platforms[-1]['applications'].append({
                    'identifier': app_identifier,
                    'name': app_name,
                    'desc': app_desc,
                    'hosting_type': hosting_type
                })
                
                # Get organisations from this application
                app_orgs = app.get('relApplicationToUserGroup', {}).get('edges', [])
                for edge in app_orgs:
                    # Get the relationship node which contains both description and factSheet
                    node = edge.get('node', {})
                    
                    # Get relationship description from the node and clean it
                    raw_rel_description = node.get('description', '').strip()
                    rel_description = self._clean_description(raw_rel_description) or 'Uses'
                    
                    # Get the actual UserGroup factSheet
                    org = node.get('factSheet', {})
                    if org:
                        org_id = org.get('id')
                        org_display_name = org.get('displayName')
                        org_name = org.get('name') or org_display_name
                        org_desc = self._clean_description(org.get('description', ''))
                        org_acronym = org.get('acronym')
                        
                        # Store organisation (only if new)
                        if org_id not in all_organizations:
                            all_organizations[org_id] = (org_display_name, org_name, org_desc, org_acronym)
                        
                        # Store relationship with cleaned description from node
                        # Include platform_identifier for qualified references
                        all_org_to_app_relationships.append((org_id, app_id, platform_identifier, rel_description))
        
        # Build set of all application IDs for interface filtering
        all_app_ids = set(all_applications.keys())
        
        # Extract application-to-application relationships from interfaces
        all_app_relationships = []
        
        for interface_edge in all_interfaces:
            interface = interface_edge.get('node', {})
            interface_id = interface.get('id')
            interface_display_name = interface.get('displayName') or interface.get('name', 'Integration')
            # Use interface name for description (not the description field)
            interface_name = interface.get('name') or interface_display_name
            interface_acronym = interface.get('acronym')
            
            # Get IT components to extract technology
            it_components_edges = interface.get('relInterfaceToITComponent', {}).get('edges', [])
            it_components = [edge.get('node', {}).get('factSheet', {}) for edge in it_components_edges]
            technology = self._extract_technology_from_components(it_components)
            
            # Get base identifier from acronym
            base_interface_identifier = self._get_identifier_from_acronym(
                interface_display_name, 'Interface', interface_acronym, interface_id
            )
            
            # Get provider and consumer relationships
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
                    
                    # Include if both are in any of our platforms
                    if provider_id in all_app_ids and consumer_id in all_app_ids:
                        # Create unique identifier for this specific relationship
                        if relationship_count == 0:
                            interface_identifier = base_interface_identifier
                        else:
                            interface_identifier = f"{base_interface_identifier}{relationship_count + 1}"
                        
                        # Ensure unique globally (interfaces are relationship identifiers)
                        interface_identifier = self._ensure_unique_identifier(
                            interface_identifier, global_identifiers,
                            f"{interface_display_name} (relationship {relationship_count + 1})", 'Interface', 'global'
                        )
                        
                        relationship_count += 1
                        
                        all_app_relationships.append((
                            interface_identifier,
                            provider_id,
                            consumer_id,
                            interface_name,
                            technology
                        ))
        
        # Generate DSL with all platforms
        dsl = self._generate_multi_platform_dsl(
            all_platforms,
            all_organizations,
            all_org_to_app_relationships,
            all_applications,
            all_app_relationships,
            global_identifiers
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
        app_hosting_types: Dict[str, str],
        app_relationships: List[Tuple[str, str, str, str, str]],
        used_identifiers: set
    ) -> str:
        """Generate the complete DSL string for single platform."""
        
        # Start DSL with hierarchical identifiers
        dsl = f'''workspace "Channel 4 Core" "Base Line Model - Generated from LeanIX" {{

    !identifiers hierarchical

    model {{
    
        archetypes {{
            application = container
        }}
        
        /* ============================================================
           ORGANISATIONS / TEAMS (from LeanIX UserGroups)
           ============================================================ */
        
'''
        
        # Add organisations as persons using acronyms (globally unique)
        org_id_map = {}
        for org_id, (org_display_name, org_name, org_desc, org_acronym) in organizations.items():
            # Get identifier from acronym
            org_identifier = self._get_identifier_from_acronym(
                org_display_name, 'Organisation', org_acronym, org_id
            )
            org_identifier = self._ensure_unique_identifier(
                org_identifier, used_identifiers, org_display_name, 'Organisation', 'global'
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
        
        # Add applications as containers with hosting type
        for app in applications:
            app_id = app.get('id')
            app_identifier, app_name = app_id_map.get(app_id)
            app_desc = self._clean_description(app.get('description', ''))
            # Get hosting type from app_hosting_types
            hosting_type = app_hosting_types.get(app_id, '')
            
            dsl += f'            {app_identifier} = container "{app_name}" "{app_desc}" "{hosting_type}"\n'
        
        dsl += '''        }
        
        /* ============================================================
           PERSON -> APPLICATION RELATIONSHIPS
           ============================================================ */
        
'''
        
        # Add person to application relationships with qualified identifiers
        for org_id, app_id, rel_desc in org_to_app_relationships:
            org_identifier = org_id_map.get(org_id)
            app_identifier, _ = app_id_map.get(app_id)
            
            if org_identifier and app_identifier:
                rel_identifier = f"{org_identifier}To{app_identifier[0].upper()}{app_identifier[1:]}"
                # Use qualified identifier: person -> platform.container
                dsl += f'        {rel_identifier} = {org_identifier} -> {platform_identifier}.{app_identifier} "{rel_desc}"\n'
        
        dsl += '''
        /* ============================================================
           APPLICATION -> APPLICATION RELATIONSHIPS (from LeanIX Interfaces)
           ============================================================ */
        
'''
        
        # Add application to application relationships with qualified identifiers
        for interface_identifier, provider_id, consumer_id, interface_name, technology in app_relationships:
            provider_identifier, _ = app_id_map.get(provider_id)
            consumer_identifier, _ = app_id_map.get(consumer_id)
            
            if provider_identifier and consumer_identifier:
                # Use qualified identifiers: platform.container -> platform.container
                dsl += f'        {interface_identifier} = {platform_identifier}.{provider_identifier} -> {platform_identifier}.{consumer_identifier} "{interface_name}" "{technology}" "Integration"\n'
        
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
    }}
}}'''
        
        return dsl

    def _generate_multi_platform_dsl(
        self,
        all_platforms: list,
        organizations: dict,
        org_to_app_relationships: list,
        all_applications: dict,
        all_app_relationships: list,
        used_identifiers: set
    ) -> str:
        """Generate DSL for multiple platforms in a single workspace with hierarchical identifiers."""
        
        # Start DSL with hierarchical identifiers
        dsl = f'''workspace "Channel 4 Core" "Enterprise Systems - Generated from LeanIX" {{

    !identifiers hierarchical

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
            desc_str = f' "{org_desc}"' if org_desc else ' ""' 
            dsl += f'        {org_identifier} = person "{org_name}"{desc_str}\n'
        
        # Add each platform as a software system
        for platform in all_platforms:
            dsl += f'''
        /* ============================================================
           {platform["name"].upper()}
           ============================================================ */
        
        {platform["identifier"]} = softwareSystem "{platform["name"]}" "{platform["desc"]}" {{
            
'''
            
            # Add applications for this platform with hosting type
            for app in platform['applications']:
                # Use hosting_type from application data
                hosting_type = app.get('hosting_type', '')
                dsl += f'            {app["identifier"]} = container "{app["name"]}" "{app["desc"]}" "{hosting_type}"\n'
            
            dsl += '        }\n'
        
        dsl += '''        
        /* ============================================================
           PERSON -> APPLICATION RELATIONSHIPS
           ============================================================ */
        
'''
        
        # Track relationship identifiers to prevent duplicates
        relationship_identifiers_used = set()
        
        # Add person to application relationships with qualified identifiers (deduplicated)
        for org_id, app_id, platform_identifier, rel_desc in org_to_app_relationships:
            org_identifier = org_id_map.get(org_id)
            if app_id in all_applications:
                app_identifier, _, _, _, _ = all_applications.get(app_id)
                
                if org_identifier and app_identifier:
                    rel_identifier = f"{org_identifier}To{app_identifier[0].upper()}{app_identifier[1:]}"
                    
                    # Only add if we haven't seen this relationship identifier before
                    if rel_identifier not in relationship_identifiers_used:
                        relationship_identifiers_used.add(rel_identifier)
                        # Use qualified identifier: person -> platform.container
                        dsl += f'        {rel_identifier} = {org_identifier} -> {platform_identifier}.{app_identifier} "{rel_desc}"\n'
        
        dsl += '''
        /* ============================================================
           APPLICATION -> APPLICATION RELATIONSHIPS (from LeanIX Interfaces)
           ============================================================ */
        
'''
        
        # Add application to application relationships with qualified identifiers
        for interface_identifier, provider_id, consumer_id, interface_name, technology in all_app_relationships:
            if provider_id in all_applications and consumer_id in all_applications:
                provider_identifier, _, provider_platform_id, _, _ = all_applications.get(provider_id)
                consumer_identifier, _, consumer_platform_id, _, _ = all_applications.get(consumer_id)
                
                # Use qualified identifiers: provider_platform.provider_app -> consumer_platform.consumer_app
                dsl += f'        {interface_identifier} = {provider_platform_id}.{provider_identifier} -> {consumer_platform_id}.{consumer_identifier} "{interface_name}" "{technology}" "Integration"\n'
        
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
    }}
}}'''
        
        return dsl