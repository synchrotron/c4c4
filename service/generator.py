"""
Core DSL generation service.

This module contains the business logic for generating Structurizr DSL
from LeanIX data. It can be used by both CLI and web service entry points.
"""

from typing import Optional, Dict, Any
from leanix.client import LeanIXClient
from leanix.mapper import LeanIXMapper


class GenerationResult:
    """Result of DSL generation with metadata."""

    def __init__(self, dsl: str, metadata: Dict[str, Any]):
        self.dsl = dsl
        self.metadata = metadata

    @property
    def line_count(self) -> int:
        """Get the number of lines in the DSL."""
        return len(self.dsl.split('\n'))

    @property
    def person_count(self) -> int:
        """Get the number of persons in the DSL."""
        return self.dsl.count('person "')

    @property
    def software_system_count(self) -> int:
        """Get the number of software systems in the DSL."""
        return self.dsl.count('softwareSystem "')

    @property
    def container_count(self) -> int:
        """Get the number of containers in the DSL."""
        return self.dsl.count('container "')

    @property
    def relationship_count(self) -> int:
        """Get the number of relationships in the DSL."""
        return self.dsl.count(' -> ')

    @property
    def url_count(self) -> int:
        """Get the number of LeanIX URLs in the DSL."""
        return self.dsl.count('url https://channel4.leanix.net')


class DSLGeneratorService:
    """Service for generating C4 DSL from LeanIX."""

    def __init__(self):
        """Initialize the service."""
        self.client: Optional[LeanIXClient] = None

    def connect(self) -> None:
        """Connect to LeanIX API."""
        if not self.client:
            self.client = LeanIXClient()

    def generate_dsl(
        self,
        year: int = 2026,
        tag_name: str = "Enterprise System"
    ) -> GenerationResult:
        """
        Generate Structurizr DSL from LeanIX data.

        Args:
            year: Filter projects by year (default: 2026)
            tag_name: Tag to filter platforms (default: "Enterprise System")

        Returns:
            GenerationResult containing the DSL string and metadata

        Raises:
            Exception: If connection fails or data cannot be fetched
        """
        # Ensure connection
        self.connect()

        # Fetch platforms with the specified tag
        platforms_edges = self.client.get_platforms_by_tag(tag_name, limit=100)
        platforms_data = [edge.get('node', {}) for edge in platforms_edges]

        if not platforms_data:
            raise ValueError(
                f"No platforms found with tag '{tag_name}'. "
                "Please check the tag name and ensure platforms have this tag applied."
            )

        # Fetch all interfaces
        all_interfaces = self.client.get_all_interfaces()

        # Generate DSL
        mapper = LeanIXMapper(filter_year=year)
        dsl = mapper.map_multiple_platforms_to_dsl(platforms_data, all_interfaces)

        # Prepare metadata
        metadata = {
            'year': year,
            'tag_name': tag_name,
            'platform_count': len(platforms_data),
            'interface_count': len(all_interfaces),
            'platforms': [
                {
                    'name': p.get('displayName') or p.get('name'),
                    'type': p.get('type'),
                    'app_count': len(p.get('relTechPlatformToApplication', {}).get('edges', []))
                }
                for p in platforms_data
            ]
        }

        return GenerationResult(dsl, metadata)


# Convenience function for simple usage
def generate_dsl(year: int = 2026, tag_name: str = "Enterprise System") -> str:
    """
    Generate DSL - simplified function that returns just the DSL string.

    Args:
        year: Filter projects by year (default: 2026)
        tag_name: Tag to filter platforms (default: "Enterprise System")

    Returns:
        str: The generated DSL content

    Raises:
        Exception: If connection fails or data cannot be fetched
    """
    service = DSLGeneratorService()
    result = service.generate_dsl(year=year, tag_name=tag_name)
    return result.dsl
