"""
main.py - Channel 4 Core Architecture Model

Replicates the c4-core-workspace.dsl structure using pystructurizr.
Run with: pystructurizr dump --view main.py > c4-core-workspace.dsl
"""

from pystructurizr.dsl import Workspace


# Create workspace using context manager
with Workspace() as workspace:
    
    # Create the main model
    with workspace.Model(name="C4Model") as model:
        
        # ============================================================
        # PEOPLE / TEAMS
        # ============================================================
        
        com_fin_team = model.Person(
            "CommercialFinance",
            description="Team that analyse financial data, forecast performance, plan budgets and support strategic decisions."
        )
        
        all_c4 = model.Person(
            "AllColleagues",
            description="All colleagues working at C4",
            tags=["Legal Entity"]
        )
        
        fin_dept = model.Person(
            "Finance",
            description="Oversee financial health, ensure compliance, support strategy, manage budgets and reporting",
            tags=["Business Unit"]
        )
        
        shared_services_team = model.Person(
            "SharedServices",
            description="Team that process invoices, management payments, verify expenses, maintain vendor relationships and ensure accuracy."
        )
        
        tax_team = model.Person(
            "TaxAndTreasury",
            description="Team that manage cash, investments, debt and ensure tax compliance and reporting"
        )
        
        people_ops = model.Person(
            "PeopleOpsTeam",
            description="The people team help attract, support and grow colleagues within the channel"
        )
        
        # ============================================================
        # FINANCE SYSTEM PLATFORM
        # ============================================================
        
        with model.SoftwareSystem(
            "FinanceSystemPlatform",
            description="Applications centred around the management of Colleagues and Employees"
        ) as fsp:
            
            # Applications (Containers)
            ebs = fsp.Container(
                "OracleEBS",
                description="Financial System of record",
                technology="Hosted App"
            )
            
            wda = fsp.Container(
                "WorkdayAdaptive",
                description="Financial Budgeting, Planning and Consolidation application",
                technology="SaaS"
            )
            
            sbi = fsp.Container(
                "SplashBI",
                description="Business Intelligence and Reporting",
                technology="BI Tool"
            )
            
            bsw = fsp.Container(
                "Baseware",
                description="Purchase to Pay solution",
                technology="SaaS"
            )
            
            faf = fsp.Container(
                "FinancialApprovalForms",
                description="Approval workflow management",
                technology="Web App"
            )
            
            pjc = fsp.Container(
                "ProjectCodes",
                description="Project code management",
                technology="Web App"
            )
            
            tgn = fsp.Container(
                "TungstenNetwork",
                description="Billing and invoicing network",
                technology="SaaS"
            )
            
            msc = fsp.Container(
                "Mastercard",
                description="Corporate card management",
                technology="SaaS"
            )
            
            cmx = fsp.Container(
                "Cachematrix",
                description="Cash Flow management solution",
                technology="SaaS"
            )
            
            bbp = fsp.Container(
                "BarclaysBankingPortal",
                description="Banking operations portal",
                technology="SaaS"
            )
            
            apt = fsp.Container(
                "AlphaTax",
                description="Tax calculation and reporting",
                technology="SaaS"
            )
            
            sov = fsp.Container(
                "Sovos",
                description="Tax compliance solution",
                technology="SaaS"
            )
            
            exr = fsp.Container(
                "ExchangeRates",
                description="Currency exchange rate service",
                technology="API"
            )
        
        # ============================================================
        # PEOPLE (HR) PLATFORM
        # ============================================================
        
        with model.SoftwareSystem(
            "PeoplePlatform",
            description="Applications centred around the management of Colleagues and Employees"
        ) as hrp:
            
            four_po = hrp.Container(
                "4People",
                description="HCM People System",
                technology="SaaS HCM"
            )
            
            hnd = hrp.Container(
                "Handle",
                description="Freelance payment solution",
                technology="SaaS"
            )
            
            fes = hrp.Container(
                "FES",
                description="Freelancer Engagement Solution",
                technology="Hosted"
            )
        
        # ============================================================
        # OTHER PLATFORMS (placeholder systems)
        # ============================================================
        
        cmp = model.SoftwareSystem(
            "CommercialPlatform",
            description="Commercial operations platform"
        )
        
        sbs = model.SoftwareSystem(
            "SmallBusinessSystems",
            description="Small business management systems"
        )
        
        c4s = model.SoftwareSystem(
            "Channel4StreamingPlatform",
            description="Content streaming and delivery platform"
        )
        
        rsp = model.SoftwareSystem(
            "RoyaltiesAndSalesPlatform",
            description="Royalties and sales management"
        )
        
        # ============================================================
        # RELATIONSHIPS - Finance Platform with Users
        # ============================================================
        
        # Tax Team relationships
        tax_team.uses(exr, "Tax calculation and reporting")
        tax_team.uses(sov, "Tax calculation and reporting")
        tax_team.uses(apt, "Tax calculation and reporting")
        tax_team.uses(bbp, "Cash Flow management", technology="API")
        tax_team.uses(cmx, "Cash Flow management", technology="API")
        
        # Shared Services Team relationships
        shared_services_team.uses(msc, "Manages all colleagues spend", technology="API")
        shared_services_team.uses(tgn, "Manages Tungsten billing process", technology="API")
        shared_services_team.uses(bsw, "P2P Process Super User")
        
        # All C4 relationships
        all_c4.uses(pjc, "Creates new codes for C4 shows")
        all_c4.uses(faf, "Submits request for sign-off limit changes")
        all_c4.uses(bsw, "Create/Approve PO")
        all_c4.uses(ebs, "Create/Approve Expenses")
        
        # Finance Department relationships
        fin_dept.uses(sbi, "Create and distribute insights")
        fin_dept.uses(ebs, "AP/AR/GL operation activities")
        
        # Commercial Finance Team relationships
        com_fin_team.uses(wda, "Produce plans and Budgets")
        
        # ============================================================
        # RELATIONSHIPS - Finance Platform Applications
        # ============================================================
        
        ebs.uses(exr, "Financial Data", technology="File")
        ebs.uses(wda, "Master and Transactional Data", technology="ERROR: Bi directional!")
        sbi.uses(ebs, "Database reads", technology="VPN")
        bsw.uses(ebs, "Invoicing and Purchasing Master", technology="Mule")
        faf.uses(ebs, "Delegated authority submissions", technology="Hosted")
        pjc.uses(ebs, "Project Master Data", technology="Automate")
        tgn.uses(ebs, "Customer Billing Invoice", technology="Mule")
        ebs.uses(cmx, "Financial Transactional Data", technology="File")
        bbp.uses(ebs, "Bank Statements and Payment files", technology="Automate")
        ebs.uses(apt, "Financial Transactional Data", technology="File")
        ebs.uses(sov, "Financial Transactional Data", technology="File")
        
        # ============================================================
        # RELATIONSHIPS - HR Platform with Users
        # ============================================================
        
        all_c4.uses(fes, "Freelancer requestors")
        people_ops.uses(fes, "Management of freelancer process")
        
        # ============================================================
        # RELATIONSHIPS - HR Platform Applications
        # ============================================================
        
        four_po.uses(wda, "Colleague Master Data", technology="CSV File")
        fes.uses(hnd, "Freelancer contract data", technology="Email")
        fes.uses(ebs, "Project codes", technology="SFTP")
        hnd.uses(ebs, "Freelancer Invoice Data", technology="Email")
    
    # ============================================================
    # VIEWS
    # ============================================================
    
    # System Landscape View
    landscape_view = workspace.SystemLandscapeView(
        "SystemLandscape",
        description="Overview of all platforms and systems at Channel 4"
    )
    
    # Finance Platform - System Context View
    fsp_context = workspace.SystemContextView(
        fsp,
        "FinancePlatformContext",
        description="System context for the Finance System Platform"
    )
    
    # Finance Platform - Container View
    fsp_container = workspace.ContainerView(
        fsp,
        "FinancePlatformContainers",
        description="Container view showing all applications within the Finance Platform"
    )
    
    # People Platform - System Context View
    hrp_context = workspace.SystemContextView(
        hrp,
        "PeoplePlatformContext",
        description="System context for the People Platform"
    )
    
    # People Platform - Container View
    hrp_container = workspace.ContainerView(
        hrp,
        "PeoplePlatformContainers",
        description="Container view showing all applications within the People Platform"
    )


# This allows the file to be run with pystructurizr dump command
if __name__ == "__main__":
    print("=" * 70)
    print("Channel 4 Core Architecture Model")
    print("Base Line Model")
    print("=" * 70)
    print()
    print("To generate the DSL file, run:")
    print("  pystructurizr dump --view main.py > c4-core-workspace.dsl")
    print()
    print("To preview in development mode:")
    print("  pystructurizr dev --view main.py")
    print()
    print("Model includes:")
    print("  - 6 Teams/Departments")
    print("  - Finance System Platform (13 applications)")
    print("  - People Platform (3 applications)")
    print("  - 4 Additional platforms")
    print("  - Multiple views (Landscape, Context, Container)")
    print()
    print("=" * 70)