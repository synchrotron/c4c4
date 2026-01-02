"""
leanix/mapper.py - LeanIX to Structurizr Mapper

Maps LeanIX fact sheets to Structurizr DSL format with enhancements.

Projects (including parent projects/initiatives) are always rendered as both tags and perspectives.

Platforms (Software Systems):
- Tags: 'Impact' (if any child application has projects)
- Perspectives: All unique project names from child applications (including parent projects)
- Note: Platform perspectives are derived from child applications, NOT from direct platform-to-project relationships in LeanIX

Containers (Applications):
- URL property pointing to LeanIX
- Tags: 'SSO' (if implemented), 'Impact' (if projects exist), plus all projects
- Perspectives: All project names including parent projects

Persons (Organizations/UserGroups):
- Tags: Category (including 'Team'), 'Impact' (if projects exist), plus all projects
- Perspectives: All project names including parent projects

Container->Container Relationships (Integrations):
- Tags: 'Integration', 'Impact' (if interface has projects), plus all projects
- Perspectives: All project names including parent projects

Person->Container Relationships:
- Tags: 'Impact' (if shared projects exist), 'owner' (if usageType is 'owner'), plus shared project names (intersection of both)
- Perspectives: Shared project names (intersection of both)
"""

import re
from typing import Dict, List, Tuple


class LeanIXMapper:
    """Maps LeanIX data to Structurizr DSL format."""

    def __init__(self, filter_year=None):
        """
        Initialize mapper.

        Projects (including parent projects/initiatives) are always rendered as both tags and perspectives.

        Args:
            filter_year: Optional year (int) to filter projects. Only projects with start or end dates
                        in this year will be included. Defaults to current year (2026).
        """
        self.theme_url = "https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/c4-default-theme.json"
        self.logo_url = "https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/4-logo-black.png"
        self.font_name = "4Text"
        self.font_url = "https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/4Text-Regular.ttf"
        self.leanix_base_url = "https://channel4.leanix.net/Channel4Prod/factsheet/Application/"
        self.duplicate_acronyms = []  # Track duplicate acronym conflicts only
        self.filter_year = filter_year if filter_year is not None else 2026  # Default to current year
    
    def _should_include_project(self, project_fact_sheet: dict) -> bool:
        """
        Check if a project should be included based on filter_year.

        A project is included if it has a tag matching the filter year (e.g., "2026").
        The PMO tags projects with the year they are actively being worked on.

        Args:
            project_fact_sheet: Project fact sheet with tags array

        Returns:
            True if project should be included, False otherwise
        """
        tags = project_fact_sheet.get('tags', [])

        # If no tags, include by default to avoid losing data
        if not tags:
            return True

        # Convert filter year to string for comparison
        year_str = str(self.filter_year)

        # Check if any tag matches the filter year
        for tag in tags:
            tag_name = tag.get('name', '')
            if tag_name == year_str:
                return True

        return False

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
        - tags: List of tag names ('SSO' if implemented, 'Impact' if projects exist, plus all projects)
        - perspectives: List of perspective names (all projects including parent projects)

        Args:
            app: Application fact sheet from LeanIX

        Returns:
            Dictionary with extracted metadata
        """
        metadata = {
            'url': '',
            'tags': [],
            'perspectives': []
        }

        # 1. Build URL
        app_id = app.get('id')
        if app_id:
            metadata['url'] = f"{self.leanix_base_url}{app_id}"

        # 2. Check for projects
        projects_edges = app.get('relApplicationToProject', {}).get('edges', [])
        has_projects = len(projects_edges) > 0

        # Build tags list
        tags = []

        # Add 'SSO' tag if implemented
        sso_status = app.get('lxStatusSSOSMP')
        if sso_status and sso_status.lower() == 'implemented':
            tags.append('SSO')

        # Add 'Impact' tag if projects exist
        if has_projects:
            tags.append('Impact')

        # 3. Extract all project names (including parent projects), filtered by year
        all_project_names = []

        for edge in projects_edges:
            project_fact_sheet = edge.get('node', {}).get('factSheet', {})

            # Check if project should be included based on filter year
            if not self._should_include_project(project_fact_sheet):
                continue

            # Add the project name itself
            project_name = project_fact_sheet.get('name')
            if project_name and project_name not in all_project_names:
                all_project_names.append(project_name)

            # Get parent projects and add them too (if they match the filter)
            parent_edges = project_fact_sheet.get('relToParent', {}).get('edges', [])
            for parent_edge in parent_edges:
                parent_fact_sheet = parent_edge.get('node', {}).get('factSheet', {})

                # Check if parent project should be included
                if not self._should_include_project(parent_fact_sheet):
                    continue

                parent_name = parent_fact_sheet.get('name')
                if parent_name and parent_name not in all_project_names:
                    all_project_names.append(parent_name)

        # 4. Add all projects to both tags and perspectives
        tags.extend(all_project_names)
        metadata['perspectives'].extend(all_project_names)

        metadata['tags'] = tags

        return metadata

    def _extract_organisation_metadata(self, org: dict) -> dict:
        """
        Extract metadata from organisation (UserGroup) for DSL enhancements.

        Returns dict with:
        - category: Organisation category (including 'Team')
        - tags: List of tag names (category + 'Impact' if projects exist, plus all projects)
        - perspectives: List of perspective names (all projects including parent projects)

        Args:
            org: UserGroup fact sheet from LeanIX

        Returns:
            Dictionary with extracted metadata
        """
        metadata = {
            'category': '',
            'tags': [],
            'perspectives': []
        }

        tags_list = []

        # 1. Extract category (including 'Team')
        category = org.get('category', '')
        if category and category.strip():
            clean_category = category.strip()
            metadata['category'] = clean_category
            tags_list.append(clean_category)

        # 2. Check for projects
        projects_edges = org.get('relUserGroupToProject', {}).get('edges', [])
        has_projects = len(projects_edges) > 0

        # Add 'Impact' tag if projects exist
        if has_projects:
            tags_list.append('Impact')

        # 3. Extract all project names (including parent projects), filtered by year
        all_project_names = []

        for edge in projects_edges:
            project_fact_sheet = edge.get('node', {}).get('factSheet', {})

            # Check if project should be included based on filter year
            if not self._should_include_project(project_fact_sheet):
                continue

            # Add the project name itself
            project_name = project_fact_sheet.get('name')
            if project_name and project_name not in all_project_names:
                all_project_names.append(project_name)

            # Get parent projects and add them too (if they match the filter)
            parent_edges = project_fact_sheet.get('relToParent', {}).get('edges', [])
            for parent_edge in parent_edges:
                parent_fact_sheet = parent_edge.get('node', {}).get('factSheet', {})

                # Check if parent project should be included
                if not self._should_include_project(parent_fact_sheet):
                    continue

                parent_name = parent_fact_sheet.get('name')
                if parent_name and parent_name not in all_project_names:
                    all_project_names.append(parent_name)

        # 4. Add all projects to both tags and perspectives
        tags_list.extend(all_project_names)
        metadata['perspectives'].extend(all_project_names)

        metadata['tags'] = tags_list

        return metadata

    def _extract_platform_metadata_from_applications(self, applications_metadata: list) -> dict:
        """
        Extract metadata from platform based on its child applications' projects.

        Platform perspectives are derived from all projects associated with any application
        in the platform (not from direct platform-to-project relationships in LeanIX).

        Args:
            applications_metadata: List of metadata dicts from child applications

        Returns:
            Dictionary with tags and perspectives aggregated from child applications
        """
        metadata = {
            'tags': [],
            'perspectives': []
        }

        # Collect all unique project names from child applications
        all_project_names = []

        for app_metadata in applications_metadata:
            # Get perspectives from each application (which contain project names)
            app_perspectives = app_metadata.get('perspectives', [])
            for project_name in app_perspectives:
                if project_name and project_name not in all_project_names:
                    all_project_names.append(project_name)

        # If we have any projects, add Impact tag and add projects ONLY to perspectives (not tags)
        if all_project_names:
            metadata['tags'].append('Impact')
            metadata['perspectives'].extend(all_project_names)

        return metadata

    def _extract_interface_metadata(self, interface: dict) -> dict:
        """
        Extract metadata from interface for relationship tags and perspectives.

        Args:
            interface: Interface fact sheet from LeanIX

        Returns:
            Dictionary with 'tags' and 'perspectives' lists
        """
        metadata = {
            'tags': [],
            'perspectives': []
        }

        # Check for projects
        projects_edges = interface.get('relInterfaceToProject', {}).get('edges', [])
        has_projects = len(projects_edges) > 0

        tags = []

        # Add 'Impact' tag if projects exist
        if has_projects:
            tags.append('Impact')

        # Extract all project names (including parent projects), filtered by year
        all_project_names = []

        for edge in projects_edges:
            project_fact_sheet = edge.get('node', {}).get('factSheet', {})

            # Check if project should be included based on filter year
            if not self._should_include_project(project_fact_sheet):
                continue

            # Add the project name itself
            project_name = project_fact_sheet.get('name')
            if project_name and project_name not in all_project_names:
                all_project_names.append(project_name)

            # Get parent projects and add them too (if they match the filter)
            parent_edges = project_fact_sheet.get('relToParent', {}).get('edges', [])
            for parent_edge in parent_edges:
                parent_fact_sheet = parent_edge.get('node', {}).get('factSheet', {})

                # Check if parent project should be included
                if not self._should_include_project(parent_fact_sheet):
                    continue

                parent_name = parent_fact_sheet.get('name')
                if parent_name and parent_name not in all_project_names:
                    all_project_names.append(parent_name)

        # Add all projects to both tags and perspectives
        tags.extend(all_project_names)
        metadata['perspectives'].extend(all_project_names)

        metadata['tags'] = tags

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
            metadata: Dictionary with url, tags, and perspectives

        Returns:
            Formatted DSL line for the container
        """
        # Base container definition
        line = f'{identifier} = container "{name}" "{desc}" "{hosting_type}"'

        # Check if we need a block (properties or perspectives)
        has_properties = metadata.get('url') or metadata.get('tags')
        has_perspectives = metadata.get('perspectives')

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
            # Add initiative perspectives
            for initiative in metadata.get('perspectives', []):
                line += f'                    "{initiative}" "{initiative}"\n'
            line += f'                }}\n'

        # Close container block
        line += '            }'

        return line
    
    def _format_person_line(self, identifier: str, name: str, desc: str,
                            metadata: dict) -> str:
        """
        Format a person line with optional tags and perspectives blocks.

        Args:
            identifier: Person identifier
            name: Person name
            desc: Person description
            metadata: Dictionary with category, tags, and perspectives

        Returns:
            Formatted DSL line for the person
        """
        # Base person definition
        desc_str = f' "{desc}"' if desc else ' ""'

        tags = metadata.get('tags', [])
        perspectives = metadata.get('perspectives', [])

        if not tags and not perspectives:
            # Simple person with no tags or perspectives
            return f'{identifier} = person "{name}"{desc_str}'

        # Person with tags and/or perspectives block
        line = f'{identifier} = person "{name}"{desc_str} {{\n'

        if tags:
            tags_str = ','.join(tags)
            line += f'            tags "{tags_str}"\n'

        if perspectives:
            line += f'            perspectives {{\n'
            for initiative in perspectives:
                line += f'                "{initiative}" "{initiative}"\n'
            line += f'            }}\n'

        line += '        }'

        return line

    def _format_platform_line(self, identifier: str, name: str, desc: str,
                              metadata: dict, applications_block: str) -> str:
        """
        Format a platform (software system) line with optional tags and perspectives blocks.

        Args:
            identifier: Platform identifier
            name: Platform name
            desc: Platform description
            metadata: Dictionary with tags and perspectives
            applications_block: The formatted applications content to include inside the platform block

        Returns:
            Formatted DSL block for the platform
        """
        tags = metadata.get('tags', [])
        perspectives = metadata.get('perspectives', [])

        # Start platform block
        line = f'{identifier} = softwareSystem "{name}" "{desc}" {{\n'

        # Add tags if present
        if tags:
            tags_str = ','.join(tags)
            line += f'            tags "{tags_str}"\n'

        # Add perspectives if present
        if perspectives:
            line += f'            perspectives {{\n'
            for initiative in perspectives:
                line += f'                "{initiative}" "{initiative}"\n'
            line += f'            }}\n'

        # Add spacing before applications if we had tags or perspectives
        if tags or perspectives:
            line += '\n'

        # Add applications content
        line += applications_block

        # Close platform block
        line += '        }'

        return line

    def _format_relationship_tags(self, base_tags: list, project_tags: list) -> str:
        """
        Format relationship tags string combining base tags with project tags.

        Args:
            base_tags: Base tags (e.g., ['Integration'])
            project_tags: Project tags from interface

        Returns:
            Comma-separated tags string
        """
        all_tags = list(base_tags)  # Copy base tags
        all_tags.extend(project_tags)
        return ','.join(all_tags)

    def _format_relationship_with_perspectives(self, rel_id: str, source_id: str,
                                                target_id: str, description: str,
                                                technology: str, tags: str, perspectives: list) -> str:
        """
        Format a relationship with technology, optional tags and perspectives block.

        Args:
            rel_id: Relationship identifier
            source_id: Source element identifier
            target_id: Target element identifier (qualified if needed)
            description: Relationship description
            technology: Technology string (usually empty for person->container)
            tags: Comma-separated tags string (empty string if no tags)
            perspectives: List of initiative names to add as perspectives

        Returns:
            Formatted DSL line for the relationship
        """
        # Build base relationship with technology
        if tags:
            base = f'{rel_id} = {source_id} -> {target_id} "{description}" "{technology}" "{tags}"'
        else:
            base = f'{rel_id} = {source_id} -> {target_id} "{description}" "{technology}"'

        if not perspectives:
            # Simple relationship with no perspectives
            return base

        # Relationship with perspectives block
        line = base + ' {\n'
        line += f'            perspectives {{\n'
        for initiative in perspectives:
            line += f'                "{initiative}" "{initiative}"\n'
        line += f'            }}\n'
        line += '        }'

        return line

    def _format_relationship_with_tags_and_perspectives(self, rel_id: str, source_id: str,
                                                         target_id: str, description: str,
                                                         technology: str, tags: str,
                                                         perspectives: list) -> str:
        """
        Format a relationship with technology, tags, and optional perspectives.

        Args:
            rel_id: Relationship identifier
            source_id: Source element identifier
            target_id: Target element identifier (qualified if needed)
            description: Relationship description
            technology: Technology string
            tags: Comma-separated tags string
            perspectives: List of initiative names to add as perspectives

        Returns:
            Formatted DSL line for the relationship
        """
        if not perspectives:
            # Simple relationship with no perspectives
            return f'{rel_id} = {source_id} -> {target_id} "{description}" "{technology}" "{tags}"'

        # Relationship with perspectives block
        line = f'{rel_id} = {source_id} -> {target_id} "{description}" "{technology}" "{tags}" {{\n'
        line += f'            perspectives {{\n'
        for initiative in perspectives:
            line += f'                "{initiative}" "{initiative}"\n'
        line += f'            }}\n'
        line += '        }'

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
        all_organizations = {}  # org_id -> (org_display_name, org_name, org_desc, org_acronym, org_metadata)
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

            # Store platform info (metadata will be calculated later from applications)
            all_platforms.append({
                'identifier': platform_identifier,
                'name': platform_name,
                'desc': platform_desc,
                'metadata': None,  # Will be populated after processing applications
                'applications': []
            })

            # Platform-scoped container identifiers (can duplicate across platforms!)
            platform_container_identifiers = set()

            # Track application metadata for this platform
            platform_app_metadata = []

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

                # Track metadata for platform aggregation
                platform_app_metadata.append(metadata)

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

                    # Get usageType from the relationship node
                    usage_type = (node.get('usageType') or '').strip()

                    # Get the actual UserGroup factSheet
                    org = node.get('factSheet', {})
                    if org:
                        org_id = org.get('id')
                        org_display_name = org.get('displayName')
                        org_name = org.get('name') or org_display_name
                        org_desc = self._clean_description(org.get('description', ''))
                        org_acronym = org.get('acronym')
                        
                        # Extract organisation metadata (category and projects)
                        org_metadata = self._extract_organisation_metadata(org)
                        
                        # Store organisation (only if new)
                        if org_id not in all_organizations:
                            all_organizations[org_id] = (org_display_name, org_name, org_desc, org_acronym, org_metadata)
                        
                        # Store relationship with cleaned description from node
                        # Include platform_identifier for qualified references and usageType
                        all_org_to_app_relationships.append((org_id, app_id, platform_identifier, rel_description, usage_type))

            # Calculate platform metadata from its applications
            platform_metadata = self._extract_platform_metadata_from_applications(platform_app_metadata)
            all_platforms[-1]['metadata'] = platform_metadata

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

            # Get dataFlowDirection from interface
            data_flow_direction = interface.get('dataFlowDirection')

            # Extract metadata (tags and perspectives) for the interface
            interface_metadata = self._extract_interface_metadata(interface)

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
                            technology,
                            interface_metadata['tags'],
                            interface_metadata['perspectives'],
                            data_flow_direction
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
        
        # Add organisations as persons using acronyms with metadata (category and project tags)
        org_id_map = {}
        for org_id, (org_display_name, org_name, org_desc, org_acronym, org_metadata) in organizations.items():
            # Get identifier from acronym
            # Use org_name (not display_name) for acronym generation to avoid prefixes
            org_identifier = self._get_identifier_from_acronym(
                org_name, 'Organisation', org_acronym, org_id
            )
            org_identifier = self._ensure_unique_identifier(
                org_identifier, used_identifiers, org_name, 'Organisation', 'global'
            )
            
            org_id_map[org_id] = org_identifier
            
            # Format person line with tags
            person_line = self._format_person_line(org_identifier, org_name, org_desc, org_metadata)
            dsl += f'        {person_line}\n'
        
        # Add each platform as a software system
        for platform in all_platforms:
            dsl += f'''
        /* ============================================================
           {platform["name"].upper()}
           ============================================================ */

'''

            # Build applications block
            applications_block = ''
            for app in platform['applications']:
                container_line = self._format_container_line(
                    app['identifier'],
                    app['name'],
                    app['desc'],
                    app['hosting_type'],
                    app['metadata']
                )
                applications_block += f'            {container_line}\n'

            # Format platform with tags, perspectives, and applications
            platform_line = self._format_platform_line(
                platform["identifier"],
                platform["name"],
                platform["desc"],
                platform["metadata"],
                applications_block
            )
            dsl += f'        {platform_line}\n'
        
        dsl += '''
        /* ============================================================
           PERSON -> APPLICATION RELATIONSHIPS
           ============================================================ */

'''

        # Track relationship identifiers to prevent duplicates
        relationship_identifiers_used = set()

        # Add person to application relationships with qualified identifiers (deduplicated)
        # Include Impact tag if either person or container has projects
        # Include initiative perspectives when both person and container share the same initiative
        for org_id, app_id, platform_identifier, rel_desc, usage_type in org_to_app_relationships:
            org_identifier = org_id_map.get(org_id)
            if app_id in all_applications:
                app_identifier, _, _, _, _, app_metadata = all_applications.get(app_id)

                if org_identifier and app_identifier:
                    rel_identifier = f"{org_identifier}To{app_identifier[0].upper()}{app_identifier[1:]}"

                    # Only add if we haven't seen this relationship identifier before
                    if rel_identifier not in relationship_identifiers_used:
                        relationship_identifiers_used.add(rel_identifier)

                        # Get metadata for both person and container
                        org_display_name, org_name, org_desc, org_acronym, org_metadata = organizations.get(org_id)

                        # Collect ALL projects from both person and container (from both tags and perspectives)
                        # We need to look at the source data to get all projects regardless of mode
                        org_all_projects = set()
                        app_all_projects = set()

                        # Get projects from perspectives (if mode uses perspectives)
                        org_all_projects.update(org_metadata.get('perspectives', []))
                        app_all_projects.update(app_metadata.get('perspectives', []))

                        # Get projects from tags (if mode uses tags) - need to extract project names from tags
                        # Tags include SSO, Impact, Category, and project names
                        org_tags = org_metadata.get('tags', [])
                        app_tags = app_metadata.get('tags', [])

                        # Filter out non-project tags to get project names
                        non_project_tags = {'SSO', 'Impact', 'Integration', 'Team', org_metadata.get('category', '')}
                        org_project_tags = [tag for tag in org_tags if tag not in non_project_tags and tag]
                        app_project_tags = [tag for tag in app_tags if tag not in non_project_tags and tag]

                        org_all_projects.update(org_project_tags)
                        app_all_projects.update(app_project_tags)

                        # Find shared projects
                        shared_projects = list(org_all_projects & app_all_projects)

                        # Build relationship tags and perspectives based on mode
                        relationship_tags_list = []
                        relationship_perspectives = []

                        # Add 'Impact' tag if there are shared projects
                        if len(shared_projects) > 0:
                            relationship_tags_list.append('Impact')

                        # Add 'owner' tag if usageType is 'owner'
                        if usage_type and usage_type.lower() == 'owner':
                            relationship_tags_list.append('owner')

                        # Add shared projects to both tags and perspectives
                        relationship_tags_list.extend(shared_projects)
                        relationship_perspectives.extend(shared_projects)

                        # Format tags as comma-separated string
                        relationship_tags = ','.join(relationship_tags_list) if relationship_tags_list else ''

                        # Format relationship with technology (empty), tags, and perspectives
                        qualified_target = f'{platform_identifier}.{app_identifier}'
                        rel_line = self._format_relationship_with_perspectives(
                            rel_identifier, org_identifier, qualified_target, rel_desc,
                            '', relationship_tags, relationship_perspectives
                        )
                        dsl += f'        {rel_line}\n'
        
        dsl += '''
        /* ============================================================
           APPLICATION -> APPLICATION RELATIONSHIPS (from LeanIX Interfaces)
           ============================================================ */
        
'''
        
        # Add application to application relationships with qualified identifiers, tags, and perspectives
        for interface_identifier, provider_id, consumer_id, interface_name, technology, project_tags, initiative_perspectives, data_flow_direction in all_app_relationships:
            if provider_id in all_applications and consumer_id in all_applications:
                provider_identifier, _, provider_platform_id, _, _, _ = all_applications.get(provider_id)
                consumer_identifier, _, consumer_platform_id, _, _, _ = all_applications.get(consumer_id)

                # Determine source and target based on dataFlowDirection
                # Default (not set/null/empty) or 'outgoing': provider -> consumer
                # 'incoming': consumer -> provider (reversed)
                # 'bidirectional': provider -> consumer (same as default)
                if data_flow_direction == 'incoming':
                    # Reverse the direction
                    source_identifier = consumer_identifier
                    source_platform_id = consumer_platform_id
                    target_identifier = provider_identifier
                    target_platform_id = provider_platform_id
                else:
                    # Default: provider -> consumer (for null, empty, 'outgoing', 'bidirectional')
                    source_identifier = provider_identifier
                    source_platform_id = provider_platform_id
                    target_identifier = consumer_identifier
                    target_platform_id = consumer_platform_id

                # Prepend technology based on dataFlowDirection
                if not data_flow_direction or data_flow_direction == '':
                    technology_prefix = 'XXXX'
                elif data_flow_direction == 'outgoing':
                    technology_prefix = 'Outgoing'
                elif data_flow_direction == 'incoming':
                    technology_prefix = 'Incoming'
                elif data_flow_direction == 'bidirectional':
                    technology_prefix = 'Bidirectional'
                else:
                    technology_prefix = 'XXXX'

                # Prepend technology with the prefix
                modified_technology = f'{technology_prefix} - {technology}'

                # Prepend interface name and add tag for 'not set' case
                if not data_flow_direction or data_flow_direction == '':
                    modified_interface_name = f'DIRECTION NOT SET - {interface_name}'
                    # Add 'Direction not set' tag to project tags
                    modified_project_tags = project_tags + ['Direction not set']
                else:
                    modified_interface_name = interface_name
                    modified_project_tags = project_tags

                # Build relationship tags: Integration + project tags (Impact if projects exist)
                relationship_tags = self._format_relationship_tags(['Integration'], modified_project_tags)

                # Use qualified identifiers: source_platform.source_app -> target_platform.target_app
                qualified_source = f'{source_platform_id}.{source_identifier}'
                qualified_target = f'{target_platform_id}.{target_identifier}'
                rel_line = self._format_relationship_with_tags_and_perspectives(
                    interface_identifier, qualified_source, qualified_target,
                    modified_interface_name, modified_technology, relationship_tags, initiative_perspectives
                )
                dsl += f'        {rel_line}\n'
        
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

        systemLandscape c4_landscape "Landscape diagram of all platforms and users" {{
            include *
            
        }}

    }}
}}'''
        
        return dsl