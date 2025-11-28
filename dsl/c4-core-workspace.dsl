workspace "Channel 4 Core" "Base Line Model - Generated from LeanIX" {

    !identifiers flat

    model {
    
        archetypes {
            application = container
        }
        
        /* ============================================================
           ORGANISATIONS / TEAMS (from LeanIX UserGroups)
           ============================================================ */
        
        ccf = person "Finance" ""
        c4 = person "Channel 4" ""
        ccfrss = person "Shared Services" "Team responsible for any financial transactional incoming and outgoing payment processing. Typica..."

        /* ============================================================
           FINANCE SYSTEMS PLATFORM
           ============================================================ */
        
        fsp = softwareSystem "Finance Systems Platform" "None" {
            
            atax = container "Alphatax" "Corporation tax compliance software, providing complete control over the preparation and manageme..." "Application"
            bbp = container "Barclays Banking Portal" "Barclays Online platform used to transact FX deals. File Gateway is a host to host connectivity p..." "Application"
            bdn = container "Barclays.Net" "Barclays service used to download statements." "Application"
            bsw = container "Basware" "Enterprise software for financial processes, purchase to pay and financial management. Manage Inv..." "Application"
            cmx = container "Cachematrix" "SaaS solution for cash management" "Application"
            ebs = container "E-Business Suite" "Channel4 Oracle E-business Suite application used in Finance department for Accounts, Cash and As..." "Application"
            faf = container "Finance Approval Form" "" "Application"
            msc = container "Mastercard" "" "Application"
            odf = container "Oracle eBS Excel data files" "These are a collection of manually generated .xslx files out of Oracle e-Business that contain va..." "Application"
            pjc = container "Project Codes" "App used to generate project codes which are used in Oracle and across Channel 4." "Application"
            sov = container "Sovos" "Sovos helps in digital transformation of tax, with complete, connected offerings for tax determin..." "Application"
            sbi = container "SplashBI" "SplashBI is an all-in-one framework for visualising, reporting and analysing data." "Application"
            tgn = container "Tungsten Network" "Tungsten provide a multiple distribution channel service to a single stream invoice feed." "Application"
            wda = container "Workday Adaptive" "Workday Adaptive is Channel 4 Finance's Planning and Consolidation tool" "Application"
        }
        
        /* ============================================================
           PERSON -> APPLICATION RELATIONSHIPS
           ============================================================ */
        
        ccfToAtax = ccf -> atax "Uses"
        ccfToBbp = ccf -> bbp "Uses"
        c4ToBsw = c4 -> bsw "Uses"
        ccfToBsw = ccf -> bsw "Uses"
        ccfrssToBsw = ccfrss -> bsw "Uses"
        ccfToEbs = ccf -> ebs "Uses"
        ccfrssToEbs = ccfrss -> ebs "Uses"
        c4ToFaf = c4 -> faf "Uses"
        ccfToMsc = ccf -> msc "Uses"
        ccfToSov = ccf -> sov "Uses"
        ccfToSbi = ccf -> sbi "Uses"
        ccfrssToSbi = ccfrss -> sbi "Uses"
        ccfrssToTgn = ccfrss -> tgn "Uses"
        ccfToWda = ccf -> wda "Uses"

        /* ============================================================
           APPLICATION -> APPLICATION RELATIONSHIPS (from LeanIX Interfaces)
           ============================================================ */
        
        bwpfo = ebs -> bbp "BACS & Wire Payments File Out" "TBC" "Integration"
        bpsri = bbp -> ebs "Barclay Payment Statement Receipt In" "TBC" "Integration"
        bsi = bbp -> ebs "Barclay Statement In" "TBC" "Integration"
        bbdc = ebs -> bsw "Basware Business Department Codes" "TBC" "Integration"
        bcer = ebs -> bsw "Basware Currency Exchange Rates" "TBC" "Integration"
        bglcvr = ebs -> bsw "Basware GL Cross Validation Rules" "TBC" "Integration"
        bglnc = ebs -> bsw "Basware GL Nominal Codes" "TBC" "Integration"
        bic = ebs -> bsw "Basware Individual Codes" "TBC" "Integration"
        bis = bsw -> ebs "Basware Invoice Statuses" "TBC" "Integration"
        bpvpci = ebs -> bsw "Basware Payments/Void Payments/Cancelled Invoices" "TBC" "Integration"
        bpcc = ebs -> bsw "Basware Pirate Code Combinations" "TBC" "Integration"
        bprodc = ebs -> bsw "Basware Product Codes" "TBC" "Integration"
        bprojc = ebs -> bsw "Basware Project Codes" "TBC" "Integration"
        bws = ebs -> bsw "Basware Suppliers" "TBC" "Integration"
        b2ebs = bsw -> ebs "Basware to EBS for Approved Invoices" "TBC" "Integration"
        b2sbi = bsw -> ebs "Basware to SplashBI (Oracle eBS Schema)" "TBC" "Integration"
        b2sbi2 = bsw -> sbi "Basware to SplashBI (Oracle eBS Schema)" "TBC" "Integration"
        bur = ebs -> bsw "Basware User Rights" "TBC" "Integration"
        buriu = ebs -> bsw "Basware User Rights (Inactive users)" "TBC" "Integration"
        4vatr = sov -> ebs "C4 VAT Returns" "TBC" "Integration"
        ebstrd = ebs -> bsw "EBS to Basware for Reference & Transactional data" "TBC" "Integration"
        ebsmc = msc -> ebs "EBS to Mastercard for Employee credit card transactions" "TBC" "Integration"
        ebplan = ebs -> wda "eBusiness to Planning" "TBC" "Integration"
        faebs = ebs -> faf "Finance Approval to E-Business Suite" "TBC" "Integration"
        ebssbi = ebs -> ebs "Oracle EBS to SplashBI (Oracle eBS Schema)" "TBC" "Integration"
        ebssbi2 = ebs -> sbi "Oracle EBS to SplashBI (Oracle eBS Schema)" "TBC" "Integration"
        oatax = ebs -> atax "Oracle to AlphaTax" "TBC" "Integration"
        opisx = ebs -> ebs "Oracle to PublicIS XML Invoice feed" "TBC" "Integration"
        otunx = ebs -> tgn "Oracle to Tungsten XML Invoice feed" "TBC" "Integration"
        wdsbi = wda -> ebs "Workday Adaptive to SplashBI (Oracle eBS Schema)" "TBC" "Integration"
        wdsbi2 = wda -> sbi "Workday Adaptive to SplashBI (Oracle eBS Schema)" "TBC" "Integration"
        
    }
    
    views {
        
        terminology {
            person "Team"
            softwareSystem "Platform"
            container "Application"
        }
        
        themes https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/c4-default-theme.json
        
        branding {
            logo https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/4-logo-black.png
            font "4Text" https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/4Text-Regular.ttf
        }
        
        systemContext fsp "fspContext" {
            include *
            autoLayout
        }
        
        container fsp "fspContainers" {
            include *
            autoLayout
        }
    }
}