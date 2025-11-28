"""
generate_c4_dsl.py - Direct Structurizr DSL Generator

Generates Structurizr DSL directly without pystructurizr,
giving full control over identifiers, names, and formatting.
"""

from pathlib import Path


class C4DSLGenerator:
    """Generate Structurizr DSL directly with full control."""
    
    def __init__(self):
        self.workspace_name = "Channel 4 Core"
        self.workspace_description = "Base Line Model"
        self.theme_url = "https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/c4-default-theme.json"
        self.logo_url = "https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/4-logo-black.png"
        self.font_name = "4Text"
        self.font_url = "https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/4Text-Regular.ttf"
    
    def generate(self):
        """Generate the complete DSL content."""
        
        dsl = f'''workspace "{self.workspace_name}" "{self.workspace_description}" {{

    !identifiers flat

    model {{
    
        archetypes {{
            application = container
        }}
        
        /* ============================================================
           PEOPLE / TEAMS
           ============================================================ */
        
        comFinTeam = person "Commercial Finance" "Team that analyse financial data, forecast performance, plan budgets and support strategic decisions."
        
        allC4 = person "All Colleagues" "All colleagues working at C4" "Legal Entity"
        
        finDept = person "Finance" "Oversee financial health, ensure compliance, support strategy, manage budgets and reporting" "Business Unit"
        
        sharedServicesTeam = person "Shared Services" "Team that process invoices, management payments, verify expenses, maintain vendor relationships and ensure accuracy."
        
        taxTeam = person "Tax and Treasury" "Team that manage cash, investments, debt and ensure tax compliance and reporting"
        
        peopleOps = person "People Ops Team" "The people team help attract, support and grow colleagues within the channel"

        /* ============================================================
           FINANCE SYSTEM PLATFORM
           ============================================================ */
        
        fsp = softwareSystem "Finance System Platform" "Applications centred around the management of Colleagues and Employees" {{
            
            ebs = container "Oracle e-Business Suite" "Financial System of record" "Hosted App"
            
            wda = container "Workday Adaptive" "Financial Budgeting, Planning and Consolidation application" "SaaS"
            
            sbi = container "SplashBI" "Business Intelligence and Reporting" "BI Tool"
            
            bsw = container "Baseware" "Purchase to Pay solution" "SaaS"
            
            faf = container "Financial Approval Forms" "Approval workflow management" "Web App"
            
            pjc = container "Project Codes" "Project code management" "Web App"
            
            tgn = container "Tungsten Network" "Billing and invoicing network" "SaaS"
            
            msc = container "Mastercard" "Corporate card management" "SaaS"
            
            cmx = container "Cachematrix" "Cash Flow management solution" "SaaS"
            
            bbp = container "Barclays Banking Portal" "Banking operations portal" "SaaS"
            
            apt = container "AlphaTax" "Tax calculation and reporting" "SaaS"
            
            sov = container "Sovos" "Tax compliance solution" "SaaS"
            
            exr = container "Exchange Rates" "Currency exchange rate service" "API"
        }}
        
        /* ============================================================
           PEOPLE (HR) PLATFORM
           ============================================================ */
        
        hrp = softwareSystem "People Platform" "Applications centred around the management of Colleagues and Employees" {{
            
            fourPo = container "4People" "HCM People System" "SaaS HCM"
            
            hnd = container "Handle" "Freelance payment solution" "SaaS"
            
            fes = container "FES" "Freelancer Engagement Solution" "Hosted"
        }}
        
        /* ============================================================
           OTHER PLATFORMS
           ============================================================ */
        
        cmp = softwareSystem "Commercial Platform" "Commercial operations platform"
        
        sbs = softwareSystem "Small Business Systems" "Small business management systems"
        
        c4s = softwareSystem "Channel 4 Streaming Platform" "Content streaming and delivery platform"
        
        rsp = softwareSystem "Royalties and Sales Platform" "Royalties and sales management"
        
        /* ============================================================
           RELATIONSHIPS - Finance Platform with Users
           ============================================================ */
        
        taxTeamToExr = taxTeam -> exr "Tax calculation and reporting"
        taxTeamToSov = taxTeam -> sov "Tax calculation and reporting"
        taxTeamToApt = taxTeam -> apt "Tax calculation and reporting"
        taxTeamToBbp = taxTeam -> bbp "Cash Flow management" "" "API"
        taxTeamToCmx = taxTeam -> cmx "Cash Flow management" "" "API"
        
        sharedServicesTeamToMsc = sharedServicesTeam -> msc "Manages all colleagues spend" "" "API"
        sharedServicesTeamToTgn = sharedServicesTeam -> tgn "Manages Tungsten billing process" "" "API"
        sharedServicesTeamToBsw = sharedServicesTeam -> bsw "P2P Process Super User"
        
        allC4ToPjc = allC4 -> pjc "Creates new codes for C4 shows"
        allC4ToFaf = allC4 -> faf "Submits request for sign-off limit changes"
        allC4ToBsw = allC4 -> bsw "Create/Approve PO"
        allC4ToEbs = allC4 -> ebs "Create/Approve Expenses"
        
        finDeptToSbi = finDept -> sbi "Create and distribute insights"
        finDeptToEbs = finDept -> ebs "AP/AR/GL operation activities"
        
        cfTeamToWorkday = comFinTeam -> wda "Produce plans and Budgets"
        
        /* ============================================================
           RELATIONSHIPS - Finance Platform Applications
           ============================================================ */
        
        ebsToExr = ebs -> exr "Financial Data" "File" "Integration"
        ebsToWda = ebs -> wda "Master and Transactional Data" "ERROR: Bi directional!" "Integration"
        splashToEBS = sbi -> ebs "Database reads" "VPN" "Integration"
        bswToEbs = bsw -> ebs "Invoicing and Purchasing Master" "Mule" "Integration"
        fafToEbs = faf -> ebs "Delegated authority submissions" "Hosted" "Integration"
        pjcToEbs = pjc -> ebs "Project Master Data" "Automate" "Integration"
        tgnToEbs = tgn -> ebs "Customer Billing Invoice" "Mule" "Integration"
        ebsToCmx = ebs -> cmx "Financial Transactional Data" "File" "Integration"
        bbpToEbs = bbp -> ebs "Bank Statements and Payment files" "Automate" "Integration"
        ebsToApt = ebs -> apt "Financial Transactional Data" "File" "Integration"
        ebsToSov = ebs -> sov "Financial Transactional Data" "File" "Integration"
        
        /* ============================================================
           RELATIONSHIPS - HR Platform with Users
           ============================================================ */
        
        allC4ToFes = allC4 -> fes "Freelancer requestors"
        peopleOpsToFes = peopleOps -> fes "Management of freelancer process"
        
        /* ============================================================
           RELATIONSHIPS - HR Platform Applications
           ============================================================ */
        
        fourPoToWda = fourPo -> wda "Colleague Master Data" "CSV File" "Integration"
        fesToHnd = fes -> hnd "Freelancer contract data" "Email" "Integration"
        fesToEbs = fes -> ebs "Project codes" "SFTP" "Integration"
        hndToEbs = hnd -> ebs "Freelancer Invoice Data" "Email" "Integration"
    }}
    
    views {{
        
        terminology {{
            person "Team"
            softwareSystem "Platform"
            container "Application"
        }}
        
        themes {self.theme_url}
        
        branding {{
            logo {self.logo_url}
            font "{self.font_name}" {self.font_url}
        }}
        
        systemLandscape "SystemLandscape" {{
            include *
            autoLayout
        }}
        
        systemContext fsp "FinancePlatformContext" {{
            include *
            autoLayout
        }}
        
        container fsp "FinancePlatformContainers" {{
            include *
            autoLayout
        }}
        
        systemContext hrp "PeoplePlatformContext" {{
            include *
            autoLayout
        }}
        
        container hrp "PeoplePlatformContainers" {{
            include *
            autoLayout
        }}
    }}
}}'''
        
        return dsl
    
    def save(self, output_file):
        """Save the generated DSL to a file."""
        # Create output directory if it doesn't exist
        output_path = Path(output_file)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        # Generate and save
        dsl_content = self.generate()
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(dsl_content)
        
        print(f"✓ Generated DSL: {output_file}")
        return output_file


def main():
    """Main execution."""
    output_file = "dsl/c4-core-workspace.dsl"
    
    print("=" * 70)
    print("Channel 4 Core - Direct DSL Generation")
    print("=" * 70)
    print()
    
    generator = C4DSLGenerator()
    generator.save(output_file)
    
    print()
    print("=" * 70)
    print("✓ DSL Generation Complete!")
    print("=" * 70)
    print()
    print(f"Output: {output_file}")
    print()
    print("Features:")
    print("  ✓ Clean identifiers (ebs, wda, fsp, etc.)")
    print("  ✓ Display names with spaces")
    print("  ✓ Relationship identifiers for cross-workspace references")
    print("  ✓ Channel 4 branding (theme, logo, font)")
    print("  ✓ Custom terminology")
    print()
    print("Next steps:")
    print("  1. Review: cat dsl/c4-core-workspace.dsl")
    print("  2. Upload to Structurizr or run Structurizr Lite")
    print("=" * 70)


if __name__ == "__main__":
    main()