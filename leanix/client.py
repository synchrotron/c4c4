"""
leanix/client.py - LeanIX GraphQL Client

Handles authentication and GraphQL queries to LeanIX API.
"""

import os
import requests
from typing import Dict, Any, Optional
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport
from dotenv import load_dotenv


class LeanIXClient:
    """Client for interacting with LeanIX GraphQL API."""
    
    def __init__(self, api_token: Optional[str] = None, graphql_url: Optional[str] = None):
        """
        Initialize LeanIX client.
        
        Args:
            api_token: LeanIX API token (defaults to LEANIX_API_TOKEN env var)
            graphql_url: LeanIX GraphQL endpoint (defaults to LEANIX_GRAPHQL_URL env var)
        """
        # Load environment variables
        load_dotenv()
        
        self.api_token = api_token or os.getenv('LEANIX_API_TOKEN')
        self.graphql_url = graphql_url or os.getenv('LEANIX_GRAPHQL_URL')
        
        if not self.api_token:
            raise ValueError("LeanIX API token not provided. Set LEANIX_API_TOKEN environment variable.")
        
        if not self.graphql_url:
            raise ValueError("LeanIX GraphQL URL not provided. Set LEANIX_GRAPHQL_URL environment variable.")
        
        # Get access token from API token
        self.access_token = self._get_access_token()
        
        # Set up transport with authentication
        self.transport = RequestsHTTPTransport(
            url=self.graphql_url,
            headers={
                'Authorization': f'Bearer {self.access_token}',
                'Content-Type': 'application/json',
            },
            verify=True,
            retries=3,
        )
        
        # Create GQL client
        self.client = Client(
            transport=self.transport,
            fetch_schema_from_transport=False,  # Don't fetch schema to speed up
        )
    
    def _get_access_token(self) -> str:
        """
        Exchange API token for access token.
        LeanIX requires exchanging the API token for a temporary access token.
        
        Returns:
            Access token string
        """
        # Extract base URL from graphql_url
        base_url = self.graphql_url.split('/services/')[0]
        auth_url = f"{base_url}/services/mtm/v1/oauth2/token"
        
        response = requests.post(
            auth_url,
            auth=('apitoken', self.api_token),
            data={'grant_type': 'client_credentials'}
        )
        
        if response.status_code != 200:
            raise ValueError(f"Failed to get access token: {response.status_code} - {response.text}")
        
        access_token = response.json()['access_token']
        return access_token
    
    def execute_query(self, query: str, variables: Optional[Dict[str, Any]] = None) -> Dict[str, Any]:
        """
        Execute a GraphQL query.
        
        Args:
            query: GraphQL query string
            variables: Optional variables for the query
            
        Returns:
            Query result as dictionary
        """
        gql_query = gql(query)
        result = self.client.execute(gql_query, variable_values=variables)
        return result
    
    def get_applications(self, limit: int = 100) -> list:
        """
        Fetch all applications from LeanIX.
        
        Args:
            limit: Maximum number of applications to fetch
            
        Returns:
            List of application fact sheets
        """
        from .queries import GET_APPLICATIONS
        
        result = self.execute_query(GET_APPLICATIONS, {'limit': limit})
        return result.get('allFactSheets', {}).get('edges', [])
    
    def get_business_capabilities(self, limit: int = 100) -> list:
        """
        Fetch all business capabilities from LeanIX.
        
        Args:
            limit: Maximum number of capabilities to fetch
            
        Returns:
            List of business capability fact sheets
        """
        from .queries import GET_BUSINESS_CAPABILITIES
        
        result = self.execute_query(GET_BUSINESS_CAPABILITIES, {'limit': limit})
        return result.get('allFactSheets', {}).get('edges', [])
    
    def get_it_components(self, limit: int = 100) -> list:
        """
        Fetch all IT components from LeanIX.
        
        Args:
            limit: Maximum number of IT components to fetch
            
        Returns:
            List of IT component fact sheets
        """
        from .queries import GET_IT_COMPONENTS
        
        result = self.execute_query(GET_IT_COMPONENTS, {'limit': limit})
        return result.get('allFactSheets', {}).get('edges', [])
    
    def get_platform_by_id(self, platform_id: str) -> dict:
        """
        Fetch a specific platform (Application) by ID with all its relationships.
        
        Args:
            platform_id: LeanIX fact sheet ID
            
        Returns:
            Platform fact sheet with applications and organizations
        """
        from .queries import GET_PLATFORM_BY_ID
        
        result = self.execute_query(GET_PLATFORM_BY_ID, {'id': platform_id})
        return result.get('factSheet', {})
    
    def get_all_interfaces(self) -> list:
        """
        Fetch all interfaces (integrations) from LeanIX.
        
        Returns:
            List of interface fact sheets
        """
        from .queries import GET_INTERFACES
        
        result = self.execute_query(GET_INTERFACES, {'limit': 1000})
        return result.get('allFactSheets', {}).get('edges', [])
    
    def test_connection(self) -> bool:
        """
        Test the connection to LeanIX.
        
        Returns:
            True if connection successful, False otherwise
        """
        try:
            # Simple query to test connection
            query = """
            query {
                allFactSheets(factSheetType: Application, first: 1) {
                    totalCount
                }
            }
            """
            result = self.execute_query(query)
            print(f"✓ Connected to LeanIX successfully")
            print(f"  Total applications in workspace: {result['allFactSheets']['totalCount']}")
            return True
        except Exception as e:
            print(f"✗ Failed to connect to LeanIX: {e}")
            return False


def main():
    """Test the LeanIX client."""
    print("=" * 70)
    print("LeanIX Client Test")
    print("=" * 70)
    print()
    
    client = LeanIXClient()
    
    print("Testing connection...")
    if client.test_connection():
        print()
        print("Fetching applications...")
        apps = client.get_applications(limit=5)
        print(f"✓ Fetched {len(apps)} applications (limited to 5 for testing)")
        
        if apps:
            print("\nFirst application:")
            app = apps[0]['node']
            print(f"  ID: {app['id']}")
            print(f"  Name: {app['displayName']}")
            print(f"  Type: {app['type']}")
    
    print()
    print("=" * 70)


if __name__ == "__main__":
    main()