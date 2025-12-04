"""
leanix/mapper.py - LeanIX to Structurizr Mapper

Maps LeanIX fact sheets to Structurizr DSL format with enhancements:
1. URL property for each container pointing to LeanIX
2. Project names as tags (plus 'Impact' tag if projects exist)
3. SSO perspective for containers with implemented SSO
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
        self.leanix_base_url = "https://channel4.leanix.net/Channel4Prod/factsheet/Application/"
        self.duplicate_acronyms = []  # Track duplicate acronym conflicts only
    
    def _generate_temp_acronym(self, name: str) -> str:
        """
        Generate a temporary acronym from a name.
        
        Rules:
        - Multiple words: Use first letter of each word
        - Single word: Use first 4 characters (or all if less than 4)
        
        Args:
            name: Display name
            
        Returns:
            Temporary acronym (uppercase)
        """
        # Remove special characters and split
        clean = re.sub(r'[^a-zA-Z0-9\s-]', '', name)
        words = clean.split()
        
        if not words:
            return 'UNKN'
        
        if len(words) == 1:
            # Single word - use first 4 characters
            word = words[0]
            return word[:4].upper() if len(word) >= 4 else word.upper()
        else:
            # Multiple words - use first letter of each word
            acronym = ''.join(word[0].upper() for word in words if word)
            return acronym
    
    def _get_identifier_from_acronym(self, element_name: str, element_type: str, 
                                     acronym: str = None, element_id: str = None) -> str:
        """
        Get identifier from acronym field, or generate temporary one if missing.
        No logging for missing acronyms - only duplicates are logged.
        
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
            # Generate temporary acronym (no logging)
            temp_acronym = self._generate_temp_acronym(element_name)
            return temp_acronym.lower()
    
    def _ensure_unique_identifier(self, identifier: str, used_identifiers: set, 
                                  element_name: str, element_type: str, 
                                  scope: str = 'global') -> str:
        """
        Ensure identifier is unique within its scope by appending 'X' for duplicates.
        
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
        
        # Log the duplicate resolution
        self.duplicate_acronyms.append({
            'type': element_type,
            'name': element_name,
            'original': original,
            'modified': identifier,
            'scope': scope
        })
        
        used_identifiers.add(identifier)
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
    
    def _extract_application_metadata(self, app: dict) -> dict:
        """
        Extract metadata from application for DSL enhancements.
        
        Returns dict with:
        - url: LeanIX URL for the application
        - tags: List of tag names (project names + 'Impact' if projects exist)
        - sso_enabled: Boolean indicating if SSO is implemented
        
        Args:
            app: Application fact sheet from LeanIX
            
        Returns:
            Dictionary with extracted metadata
        """
        metadata = {
            'url': '',
            'tags': [],
            'sso_enabled': False
        }
        
        # 1. Build URL
        app_id = app.get('id')
        if app_id:
            metadata['url'] = f"{self.leanix_base_url}{app_id}"
        
        # 2. Extract project names as tags
        projects_edges = app.get('relApplicationToProject', {}).get('edges', [])
        project_names = []
        for edge in projects_edges:
            project_fact_sheet = edge.get('node', {}).get('factSheet', {})
            project_name = project_fact_sheet.get('name')
            if project_name:
                project_names.append(project_name)
        
        # Add project names and 'Impact' tag if projects exist
        if project_names:
            metadata['tags'] = project_names + ['Impact']
        
        # 3. Check SSO status
        sso_status = app.get('lxStatusSSOSMP')
        # Handle None and convert to lowercase if it exists
        if sso_status:
            metadata['sso_enabled'] = (sso_status.lower() == 'implemented')
        else:
            metadata['sso_enabled'] = False
        
        return metadata
    
    def _format_container_line(self, identifier: str, name: str, desc: str, 
                               hosting_type: str, metadata: dict) -> str:
        """
        Format a container line with all properties, tags, and perspectives.
        
        Args:
            identifier: Container identifier
            name: Container name
            desc: Container description
            hosting_type: Hosting type (technology field)
            metadata: Dictionary with url, tags, and sso_enabled
            
        Returns:
            Formatted DSL line for the container
        """
        # Base container definition
        line = f'{identifier} = container "{name}" "{desc}" "{hosting_type}"'
        
        # Check if we need a block (properties or perspectives)
        has_properties = metadata.get('url') or metadata.get('tags')
        has_perspectives = metadata.get('sso_enabled')
        
        if not has_properties and not has_perspectives:
            # Simple container with no enhancements
            return line
        
        # Start container block
        line += ' {\n'
        
        # Add properties
        if metadata.get('url'):
            line += f'                url {metadata["url"]}\n'
        
        # Add tags
        tags = metadata.get('tags', [])
        if tags:
            tags_str = ','.join(tags)
            line += f'                tags "{tags_str}"\n'
        
        # Add perspectives
        if has_perspectives:
            line += f'                perspectives {{\n'
            line += f'                    SSO "Authenticated using SSO"\n'
            line += f'                }}\n'
        
        # Close container block
        line += '            }'
        
        return line
    
    def _print_duplicate_warnings(self):
        """Print warnings about duplicate acronyms only (no missing acronym warnings)."""
        if self.duplicate_acronyms:
            print()
            print("⚠️  WARNING: Duplicate Acronyms Resolved")
            print("-" * 70)
            print("The following elements had duplicate acronyms.")
            print("'X' has been appended to resolve conflicts:")
            print()
            for item in self.duplicate_acronyms:
                print(f"  {item['type']}: {item['name']}")
                print(f"    → Original: {item['original']}")
                print(f"    → Modified: {item['modified']}")
                print(f"    → Scope: {item['scope']}")
                print()
            print("Please ensure acronyms are unique in LeanIX.")
            print("-" * 70)
    
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
        # Reset tracking list for this generation
        self.duplicate_acronyms = []
        
        # Track identifiers: global for platforms/persons/interfaces only
        global_identifiers = set()
        
        # Collect all platforms with their data
        all_platforms = []
        all_applications = {}  # app_id -> (app_identifier, app_name, platform_identifier, app_desc, hosting_type, metadata)
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
                
                # Extract metadata (URL, tags, SSO)
                metadata = self._extract_application_metadata(app)
                
                # Get identifier from acronym (platform-scoped, NOT globally unique!)
                app_identifier = self._get_identifier_from_acronym(
                    app_display_name, 'Application', app_acronym, app_id
                )
                app_identifier = self._ensure_unique_identifier(
                    app_identifier, platform_container_identifiers, app_display_name, 'Application', f'platform:{platform_identifier}'
                )
                
                # Store application with hosting type and metadata
                all_applications[app_id] = (app_identifier, app_name, platform_identifier, app_desc, hosting_type, metadata)
                all_platforms[-1]['applications'].append({
                    'identifier': app_identifier,
                    'name': app_name,
                    'desc': app_desc,
                    'hosting_type': hosting_type,
                    'metadata': metadata
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
        
        # Print warnings about duplicate acronyms only
        self._print_duplicate_warnings()
        
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
            # Use org_name (not display_name) for acronym generation to avoid prefixes
            org_identifier = self._get_identifier_from_acronym(
                org_name, 'Organisation', org_acronym, org_id
            )
            org_identifier = self._ensure_unique_identifier(
                org_identifier, used_identifiers, org_name, 'Organisation', 'global'
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
            
            # Add applications for this platform with enhanced metadata
            for app in platform['applications']:
                container_line = self._format_container_line(
                    app['identifier'],
                    app['name'],
                    app['desc'],
                    app['hosting_type'],
                    app['metadata']
                )
                dsl += f'            {container_line}\n'
            
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
                app_identifier, _, _, _, _, _ = all_applications.get(app_id)
                
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
                provider_identifier, _, provider_platform_id, _, _, _ = all_applications.get(provider_id)
                consumer_identifier, _, consumer_platform_id, _, _, _ = all_applications.get(consumer_id)
                
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