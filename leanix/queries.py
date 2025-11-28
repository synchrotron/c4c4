"""
leanix/queries.py - LeanIX GraphQL Queries

Defines GraphQL queries for fetching architecture data from LeanIX.
"""

# Query to fetch a specific TechPlatform by ID with all relationships
GET_PLATFORM_BY_ID = """
query GetPlatformById($id: ID!) {
    factSheet(id: $id) {
        id
        name
        displayName
        type
        description
        tags {
            name
        }
        ... on TechPlatform {
            acronym
            relTechPlatformToApplication {
                edges {
                    node {
                        factSheet {
                            id
                            name
                            displayName
                            description
                            ... on Application {
                                acronym
                                relApplicationToUserGroup {
                                    edges {
                                        node {
                                            factSheet {
                                                id
                                                name
                                                displayName
                                                description
                                                ... on UserGroup {
                                                    acronym
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
"""

# Query to get interfaces for specific application IDs
GET_INTERFACES_FOR_APPLICATIONS = """
query GetInterfaces($filter: FilterInput) {
    allFactSheets(factSheetType: Interface, filter: $filter) {
        edges {
            node {
                id
                name
                displayName
                description
                ... on Interface {
                    relInterfaceToApplicationProvider {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                }
                            }
                        }
                    }
                    relInterfaceToApplicationConsumer {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
"""

# Query to fetch Applications
GET_APPLICATIONS = """
query GetApplications($limit: Int!) {
    allFactSheets(factSheetType: Application, first: $limit) {
        totalCount
        edges {
            node {
                id
                name
                displayName
                type
                description
                tags {
                    name
                }
                ... on Application {
                    lifecycle {
                        phases {
                            phase
                            startDate
                        }
                    }
                    technicalSuitability
                    businessCriticality
                    functionalSuitability
                    relApplicationToITComponent {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                }
                            }
                        }
                    }
                    relApplicationToBusinessCapability {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
"""

# Query to fetch Business Capabilities
GET_BUSINESS_CAPABILITIES = """
query GetBusinessCapabilities($limit: Int!) {
    allFactSheets(factSheetType: BusinessCapability, first: $limit) {
        totalCount
        edges {
            node {
                id
                name
                displayName
                type
                description
                tags {
                    name
                }
            }
        }
    }
}
"""

# Query to fetch IT Components
GET_IT_COMPONENTS = """
query GetITComponents($limit: Int!) {
    allFactSheets(factSheetType: ITComponent, first: $limit) {
        totalCount
        edges {
            node {
                id
                name
                displayName
                type
                description
                tags {
                    name
                }
                ... on ITComponent {
                    category
                    technicalSuitability
                }
            }
        }
    }
}
"""

# Query to fetch Interfaces (Data Flows)
GET_INTERFACES = """
query GetInterfaces($limit: Int!) {
    allFactSheets(factSheetType: Interface, first: $limit) {
        totalCount
        edges {
            node {
                id
                name
                displayName
                type
                description
                ... on Interface {
                    acronym
                    relInterfaceToProviderApplication {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                }
                            }
                        }
                    }
                    relInterfaceToConsumerApplication {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
"""

# Comprehensive query to get applications with all relationships
GET_APPLICATIONS_WITH_RELATIONS = """
query GetApplicationsWithRelations($limit: Int!) {
    allFactSheets(factSheetType: Application, first: $limit) {
        totalCount
        edges {
            node {
                id
                name
                displayName
                type
                description
                tags {
                    name
                }
                ... on Application {
                    lifecycle {
                        phases {
                            phase
                            startDate
                        }
                    }
                    technicalSuitability
                    businessCriticality
                    functionalSuitability
                    relApplicationToITComponent {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                    type
                                }
                                description
                            }
                        }
                    }
                    relApplicationToBusinessCapability {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                }
                            }
                        }
                    }
                    relToChild {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                }
                            }
                        }
                    }
                    relToParent {
                        edges {
                            node {
                                factSheet {
                                    id
                                    name
                                    displayName
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
"""