workspace "Channel 4 Core" "Enterprise Systems - Generated from LeanIX" {

    !identifiers flat

    model {
    
        archetypes {
            application = container
        }
        
        /* ============================================================
           ORGANISATIONS / TEAMS (from LeanIX UserGroups)
           ============================================================ */
        
        c4cc = person "Client Sales & Engagement" ""
        c4ci = person "Partnerships" ""
        c4cs = person "Sales Operations" "Sales Operations handle the content supply chain for commercial content and plan placements withi..."
        ea = person "Agency" ""
        c4ct = person "Broadcast Technology" ""
        c4ca = person "AV" ""
        c4csX = person "Ad Tech" ""
        c4csXX = person "Campaign" ""
        c4csXXX = person "Traffic" ""
        c4ctX = person "Trading" ""
        c4ccX = person "Presentation and Access Services" ""
        c4cf = person "Content Finance" ""
        c4mc = person "Communications" ""
        c4mm = person "Audience Integration" ""
        c4caX = person "Corporate Legal and Compliance" "Sub-team of Commercial Affairs that handle legal and compliance for all our content. Assigning ce..."
        c4ccXX = person "Content Delivery" ""
        c4m4 = person "4Studio" ""
        c4mp = person "Product" ""
        epp = person "Partner Platform" "User group to describe partner platforms such as DUK, Youview or Sky"
        c4ccXXX = person "Programme Information" "Programme Information provide distinctive, top quality, informative copy with the relevant tone o..."
        c4ccXXXX = person "Commissioning Office" ""
        ep = person "Producer" ""
        c4caXX = person "Commercial Affairs" "The commercial affairs teams handle entitlements and agreements, including rights) with out conte..."
        c4ccXXXXX = person "Content Strategy & Planning" "The Content Strategy team plans exhibition windows for our content on linear and non-linear using..."
        c4ccXXXXXX = person "Youth and Digital" ""
        c4ccXXXXXXX = person "Content Management" "Technical and business team that handle content media supply chain."
        ccf = person "Finance" ""
        c4csXXXX = person "Strategy & Consumer Insight" ""
        c4mmX = person "Marketing" ""
        c4ciX = person "Innovation" ""
        c4ccXXXXXXXX = person "Daytime and Features" ""
        c4ccXXXXXXXXX = person "Drama" ""
        c4ccXXXXXXXXXX = person "Factual" ""
        c4ccXXXXXXXXXXX = person "Factual Entertainment" ""
        c4ccXXXXXXXXXXXX = person "News, Current Affairs & Sport" ""
        c4f4 = person "Film 4" ""
        c4caXXX = person "Business Affairs" ""
        c4ccXXXXXXXXXXXXX = person "Comedy" ""
        c4ccXXXXXXXXXXXXXX = person "Commissioning Operations" ""
        c4ccXXXXXXXXXXXXXXX = person "Entertainment" ""
        c4ccXXXXXXXXXXXXXXXX = person "Duty Desk" "Team that handles live content operations for our linear channels."
        c4cp = person "People" ""
        c4m = person "MVE" ""
        c4m4X = person "4Creative" "Creative Team that creates new content for Channel 4."
        c4c = person "Commercial" ""
        c4caXXXX = person "Production Finance" ""
        c4csXXXXX = person "Programmatic and Audience" ""
        c4csXXXXXX = person "Data Science" ""
        c4csXXXXXXX = person "Audience Research" ""
        c4ctXX = person "Technology" ""
        c4ciXX = person "Digital" ""
        c4mmXX = person "Digital Marketing" ""
        c4mpX = person "Insights" ""
        c4X = person "Channel 4" ""
        ccfrss = person "Shared Services" "Team responsible for any financial transactional incoming and outgoing payment processing. Typica..."
        c4mpXX = person "Consumer Product" ""
        c4mpXXX = person "Digital Marketing (Product)" ""
        c4ccXXXXXXXXXXXXXXXXX = person "Content & Commissioning" ""
        c4cX = person "Corporate" ""
        c4cpX = person "Employee Relations" ""
        c4ctXXX = person "Corporate Technology" ""
        c4cpXX = person "Learning and Development" ""
        c4cfX = person "Procurement" ""
        c4caXXXXX = person "Corporate Legal & Governance" ""
        ev = person "Viewer" ""
        c4mpXXXX = person "All 4 Editorial" ""
        c4mpXXXXX = person "Growth (Subscriptions)" ""
        c4cfXX = person "Facilities Management" ""

        /* ============================================================
           COMMERCIAL PLATFORM
           ============================================================ */
        
        cp = softwareSystem "Commercial Platform" "Platform from LeanIX" {
            
            ap = container "Agency Portal" "Empowering advertising agencies with their Channel4 campaign data." "paas"
            cari = container "Caria" "The platform on which UK & Irish airtime is traded, and upon which copy rotation instructions are..." "saas"
            cc = container "Copy Central" "Service that provides information about copy restrictions and/or certifications. Also known as Cl..." ""
            fsh = container "Freewheel Streaming Hub" "Freewheel Streaming Hub (aka MRM) is a software application that enables publishers and broadcast..." "saas"
            inno = container "Innovid" "Innovid is the only independent omni-channel advertising and analytics platform built for televis..." "saas"
            moat = container "Moat" "Moat enables measuring consumer attention across channels, devices, and platforms" "saas"
            sc = container "Sales CRM" "" ""
            stel = container "Stellar" "Channel4's Sales Order Processing System" "onPremise"
        }

        /* ============================================================
           CONTENT MANAGEMENT PLATFORM
           ============================================================ */
        
        bms = softwareSystem "Content Management Platform" "The applications and components that support the media management and linear scheduling for our l..." {
            
            asp = container "Access Service Provider" "" ""
            acf = container "Acquired Cash Forecast" "For the management of cashflow for acquired content, this is all captured on a spreadsheet called..." "desktopOrLaptop"
            bynd = container "Bynder" "Bynder is an AI-powered, SaaS DAM solution that allows brands to easily create, find and use thei..." "saas"
            c7t = container "C4 7A Titles" "Home grown system to schedule long form content on YouTube with workflow for Rights and Compliance." "saas"
            cmt = container "CMT" "Hosted by I2, CMT is a web-based tool with secure log-in credentials . The tool allows Long Term ..." "saas"
            dasd = container "DTT Audio & Signing Date prompts with peak stats (with RB amendments)" "Business Objects report Displays the total volume of transmitted content during a time period, an..." ""
            et = container "Everyone TV" "Everyone TV is the new name for Digital UK. [JV with UK PSB's] NOTE: This is NOT an Application E..." ""
            grac = container "Gracenote" "Gracenote is the world’s leading entertainment data and technology company. We power the top musi..." "saas"
            mod = container "MediaGenix On Demand" "BeBanjo Movida VOD Management system (Comprising of systems which schedule and manage transcode a..." "saas"
            olss = container "OFCOM Licensing Services-Online Services-MIDCOM" "This is the OFCOM platform used by our Access Services team to upload of our reporting to OFCOM." ""
            osp = container "OnLine Service Provider" "Provides capabilities for ingest, transformation, transcoding, encryption and delivery of VOD; li..." "saas"
            ol = container "Order list" "Setting a budget and its' allocations genres & channels. Existing commitments also captured. Targ..." ""
            pira = container "Pirate" "Pirate is a collection of applications used by various departments. Commercial affairs (business ..." ""
            p4ws = container "4Producers (Web Site)" "eCommissioning system. Allows C4 to engage with Production companies for Production companies to ..." "saas"
            pass = container "Advance Scheduling System" "The Advanced Scheduling System (A55) provides a view of a schedule for a specific channel and dat..." "desktopOrLaptop"
            pbm = container "Brand Management" "An application where can create or update Pirate Brands. This enables the business to group toget..." "desktopOrLaptop"
            pc = container "Companies" "This application allows users to create companies like production companies, studios etc" "desktopOrLaptop"
            pcgs = container "Content Generation System" "Generates the required detailed metadata required for each target platform and sends the appropri..." "desktopOrLaptop"
            pcps = container "Content Planning System" "VOD Scheduling" "desktopOrLaptop"
            pdap = container "Director and Producer Reporting System" "DPRS Transmission/Sales Report This report works in various stages: 1. A list of all contract num..." "desktopOrLaptop"
            pfas = container "Film Advanced Scheduling" "Manages the film scheduling scenarios based on deals purchased" "desktopOrLaptop"
            pge = container "General Enquiry" "Contains query functionality and several reports that can be run based on a broad range of topics..." "desktopOrLaptop"
            pip = container "Interface Payments" "Maintenance tables for 1. Nominal accounts – specifying what codes are valid 2. Specifying which ..." "desktopOrLaptop"
            pitt = container "Interface To Transmission Systems" "ITS prepares final schedules for Playout systems. It uses Programme schedules generated from PPS ..." "onPremise"
            pmam = container "Management Account Maintenance" "Maintenance of reference data related to Management Accounts (Programme Finance)  Not used much,..." "desktopOrLaptop"
            pmm = container "Media Management" "Video browse can also be launched from this application" "desktopOrLaptop"
            pofg = container "OFCOM File Generator" "Review one or more channels for their compliance with statutory commercial minutage regulations. ..." "desktopOrLaptop"
            ppps = container "Presentation Planning System" "Manages the detailed channel schedules with all the relevant transmission content required for br..." "desktopOrLaptop"
            pppsX = container "Presentation Planning System - PPS.NET" "This is the .NET version of PPS NOTE: We need to create all VOD processes and link one to this ap..." "desktopOrLaptop"
            ppp = container "Producers Portal" "An app which allows C4 to engage with Production companies for Production companies to fill in th..." "onPremise"
            ppc = container "Programme Certification" "Programme Certification gives the users of the system the ability look at the assets when they ar..." "desktopOrLaptop"
            prta = container "Real Time As-Run 2" "Provides real-time playout updates to Pirate systems." "onPremise"
            pswo = container "Stock Write Off" "Channel 4 commission or purchase programmes (stock) to be consumed by the schedule using annual t..." "desktopOrLaptop"
            psfv = container "Subtitle File Viewer" "Provides a view over the content of subtitles and the ability to quickly search for bad-language ..." "hybrid"
            ptis = container "Transcode Initiation Service" "TIS2 is the back-end engine of the VoD system, running background jobs ranging from asset synchro..." "onPremise"
            pvb = container "Video Browse" "Video Browse is a client-side.NET application that is part of the Pirate domain. It provides user..." "onPremise"
            pve = container "Viewer Enquiry" "Viewing the logged calls made by viewers regarding transmitted programmes. EXE name: VE" "desktopOrLaptop"
            pvms = container "VOD Management System (VMS)" "" "desktopOrLaptop"
            pvma = container "VoD Material Allocation" "VoD Material Allocation is small module inside Media Management. This module used by Programme Ma..." "desktopOrLaptop"
            pvt = container "VOD Tracker" "Support tool for monitoring VOD systems and workflows" "desktopOrLaptop"
            pt = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" ""
            pcX = container "Promo Create" "Hosted by I2, CMT is a web-based tool with secure log-in credentials . The tool allows Long Term ..." "saas"
            scf = container "Sky Curated Feeds" "Web application designed to create ordered curated lists for presentation on Sky UVP/VRP platforms" ""
            soun = container "Soundmouse" "Representation of Soundmouse as company. Covers all SaaS products offered by Soundmouse: Soundmou..." "saas"
            spap = container "Soundmouse Pre-TX and Post-TX Exporter" "Creates both Pre-TX and Post-TX export files to Soundmouse for music reporting and production rep..." ""
            spri = container "Sprinklr" "Sprinklr is a social media management platform that enables enterprise brands to connect with cus..." "saas"
            ssfa = container "Subtitling Sep FLS and Teletext with Subtotals (with Ray Amendments)" "Business Objects Report 'Subtitling Sep FLS and Teletext with Subtotals (with Ray Amendments)' - ..." ""
            tb = container "The Bible" "The bible is a host of information related to the programme idea, such as the programme descripti..." "onPremise"
            typ = container "Three Year Plan" "" ""
        }

        /* ============================================================
           CONTENT SOURCING PLATFORM
           ============================================================ */
        
        csp = softwareSystem "Content Sourcing Platform" "Platform from LeanIX" {
            
            crmc = container "Customer Relationship Manager  (Content)" "A system used by the commissioning dept to track and manage programme ideas from pitch to greenlight" "paas"
            dist = container "Distributor" "Supplier of acquired content e.g. a US Studio" ""
            pasc = container "Acquisition Stock Control" "A Read-only/Live reporting tool, allowing users to track stock usage (available, scheduled, used)..." "desktopOrLaptop"
            pcf = container "Cashflow Forecasting" "Forecasting tool for managing cash, when are production companies actually going to be paid compa..." "desktopOrLaptop"
            pcc = container "Commissioning Cycle" "Manages the agreements of commissioned content." "desktopOrLaptop"
            pp = container "Programmes" "" "desktopOrLaptop"
            ppX = container "Purchases" "" "desktopOrLaptop"
            pcXX = container "Production Company" "Supplier of commissioned content e.g. All 3 Media NOTE: NOT an application" ""
        }

        /* ============================================================
           DATA AND ANALYTICS PLATFORM
           ============================================================ */
        
        dap = softwareSystem "Data and Analytics Platform" "An extensive Massive Parallel Processing (MPP) platform designed for analytics tasks, which inclu..." {
            
            as = container "Audience Segmentation" "Enables publishers and broadcasters to grow and retain audiences and increase monetisation for a ..." "saas"
            barb = container "BARB" "Founded by the major organisations in the UK television and advertising industry, BARB is respons..." "onPremise"
            bor = container "Business Objects Reporting" "This application represents all Business Object reports generated by BI team and are read by busi..." "hybrid"
            cedw = container "Enterprise Data Warehouse" "Data Warehouse application used as a host of analytics data in a star schema or a columnar databa..." "hybrid"
            c4 = container "Core 4" "https://www.core4.channel4.com/hub Core4 is Channel 4's quantitative insight community, made up o..." ""
            dcri = container "Data Clean Room (InfoSum)" "A data platform with a vision to connect the world’s data without ever sharing it – by developing..." "saas"
            dcrs = container "Data Clean Room (Snowflake)" "A data platform with a vision to connect the world’s data without ever sharing it – by developing..." "saas"
            df = container "Data Fabric" "Data Fabric is an innovative approach designed to simplify and streamline data management across ..." "saas"
            tabl = container "Tableau" "Tableau is a data visualization tool used in the Business Intelligence Industry. It helps in simp..." "saas"
            wa = container "Web Analytics" "Web Analytics software used by M&VE for All 4 & Online Services Adobe Analytics is the solution f..." "saas"
        }

        /* ============================================================
           FINANCE SYSTEMS PLATFORM
           ============================================================ */
        
        fsp = softwareSystem "Finance Systems Platform" "Platform from LeanIX" {
            
            atax = container "Alphatax" "Corporation tax compliance software, providing complete control over the preparation and manageme..." ""
            bbp = container "Barclays Banking Portal" "Barclays Online platform used to transact FX deals. File Gateway is a host to host connectivity p..." ""
            bdn = container "Barclays.Net" "Barclays service used to download statements." ""
            bsw = container "Basware" "Enterprise software for financial processes, purchase to pay and financial management. Manage Inv..." "saas"
            cmx = container "Cachematrix" "SaaS solution for cash management" ""
            ebs = container "E-Business Suite" "Channel4 Oracle E-business Suite application used in Finance department for Accounts, Cash and As..." "onPremise"
            faf = container "Finance Approval Form" "" ""
            msc = container "Mastercard" "" ""
            odf = container "Oracle eBS Excel data files" "These are a collection of manually generated .xslx files out of Oracle e-Business that contain va..." ""
            pjc = container "Project Codes" "App used to generate project codes which are used in Oracle and across Channel 4." ""
            sov = container "Sovos" "Sovos helps in digital transformation of tax, with complete, connected offerings for tax determin..." "saas"
            sbi = container "SplashBI" "SplashBI is an all-in-one framework for visualising, reporting and analysing data." "saas"
            tgn = container "Tungsten Network" "Tungsten provide a multiple distribution channel service to a single stream invoice feed." ""
            wda = container "Workday Adaptive" "Workday Adaptive is Channel 4 Finance's Planning and Consolidation tool" "saas"
        }

        /* ============================================================
           LINEAR PLAYOUT PLATFORM
           ============================================================ */
        
        lpp = softwareSystem "Linear Playout Platform" "Platform from LeanIX" {
            
            ac = container "Amagi Cloudport" "<https://www.amagi.com/products/cloudport-cloud-playout>\ \ Amagi CLOUDPORT supports media ingest..." "saas"
            lsp = container "Linear Service Provider" "" "saas"
            pppsXX = container "Presentation Planning System" "Manages the detailed channel schedules with all the relevant transmission content required for br..." "desktopOrLaptop"
            ptX = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" ""
            sp = container "Stargate Portal" "" "saas"
        }

        /* ============================================================
           MARKETING PLATFORM
           ============================================================ */
        
        mp = softwareSystem "Marketing Platform" "Platform from LeanIX" {
            
            braz = container "Braze" "Braze is a mobile marketing automation platform that provides a CRM and multichannel messaging su..." "saas"
            mpar = container "mParticle" "mParticle is a Customer Data Platform. It collects customer data once through secure APIs and SDK..." "saas"
            po = container "Promo Optimizer" "User-friendly TV promo scheduling tool. Leveraging advanced optimization and sequencing algorithm..." ""
        }

        /* ============================================================
           MEDIA MANAGEMENT PLATFORM
           ============================================================ */
        
        mmp = softwareSystem "Media Management Platform" "Platform from LeanIX" {
            
            awar = container "Awards" "Awards is a repository of all awards won by Channel 4 or where Channel 4 has been nominated. Plat..." "saas"
            msp = container "Media Service Provider" "Service provider for Digital Asset Management System" "saas"
            pmmX = container "Media Management" "Video browse can also be launched from this application" "desktopOrLaptop"
            pvbX = container "Video Browse" "Video Browse is a client-side.NET application that is part of the Pirate domain. It provides user..." "onPremise"
            ptXX = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" ""
            ppsp = container "Post Production Service Provider" "Post production service is pre-integrated to MSP and has suites available in HFR. This work can b..." ""
            rta = container "Ready to Air" "Deliver pre-transmission & pre-release video to journalists securely and reliably, wherever they ..." ""
            uv = container "Underground Vault" "Team that handles live content operations for our linear channels.Controlled and secure location ..." ""
        }

        /* ============================================================
           PEOPLE SYSTEMS PLATFORM
           ============================================================ */
        
        psp = softwareSystem "People Systems Platform" "Platform from LeanIX" {
            
            4peo = container "4People" "4People is a cloud HR and people system that empowers mid-size organisations to effectively respo..." "saas"
            acti = container "ActivPay" "Actvipay is Channel 4's 3rd party payroll provider." "saas"
            acX = container "Alert Cascade" "Crisis event mass communication tool" "desktopOrLaptop"
            bp = container "Benefits Portal" "" "saas"
            er = container "Executive Reporting" "Bespoke set of reports created in Power BI and served for the purpose of business reporting for t..." "paas"
            fes = container "Freelancer Engagement System" "HR system to request freelancers and bring them onboard. Freelancers submit timesheets via FES. O..." "onPremise"
            ll = container "LinkedIn Learning" "LinkedIn Learning offers video courses taught by industry experts in software, creative, and busi..." "saas"
            popp = container "Poppulo" "Internal communications Internal Communication, newsletter system. Used by internal comms. Integr..." "saas"
            tlh = container "The Learning Hive" "Cornerstone is a cloud-based learning and talent management solutions platform." "saas"
        }

        /* ============================================================
           RIGHTS MANAGEMENT PLATFORM
           ============================================================ */
        
        rmp = softwareSystem "Rights Management Platform" "Platform from LeanIX" {
            
            prms = container "Rights Management System" "" "desktopOrLaptop"
            ptXXX = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" ""
            rc = container "Repeats Clearances" "This excel spreadsheet is our record of all programmes repeated on C4 with details of any rights/..." ""
            sounX = container "Soundmouse" "Representation of Soundmouse as company. Covers all SaaS products offered by Soundmouse: Soundmou..." "saas"
        }

        /* ============================================================
           ROYALTIES AND SALES PLATFORM
           ============================================================ */
        
        rsp = softwareSystem "Royalties and Sales Platform" "Platform from LeanIX" {
            
            come = container "COMET" "Channel 4 International and National Rights Licencing Software used by Channel 4 to manage Films ..." "desktopOrLaptop"
            eps = container "Exclusivity Payment Schedules" "Contains payment details due to the artist for an exclusivity deal" ""
            neo = container "Neo" "NEO is a Soundmouse application that 4Studio and Rights Team users use. NEO does a shazam of soci..." ""
            pap = container "Artist Payments" "Application for reporting artist royalties" "desktopOrLaptop"
            pris = container "Royalties Income system" "Manages the Statements and chasing of Statements to ensure Royalties owed to Channel 4 are tracke..." "desktopOrLaptop"
            prrs = container "Royalties Reporting System" "RRS Overview Description: The Royalty Reporting System (RRS) is an application used for the conso..." "onPremise"
            ptXXXX = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" ""
            rcX = container "Repeats Clearances" "This excel spreadsheet is our record of all programmes repeated on C4 with details of any rights/..." ""
            sd = container "Sargent Disc" "Sargent-Disc is the U.K.’s foremost entertainment-technology provider, building cloud-based workf..." ""
            sounXX = container "Soundmouse" "Representation of Soundmouse as company. Covers all SaaS products offered by Soundmouse: Soundmou..." "saas"
            ted = container "Ted" "Ted is a (tactical) web application that is used by 4Studio to capture key information concerning..." "iaas"
            ussw = container "UK Secondary Sales Wishlist" "" ""
            vr = container "VOD Revenue" "" ""
            vwgm = container "VOD Writers Guild & Musician Payments" "" ""
            wga = container "Writers Guild Advances" "" ""
        }

        /* ============================================================
           SCHEDULING PLATFORM
           ============================================================ */
        
        spX = softwareSystem "Scheduling Platform" "The Scheduling Platform is a core functional domain that orchestrates the creation and management..." {
            
            modX = container "MediaGenix On Demand" "BeBanjo Movida VOD Management system (Comprising of systems which schedule and manage transcode a..." "saas"
            passX = container "Advance Scheduling System" "The Advanced Scheduling System (A55) provides a view of a schedule for a specific channel and dat..." "desktopOrLaptop"
            pepl = container "Electronic Press Listing" "Sends Electronic Programme Guide to other platforms Carries Rights information such as restart" "desktopOrLaptop"
            pittX = container "Interface To Transmission Systems" "ITS prepares final schedules for Playout systems. It uses Programme schedules generated from PPS ..." "onPremise"
            pppsXXX = container "Presentation Planning System" "Manages the detailed channel schedules with all the relevant transmission content required for br..." "desktopOrLaptop"
            pppsXXXX = container "Presentation Planning System - PPS.NET" "This is the .NET version of PPS NOTE: We need to create all VOD processes and link one to this ap..." "desktopOrLaptop"
        }

        /* ============================================================
           SMALL BUSINESS SERVICES
           ============================================================ */
        
        sbs = softwareSystem "Small Business Services" "A set of small applications delivering discreet business processes usually hosted on SQL on prem ..." {
            
            anda = container "ANDA" "ANDA is a document archive repository. Where physical documents need to be archived (signed contr..." "onPremise"
            comp = container "Competitions" "It is used by Legal & Compliance to select winners and runner ups for Channel 4 competitions. The..." "onPremise"
            cms = container "Contract Management System" "Contract Management System, used as a repository for contracts Owned by Procurement storing the m..." "onPremise"
            dsd = container "Diversity Suppliers DB" "This is a database of supplier information used by the Creative Diversity team based in Glasgow," "onPremise"
            fa = container "FOIA Application" "Application built on SQL Server for storing Freedom of Information Act requests" ""
            mc = container "Music Clearance" "It is used by colleagues in CACL - Commercial Affairs every time Channel 4 license a music track ..." "hybrid"
            pps = container "Post Production Schedule" "This application is used by 4Creative to plan the development of on-air promotional material and ..." ""
            pr = container "Producer Reporting" "It is used by Finance to format the producer reporting statements. The application takes all the ..." ""
            sac = container "Stills and Clips" "" ""
            time = container "Timesheets" "" "onPremise"
        }

        /* ============================================================
           VIDEO STREAMING PLATFORM
           ============================================================ */
        
        vsp = softwareSystem "Video Streaming Platform" "Includes all items that provide the value chain" {
            
            c4sl = container "Channel 4 Streaming (Legacy)" "Video on Demand platform across many devices including https://channel4.com" "iaas"
            cdna = container "Content Distribution Network (Accenture)" "Logical representation of the CDN's used by Channel 4 Streaming, controlled and maintained by Acc..." ""
            free = container "Freely" "" ""
            mparX = container "mParticle" "mParticle is a Customer Data Platform. It collects customer data once through secure APIs and SDK..." "saas"
            ova = container "Online Video Analytics" "Real-Time Streaming Video Intelligence" "saas"
            pipe = container "PIPE" "The CMS that drivers Channel 4 Streaming UX in the apps" "iaas"
            sm = container "Subscription Management" "The application that manages our subscription products such as offers and deals." "saas"
            sl = container "Sumo Logic" "Sumo Logic is a cloud-based log management and analytics service that leverages machine-generated..." "saas"
            tr = container "Tag Recommender" "A Data Science led application to aid the Channel 4 Streaming editors with tagging for Brands" "iaas"
            thin = container "ThinkAnalytics" "World leaders in AI personalized content discovery, hyper-targeted advertising and customer insight." "saas"
        }

        /* ============================================================
           WORKSPACE SYSTEMS PLATFORM
           ============================================================ */
        
        wsp = softwareSystem "Workspace Systems Platform" "Platform from LeanIX" {
            
            acXX = container "Alert Cascade" "Crisis event mass communication tool" "desktopOrLaptop"
            ce = container "Concept Evolution" "FM Job sheets for building maintenance used by Facilities & Workspace" "onPremise"
            egen = container "Egencia" "Egencia is a SaaS platform developed by Amex GBT that offers corporate travel management solution..." "saas"
            tbX = container "Taxi Booking" "This application describes are taxi booking capability at Channel 4." "saas"
            tb-n = container "Taxi Booking - non-London" "This application is used for London based Taxi bookings to and from Horseferry Road" "saas"
        }
        
        /* ============================================================
           PERSON -> APPLICATION RELATIONSHIPS
           ============================================================ */
        
        c4ccToAp = c4cc -> ap "Uses"
        c4ciToAp = c4ci -> ap "Uses"
        c4csToAp = c4cs -> ap "Uses"
        eaToAp = ea -> ap "Uses"
        c4ctToCari = c4ct -> cari "Uses"
        eaToCari = ea -> cari "Uses"
        c4csToCc = c4cs -> cc "Uses"
        c4csToFsh = c4cs -> fsh "Uses"
        c4csToInno = c4cs -> inno "Uses"
        c4caToSc = c4ca -> sc "Uses"
        c4csToSc = c4cs -> sc "Uses"
        c4csXToSc = c4csX -> sc "Uses"
        c4ccToStel = c4cc -> stel "Uses"
        c4ciToStel = c4ci -> stel "Uses"
        c4csToStel = c4cs -> stel "Uses"
        c4csXXToStel = c4csXX -> stel "Uses"
        c4csXXXToStel = c4csXXX -> stel "Uses"
        c4ctXToStel = c4ctX -> stel "Uses"
        c4ccXToAsp = c4ccX -> asp "Uses"
        c4cfToAcf = c4cf -> acf "Uses"
        c4mcToBynd = c4mc -> bynd "Uses"
        c4mmToBynd = c4mm -> bynd "Uses"
        c4ciToC7t = c4ci -> c7t "Uses"
        c4caXToC7t = c4caX -> c7t "Uses"
        c4ccXXToC7t = c4ccXX -> c7t "Uses"
        c4m4ToC7t = c4m4 -> c7t "Uses"
        c4mpToC7t = c4mp -> c7t "Uses"
        c4ccXToDasd = c4ccX -> dasd "Uses"
        eppToEt = epp -> et "Uses"
        eppToGrac = epp -> grac "Uses"
        c4ccXXXToModX = c4ccXXX -> modX "Uses"
        c4ccXToOlss = c4ccX -> olss "Uses"
        c4ccXXXToOsp = c4ccXXX -> osp "Uses"
        c4ctToOsp = c4ct -> osp "Uses"
        c4cfToOl = c4cf -> ol "Uses"
        c4ccXXXXToP4ws = c4ccXXXX -> p4ws "Uses"
        epToP4ws = ep -> p4ws "Uses"
        c4csToPassX = c4cs -> passX "Uses"
        c4ctXToPassX = c4ctX -> passX "Uses"
        c4caXXToPassX = c4caXX -> passX "Uses"
        c4ccXXXXXToPassX = c4ccXXXXX -> passX "Uses"
        c4ccXXXXXXToPassX = c4ccXXXXXX -> passX "Uses"
        c4ccXXXXXXXToPassX = c4ccXXXXXXX -> passX "Uses"
        ccfToPassX = ccf -> passX "Uses"
        c4csXXXXToPassX = c4csXXXX -> passX "Uses"
        c4mmXToPassX = c4mmX -> passX "Uses"
        c4mpToPassX = c4mp -> passX "Uses"
        c4caXXToPbm = c4caXX -> pbm "Uses"
        ccfToPbm = ccf -> pbm "Uses"
        c4cfToPbm = c4cf -> pbm "Uses"
        c4ciXToPc = c4ciX -> pc "Uses"
        c4caXXToPc = c4caXX -> pc "Uses"
        c4ccXXXXXToPc = c4ccXXXXX -> pc "Uses"
        c4ccXXXXXXXXToPc = c4ccXXXXXXXX -> pc "Uses"
        c4ccXXXXXXXXXToPc = c4ccXXXXXXXXX -> pc "Uses"
        c4ccXXXXXXXXXXToPc = c4ccXXXXXXXXXX -> pc "Uses"
        c4ccXXXXXXXXXXXToPc = c4ccXXXXXXXXXXX -> pc "Uses"
        c4ccXXXXXXXXXXXXToPc = c4ccXXXXXXXXXXXX -> pc "Uses"
        c4ccXXXXXXToPc = c4ccXXXXXX -> pc "Uses"
        c4ccXXXXXXXToPc = c4ccXXXXXXX -> pc "Uses"
        ccfToPc = ccf -> pc "Uses"
        c4cfToPc = c4cf -> pc "Uses"
        c4csXXXXToPc = c4csXXXX -> pc "Uses"
        c4f4ToPc = c4f4 -> pc "Uses"
        c4m4ToPc = c4m4 -> pc "Uses"
        c4mmXToPc = c4mmX -> pc "Uses"
        c4mpToPc = c4mp -> pc "Uses"
        c4ciXToPcgs = c4ciX -> pcgs "Uses"
        c4csToPcgs = c4cs -> pcgs "Uses"
        c4caXXToPcgs = c4caXX -> pcgs "Uses"
        c4ccXXXXXXXXXToPcgs = c4ccXXXXXXXXX -> pcgs "Uses"
        c4ccXXXXXXXXXXXXToPcgs = c4ccXXXXXXXXXXXX -> pcgs "Uses"
        c4ccXXXXXXXToPcgs = c4ccXXXXXXX -> pcgs "Uses"
        c4ccXXXToPcgs = c4ccXXX -> pcgs "Uses"
        c4csXXXXToPcgs = c4csXXXX -> pcgs "Uses"
        c4m4ToPcgs = c4m4 -> pcgs "Uses"
        c4mcToPcgs = c4mc -> pcgs "Uses"
        c4mmXToPcgs = c4mmX -> pcgs "Uses"
        c4mpToPcgs = c4mp -> pcgs "Uses"
        c4ciXToPcps = c4ciX -> pcps "Uses"
        c4csToPcps = c4cs -> pcps "Uses"
        c4caXXToPcps = c4caXX -> pcps "Uses"
        c4ccXXXXXToPcps = c4ccXXXXX -> pcps "Uses"
        c4ccXXXXXXXXXToPcps = c4ccXXXXXXXXX -> pcps "Uses"
        c4ccXXXXXXXToPcps = c4ccXXXXXXX -> pcps "Uses"
        c4ccXXXToPcps = c4ccXXX -> pcps "Uses"
        c4mpToPcps = c4mp -> pcps "Uses"
        c4caXXXToPdap = c4caXXX -> pdap "Uses"
        c4csToPfas = c4cs -> pfas "Uses"
        c4caXXToPfas = c4caXX -> pfas "Uses"
        c4ccXXXXXToPfas = c4ccXXXXX -> pfas "Uses"
        ccfToPfas = ccf -> pfas "Uses"
        c4csXXXXToPfas = c4csXXXX -> pfas "Uses"
        c4ciXToPge = c4ciX -> pge "Uses"
        c4csToPge = c4cs -> pge "Uses"
        c4ctXToPge = c4ctX -> pge "Uses"
        c4caXXToPge = c4caXX -> pge "Uses"
        c4ccXXXXXXXXXXXXXToPge = c4ccXXXXXXXXXXXXX -> pge "Uses"
        c4ccXXXXToPge = c4ccXXXX -> pge "Uses"
        c4ccXXXXXXXXXXXXXXToPge = c4ccXXXXXXXXXXXXXX -> pge "Uses"
        c4ccXXXXXToPge = c4ccXXXXX -> pge "Uses"
        c4ccXXXXXXXXToPge = c4ccXXXXXXXX -> pge "Uses"
        c4ccXXXXXXXXXToPge = c4ccXXXXXXXXX -> pge "Uses"
        c4ccXXXXXXXXXXXXXXXToPge = c4ccXXXXXXXXXXXXXXX -> pge "Uses"
        c4ccXXXXXXXXXXToPge = c4ccXXXXXXXXXX -> pge "Uses"
        c4ccXXXXXXXXXXXToPge = c4ccXXXXXXXXXXX -> pge "Uses"
        c4ccXXXXXXXXXXXXToPge = c4ccXXXXXXXXXXXX -> pge "Uses"
        c4ccXXXXXXToPge = c4ccXXXXXX -> pge "Uses"
        c4ccXXXXXXXToPge = c4ccXXXXXXX -> pge "Uses"
        c4ccXXToPge = c4ccXX -> pge "Uses"
        c4ccXXXXXXXXXXXXXXXXToPge = c4ccXXXXXXXXXXXXXXXX -> pge "Uses"
        c4ccXToPge = c4ccX -> pge "Uses"
        c4ccXXXToPge = c4ccXXX -> pge "Uses"
        ccfToPge = ccf -> pge "Uses"
        c4cpToPge = c4cp -> pge "Uses"
        c4csXXXXToPge = c4csXXXX -> pge "Uses"
        c4f4ToPge = c4f4 -> pge "Uses"
        c4mToPge = c4m -> pge "Uses"
        c4m4XToPge = c4m4X -> pge "Uses"
        c4m4ToPge = c4m4 -> pge "Uses"
        c4mcToPge = c4mc -> pge "Uses"
        c4mmXToPge = c4mmX -> pge "Uses"
        c4mpToPge = c4mp -> pge "Uses"
        c4ccXXXXXXToPip = c4ccXXXXXX -> pip "Uses"
        c4ccXXXXXXXToPip = c4ccXXXXXXX -> pip "Uses"
        ccfToPip = ccf -> pip "Uses"
        c4cfToPip = c4cf -> pip "Uses"
        c4mmXToPip = c4mmX -> pip "Uses"
        c4mpToPip = c4mp -> pip "Uses"
        c4ccXXXToPittX = c4ccXXX -> pittX "Uses"
        c4csToPmam = c4cs -> pmam "Uses"
        c4ccXXXXXXXToPmam = c4ccXXXXXXX -> pmam "Uses"
        ccfToPmam = ccf -> pmam "Uses"
        c4cfToPmam = c4cf -> pmam "Uses"
        c4csToPmmX = c4cs -> pmmX "Uses"
        c4caXXToPmmX = c4caXX -> pmmX "Uses"
        c4ccXXXXXToPmmX = c4ccXXXXX -> pmmX "Uses"
        c4ccXXXXXXXXXXToPmmX = c4ccXXXXXXXXXX -> pmmX "Uses"
        c4ccXXXXXXXXXXXXToPmmX = c4ccXXXXXXXXXXXX -> pmmX "Uses"
        c4ccXXXXXXToPmmX = c4ccXXXXXX -> pmmX "Uses"
        c4ccXXXXXXXToPmmX = c4ccXXXXXXX -> pmmX "Uses"
        c4ccXXToPmmX = c4ccXX -> pmmX "Uses"
        c4m4XToPmmX = c4m4X -> pmmX "Uses"
        c4mmXToPmmX = c4mmX -> pmmX "Uses"
        c4csToPofg = c4cs -> pofg "Uses"
        c4ccXXXXXXXToPofg = c4ccXXXXXXX -> pofg "Uses"
        ccfToPofg = ccf -> pofg "Uses"
        c4cfToPofg = c4cf -> pofg "Uses"
        c4csToPppsXXX = c4cs -> pppsXXX "Uses"
        c4caXXToPppsXXX = c4caXX -> pppsXXX "Uses"
        c4ccXXXXXToPppsXXX = c4ccXXXXX -> pppsXXX "Uses"
        c4ccXXXXXXXXXXXToPppsXXX = c4ccXXXXXXXXXXX -> pppsXXX "Uses"
        c4ccXXXXXXXToPppsXXX = c4ccXXXXXXX -> pppsXXX "Uses"
        c4ccXToPppsXXX = c4ccX -> pppsXXX "Uses"
        c4csXXXXToPppsXXX = c4csXXXX -> pppsXXX "Uses"
        c4m4XToPppsXXX = c4m4X -> pppsXXX "Uses"
        c4m4ToPppsXXX = c4m4 -> pppsXXX "Uses"
        c4mmXToPppsXXX = c4mmX -> pppsXXX "Uses"
        c4mpToPppsXXX = c4mp -> pppsXXX "Uses"
        c4ciXToPppsXXXX = c4ciX -> pppsXXXX "Uses"
        c4csToPppsXXXX = c4cs -> pppsXXXX "Uses"
        c4caXXToPppsXXXX = c4caXX -> pppsXXXX "Uses"
        c4ccXXXXXToPppsXXXX = c4ccXXXXX -> pppsXXXX "Uses"
        c4ccXXXXXXXXXXToPppsXXXX = c4ccXXXXXXXXXX -> pppsXXXX "Uses"
        c4ccXXXXXXXXXXXToPppsXXXX = c4ccXXXXXXXXXXX -> pppsXXXX "Uses"
        c4ccXXXXXXXToPppsXXXX = c4ccXXXXXXX -> pppsXXXX "Uses"
        ccfToPppsXXXX = ccf -> pppsXXXX "Uses"
        c4m4XToPppsXXXX = c4m4X -> pppsXXXX "Uses"
        c4mmXToPppsXXXX = c4mmX -> pppsXXXX "Uses"
        c4caXXToPpp = c4caXX -> ppp "Uses"
        c4ccXXXXXXXXXXXXXToPpp = c4ccXXXXXXXXXXXXX -> ppp "Uses"
        c4ccXXXXXToPpp = c4ccXXXXX -> ppp "Uses"
        c4ccXXXXXXXXToPpp = c4ccXXXXXXXX -> ppp "Uses"
        c4ccXXXXXXXXXToPpp = c4ccXXXXXXXXX -> ppp "Uses"
        c4ccXXXXXXXXXXXXXXXToPpp = c4ccXXXXXXXXXXXXXXX -> ppp "Uses"
        c4ccXXXXXXXXXXToPpp = c4ccXXXXXXXXXX -> ppp "Uses"
        c4ccXXXXXXXXXXXToPpp = c4ccXXXXXXXXXXX -> ppp "Uses"
        c4ccXXXXXXXXXXXXToPpp = c4ccXXXXXXXXXXXX -> ppp "Uses"
        c4ccXXXXXXToPpp = c4ccXXXXXX -> ppp "Uses"
        c4ccXXXXXXXToPpp = c4ccXXXXXXX -> ppp "Uses"
        ccfToPpp = ccf -> ppp "Uses"
        c4csXXXXToPpp = c4csXXXX -> ppp "Uses"
        c4f4ToPpp = c4f4 -> ppp "Uses"
        c4m4XToPpp = c4m4X -> ppp "Uses"
        c4mmXToPpp = c4mmX -> ppp "Uses"
        epToPpp = ep -> ppp "Uses"
        c4csToPpc = c4cs -> ppc "Uses"
        c4caXXToPpc = c4caXX -> ppc "Uses"
        c4caXToPpc = c4caX -> ppc "Uses"
        c4ccXXXXXToPpc = c4ccXXXXX -> ppc "Uses"
        c4ccXXXXXXXXToPpc = c4ccXXXXXXXX -> ppc "Uses"
        c4ccXXXXXXXXXToPpc = c4ccXXXXXXXXX -> ppc "Uses"
        c4ccXXXXXXXXXXToPpc = c4ccXXXXXXXXXX -> ppc "Uses"
        c4ccXXXXXXXXXXXToPpc = c4ccXXXXXXXXXXX -> ppc "Uses"
        c4ccXXXXXXXXXXXXToPpc = c4ccXXXXXXXXXXXX -> ppc "Uses"
        c4ccXXXXXXToPpc = c4ccXXXXXX -> ppc "Uses"
        c4ccXXXXXXXToPpc = c4ccXXXXXXX -> ppc "Uses"
        c4csXXXXToPpc = c4csXXXX -> ppc "Uses"
        c4m4XToPpc = c4m4X -> ppc "Uses"
        c4mmXToPpc = c4mmX -> ppc "Uses"
        c4ccXXXToPrta = c4ccXXX -> prta "Uses"
        ccfToPswo = ccf -> pswo "Uses"
        c4cfToPswo = c4cf -> pswo "Uses"
        c4ccXXXXXXXToPsfv = c4ccXXXXXXX -> psfv "Uses"
        c4ccXXXToPsfv = c4ccXXX -> psfv "Uses"
        c4m4ToPsfv = c4m4 -> psfv "Uses"
        c4ccXXXToPtis = c4ccXXX -> ptis "Uses"
        c4cToPvbX = c4c -> pvbX "Uses"
        c4caXToPvbX = c4caX -> pvbX "Uses"
        c4ccXXXXXXXToPvbX = c4ccXXXXXXX -> pvbX "Uses"
        c4ccXXXXXXXXXXXXXXXXToPvbX = c4ccXXXXXXXXXXXXXXXX -> pvbX "Uses"
        c4ccXXXToPvbX = c4ccXXX -> pvbX "Uses"
        c4ciXToPve = c4ciX -> pve "Uses"
        c4csToPve = c4cs -> pve "Uses"
        c4caXXToPve = c4caXX -> pve "Uses"
        c4ccXXXXXToPve = c4ccXXXXX -> pve "Uses"
        c4ccXXXXXXXXXXXToPve = c4ccXXXXXXXXXXX -> pve "Uses"
        c4ccXXXXXXXToPve = c4ccXXXXXXX -> pve "Uses"
        c4ccXXXToPve = c4ccXXX -> pve "Uses"
        c4csXXXXToPve = c4csXXXX -> pve "Uses"
        c4mmXToPve = c4mmX -> pve "Uses"
        c4mpToPve = c4mp -> pve "Uses"
        c4ciXToPvms = c4ciX -> pvms "Uses"
        c4caXXToPvms = c4caXX -> pvms "Uses"
        c4ccXXXXXToPvms = c4ccXXXXX -> pvms "Uses"
        c4ccXXXXXXXToPvms = c4ccXXXXXXX -> pvms "Uses"
        c4ccXXXToPvma = c4ccXXX -> pvma "Uses"
        c4cfToSounXX = c4cf -> sounXX "Uses"
        c4ccXToSsfa = c4ccX -> ssfa "Uses"
        c4ccXXXToTb = c4ccXXX -> tb "Uses"
        epToDist = ep -> dist "Uses"
        c4caXXToPasc = c4caXX -> pasc "Uses"
        c4caXXXXToPasc = c4caXXXX -> pasc "Uses"
        c4ccXXXXXToPasc = c4ccXXXXX -> pasc "Uses"
        ccfToPasc = ccf -> pasc "Uses"
        c4csToPcf = c4cs -> pcf "Uses"
        c4caXXToPcf = c4caXX -> pcf "Uses"
        c4ccXXXXXXToPcf = c4ccXXXXXX -> pcf "Uses"
        c4ccXXXXXXXToPcf = c4ccXXXXXXX -> pcf "Uses"
        ccfToPcf = ccf -> pcf "Uses"
        c4cfToPcf = c4cf -> pcf "Uses"
        c4ciXToPcc = c4ciX -> pcc "Uses"
        c4csToPcc = c4cs -> pcc "Uses"
        c4caXXToPcc = c4caXX -> pcc "Uses"
        c4ccXXXXXXXXXXXXXToPcc = c4ccXXXXXXXXXXXXX -> pcc "Uses"
        c4ccXXXXToPcc = c4ccXXXX -> pcc "Uses"
        c4ccXXXXXToPcc = c4ccXXXXX -> pcc "Uses"
        c4ccXXXXXXXXToPcc = c4ccXXXXXXXX -> pcc "Uses"
        c4ccXXXXXXXXXToPcc = c4ccXXXXXXXXX -> pcc "Uses"
        c4ccXXXXXXXXXXXXXXXToPcc = c4ccXXXXXXXXXXXXXXX -> pcc "Uses"
        c4ccXXXXXXXXXXToPcc = c4ccXXXXXXXXXX -> pcc "Uses"
        c4ccXXXXXXXXXXXToPcc = c4ccXXXXXXXXXXX -> pcc "Uses"
        c4ccXXXXXXXXXXXXToPcc = c4ccXXXXXXXXXXXX -> pcc "Uses"
        c4ccXXXXXXToPcc = c4ccXXXXXX -> pcc "Uses"
        c4ccXXXXXXXToPcc = c4ccXXXXXXX -> pcc "Uses"
        ccfToPcc = ccf -> pcc "Uses"
        c4csXXXXToPcc = c4csXXXX -> pcc "Uses"
        c4f4ToPcc = c4f4 -> pcc "Uses"
        c4m4XToPcc = c4m4X -> pcc "Uses"
        c4mmXToPcc = c4mmX -> pcc "Uses"
        epToPcc = ep -> pcc "Uses"
        c4ciXToPp = c4ciX -> pp "Uses"
        c4csToPp = c4cs -> pp "Uses"
        c4caXXToPp = c4caXX -> pp "Uses"
        c4ccXXXXXToPp = c4ccXXXXX -> pp "Uses"
        c4ccXXXXXXXXToPp = c4ccXXXXXXXX -> pp "Uses"
        c4ccXXXXXXXXXToPp = c4ccXXXXXXXXX -> pp "Uses"
        c4ccXXXXXXXXXXToPp = c4ccXXXXXXXXXX -> pp "Uses"
        c4ccXXXXXXXXXXXToPp = c4ccXXXXXXXXXXX -> pp "Uses"
        c4ccXXXXXXXXXXXXToPp = c4ccXXXXXXXXXXXX -> pp "Uses"
        c4ccXXXXXXToPp = c4ccXXXXXX -> pp "Uses"
        c4ccXXXXXXXToPp = c4ccXXXXXXX -> pp "Uses"
        c4ccXXXToPp = c4ccXXX -> pp "Uses"
        ccfToPp = ccf -> pp "Uses"
        c4f4ToPp = c4f4 -> pp "Uses"
        c4mcToPp = c4mc -> pp "Uses"
        c4caXXToPpX = c4caXX -> ppX "Uses"
        c4ccXXXXXToPpX = c4ccXXXXX -> ppX "Uses"
        c4ccXXXXXXXXToPpX = c4ccXXXXXXXX -> ppX "Uses"
        c4ccXXXToPpX = c4ccXXX -> ppX "Uses"
        ccfToPpX = ccf -> ppX "Uses"
        c4csXXXXXToAs = c4csXXXXX -> as "Uses"
        c4csToBarb = c4cs -> barb "Uses"
        c4csXXXXXXToBarb = c4csXXXXXX -> barb "Uses"
        c4ccToBor = c4cc -> bor "Uses"
        c4ciToBor = c4ci -> bor "Uses"
        c4csToBor = c4cs -> bor "Uses"
        c4ctXToBor = c4ctX -> bor "Uses"
        c4csXXXXXXXToCedw = c4csXXXXXXX -> cedw "Uses"
        c4csXXXXXXToCedw = c4csXXXXXX -> cedw "Uses"
        c4ctXXToCedw = c4ctXX -> cedw "Uses"
        c4csXXXXXXXToC4 = c4csXXXXXXX -> c4 "Uses"
        c4csToDcri = c4cs -> dcri "Uses"
        c4ciXXToDcrs = c4ciXX -> dcrs "Uses"
        c4mmToDcrs = c4mm -> dcrs "Uses"
        c4mmXXToDcrs = c4mmXX -> dcrs "Uses"
        c4csToDf = c4cs -> df "Uses"
        c4csXToDf = c4csX -> df "Uses"
        c4mpXToTabl = c4mpX -> tabl "Uses"
        c4mpXToWa = c4mpX -> wa "Uses"
        ccfToAtax = ccf -> atax "Uses"
        ccfToBbp = ccf -> bbp "Uses"
        c4XToBsw = c4X -> bsw "Uses"
        ccfToBsw = ccf -> bsw "Uses"
        ccfrssToBsw = ccfrss -> bsw "Uses"
        ccfToEbs = ccf -> ebs "Uses"
        ccfrssToEbs = ccfrss -> ebs "Uses"
        c4XToFaf = c4X -> faf "Uses"
        ccfToMsc = ccf -> msc "Uses"
        ccfToSov = ccf -> sov "Uses"
        ccfToSbi = ccf -> sbi "Uses"
        ccfrssToSbi = ccfrss -> sbi "Uses"
        ccfrssToTgn = ccfrss -> tgn "Uses"
        ccfToWda = ccf -> wda "Uses"
        c4ccXXXXXXXXXXXXXXXXToLsp = c4ccXXXXXXXXXXXXXXXX -> lsp "Uses"
        c4ccXXXToLsp = c4ccXXX -> lsp "Uses"
        c4ctToLsp = c4ct -> lsp "Uses"
        c4ctToSp = c4ct -> sp "Uses"
        c4mmXXToBraz = c4mmXX -> braz "Uses"
        c4mpXXToMparX = c4mpXX -> mparX "Uses"
        c4mpXXXToMparX = c4mpXXX -> mparX "Uses"
        c4ccXXXXXToAwar = c4ccXXXXX -> awar "Uses"
        c4csXXXToMsp = c4csXXX -> msp "Uses"
        c4ccXXXXXXXXXXXXXXXXXToMsp = c4ccXXXXXXXXXXXXXXXXX -> msp "Uses"
        c4ccXXXXXXXToMsp = c4ccXXXXXXX -> msp "Uses"
        c4ccXToMsp = c4ccX -> msp "Uses"
        c4ctToMsp = c4ct -> msp "Uses"
        c4m4XToMsp = c4m4X -> msp "Uses"
        epToMsp = ep -> msp "Uses"
        c4caXToPpsp = c4caX -> ppsp "Uses"
        c4ctToPpsp = c4ct -> ppsp "Uses"
        c4m4XToPpsp = c4m4X -> ppsp "Uses"
        c4XTo4peo = c4X -> 4peo "Uses"
        c4cpTo4peo = c4cp -> 4peo "Uses"
        c4XToActi = c4X -> acti "Uses"
        c4cpToActi = c4cp -> acti "Uses"
        c4cXToAcXX = c4cX -> acXX "Uses"
        c4XToBp = c4X -> bp "Uses"
        c4cpXToBp = c4cpX -> bp "Uses"
        c4ctXXXToEr = c4ctXXX -> er "Uses"
        c4XToFes = c4X -> fes "Uses"
        c4cpToFes = c4cp -> fes "Uses"
        c4XToLl = c4X -> ll "Uses"
        c4cpXXToLl = c4cpXX -> ll "Uses"
        c4cpToPopp = c4cp -> popp "Uses"
        c4XToTlh = c4X -> tlh "Uses"
        c4csToPrms = c4cs -> prms "Uses"
        c4caXXToPrms = c4caXX -> prms "Uses"
        c4ccXXXXXToPrms = c4ccXXXXX -> prms "Uses"
        c4ccXXXXXXXXXToPrms = c4ccXXXXXXXXX -> prms "Uses"
        c4ccXXXXXXXToPrms = c4ccXXXXXXX -> prms "Uses"
        c4ccXXXToPrms = c4ccXXX -> prms "Uses"
        ccfToPrms = ccf -> prms "Uses"
        c4m4ToPrms = c4m4 -> prms "Uses"
        c4mmXToPrms = c4mmX -> prms "Uses"
        c4caXXToRcX = c4caXX -> rcX "Uses"
        c4ciToCome = c4ci -> come "Uses"
        c4caXXToCome = c4caXX -> come "Uses"
        c4ccXXXToCome = c4ccXXX -> come "Uses"
        ccfrssToCome = ccfrss -> come "Uses"
        c4caXXToEps = c4caXX -> eps "Uses"
        c4caXXToNeo = c4caXX -> neo "Uses"
        c4csToPap = c4cs -> pap "Uses"
        c4caXXToPap = c4caXX -> pap "Uses"
        ccfToPap = ccf -> pap "Uses"
        c4csXXXXToPap = c4csXXXX -> pap "Uses"
        c4caXXToPris = c4caXX -> pris "Uses"
        c4ccXXXToPris = c4ccXXX -> pris "Uses"
        ccfToPris = ccf -> pris "Uses"
        c4m4ToPris = c4m4 -> pris "Uses"
        c4caXXToPrrs = c4caXX -> prrs "Uses"
        ccfToPrrs = ccf -> prrs "Uses"
        c4caXXToSd = c4caXX -> sd "Uses"
        c4m4ToTed = c4m4 -> ted "Uses"
        c4ccXXXXXToPepl = c4ccXXXXX -> pepl "Uses"
        c4ccXXXXXXToPepl = c4ccXXXXXX -> pepl "Uses"
        c4ccXXXXXXXToPepl = c4ccXXXXXXX -> pepl "Uses"
        c4ccXXXToPepl = c4ccXXX -> pepl "Uses"
        c4mcToPepl = c4mc -> pepl "Uses"
        c4caXToAnda = c4caX -> anda "Uses"
        c4ccXXXToAnda = c4ccXXX -> anda "Uses"
        c4cfXToCms = c4cfX -> cms "Uses"
        c4caXXXXXToFa = c4caXXXXX -> fa "Uses"
        c4ctXXToTime = c4ctXX -> time "Uses"
        evToC4sl = ev -> c4sl "Uses"
        c4mpXXXXToPipe = c4mpXXXX -> pipe "Uses"
        c4mpXXXXXToSm = c4mpXXXXX -> sm "Uses"
        c4ctXXToSl = c4ctXX -> sl "Uses"
        c4ccXXXToTr = c4ccXXX -> tr "Uses"
        c4mpXXToThin = c4mpXX -> thin "Uses"
        c4cfXXToCe = c4cfXX -> ce "Uses"
        c4XToEgen = c4X -> egen "Uses"
        ccfToEgen = ccf -> egen "Uses"

        /* ============================================================
           APPLICATION -> APPLICATION RELATIONSHIPS (from LeanIX Interfaces)
           ============================================================ */
        
        4ta = 4peo -> acti "4People to ActivePay" "Mule" "Integration"
        4tac = 4peo -> acXX "4People to Alert cascade" "Mule" "Integration"
        4tb = 4peo -> acXX "4People to Benefits" "Mule" "Integration"
        4tce = 4peo -> ce "4People to Concept Evolution" "Mule" "Integration"
        4tcm = 4peo -> cms "4People to Contract Management System(CMS)" "Mule" "Integration"
        4tc = 4peo -> tlh "4People to Cornerstone" "Mule" "Integration"
        4te = 4peo -> egen "4People to Egencia" "Mule" "Integration"
        4toe = 4peo -> ebs "4People to Oracle EBS" "Mule" "Integration"
        4tp = 4peo -> wda "4People to Planning" "Alternative" "Integration"
        4tpX = 4peo -> popp "4People to Poppulo" "Mule" "Integration"
        atsf = passX -> stel "A55 to Stellar for Advanced Schedule data flow" "SFTP" "Integration"
        aptf = acti -> wda "Active Pay to Financial Planning" "Mule" "Integration"
        atoe = acti -> ebs "ActivPay to Oracle EBS" "Mule" "Integration"
        aate = wa -> cedw "Adobe Analytics to EDW" "Alternative" "Integration"
        apff = ap -> pbm "Agency Portal fetch from Pirate for Brand" "Mule" "Integration"
        apffX = ap -> stel "Agency Portal fetch from Stellar for Programme" "Mule" "Integration"
        apfs = ap -> stel "Agency Portal from Stellar for Pick Your Own transmission" "Mule" "Integration"
        ai = pcc -> prrs "Agreement Information" "Alternative" "Integration"
        apX = sd -> pap "Artist payments" "Automate" "Integration"
        adaa = asp -> msp "ASP Delivery Acknowledgment API" "Alternative" "Integration"
        alss = lsp -> asp "ASP live subtitle streams to LSP" "Alternative" "Integration"
        alls = asp -> lsp "ASP low latency stream from LSP" "Alternative" "Integration"
        apja = asp -> msp "ASP Production Job API" "Alternative" "Integration"
        apjs = msp -> asp "ASP Production Job Status API" "Alternative" "Integration"
        asfp = asp -> pira "ASP Schedule from Pirate" "Alternative" "Integration"
        assm = asp -> msp "ASP Signer Source Media File Delivery" "Alternative" "Integration"
        avcm = asp -> msp "ASP Viewing Copy Media File Delivery" "Alternative" "Integration"
        asal = fsh -> as "Audience Segments and Lookalikes to Freewheel" "Alternative" "Integration"
        bwpfo = ebs -> bbp "BACS & Wire Payments File Out" "Automate" "Integration"
        brdt = barb -> cedw "BARB ratings data to EDW" "SFTP" "Integration"
        btsf = barb -> stel "BARB to Stellar for Audience Universe" "SFTP" "Integration"
        btsfX = barb -> stel "BARB to Stellar for Impacts" "SFTP" "Integration"
        bpsri = bbp -> ebs "Barclay Payment Statement Receipt In" "Automate" "Integration"
        bsi = bbp -> ebs "Barclay Statement In" "Automate" "Integration"
        bbdc = ebs -> bsw "Basware Business Department Codes" "Alternative" "Integration"
        bcer = ebs -> bsw "Basware Currency Exchange Rates" "Alternative" "Integration"
        bglcvr = ebs -> bsw "Basware GL Cross Validation Rules" "Alternative" "Integration"
        bglnc = ebs -> bsw "Basware GL Nominal Codes" "Alternative" "Integration"
        bic = ebs -> bsw "Basware Individual Codes" "Alternative" "Integration"
        bis = bsw -> ebs "Basware Invoice Statuses" "Alternative" "Integration"
        bpvpci = ebs -> bsw "Basware Payments/Void Payments/Cancelled Invoices" "Alternative" "Integration"
        bpcc = ebs -> bsw "Basware Pirate Code Combinations" "Alternative" "Integration"
        bprodc = ebs -> bsw "Basware Product Codes" "Alternative" "Integration"
        bprojc = ebs -> bsw "Basware Project Codes" "Alternative" "Integration"
        bws = ebs -> bsw "Basware Suppliers" "Alternative" "Integration"
        b2ebs = bsw -> ebs "Basware to EBS for Approved Invoices" "Automate" "Integration"
        b2sbi = bsw -> ebs "Basware to SplashBI (Oracle eBS Schema)" "Alternative" "Integration"
        b2sbi2 = bsw -> sbi "Basware to SplashBI (Oracle eBS Schema)" "Alternative" "Integration"
        bur = ebs -> bsw "Basware User Rights" "Alternative" "Integration"
        buriu = ebs -> bsw "Basware User Rights (Inactive users)" "Alternative" "Integration"
        bta = acti -> bp "Benefits to Actvipay" "Alternative" "Integration"
        bdte = stel -> cedw "Budget data to EDW" "Alternative" "Integration"
        btmi = modX -> bynd "Bynder to MediaGenix Image Integration" "Alternative" "Integration"
        btmiX = modX -> bynd "Bynder to MediaGenix Image Tagging Changes" "Alternative" "Integration"
        chpt = er -> bor "C4 HR & Payroll to PowerBI Reporting" "Mule" "Integration"
        4io = ebs -> come "C4 intl overages" "SFTP" "Integration"
        4vatr = sov -> ebs "C4 VAT Returns" "Alternative" "Integration"
        cbsd = sm -> cedw "C4S Braintree Subscriber data to EDW" "Alternative" "Integration"
        cetf = free -> pepl "C4S EPG to Freely" "Alternative" "Integration"
        cete = mparX -> cedw "C4S Events to EDW" "Alternative" "Integration"
        cfve = ova -> free "C4S Freely Video Events to BitMovin Analytics" "Alternative" "Integration"
        cfvs = cdna -> free "C4S Freely Video Stream from CDN" "Alternative" "Integration"
        cmif = cdna -> modX "C4S MoD Images from CDN" "Alternative" "Integration"
        cqte = ova -> cedw "C4S QoS to EDW" "Alternative" "Integration"
        ctaa = wa -> c4sl "C4S to Adobe Analytics" "Alternative" "Integration"
        ctb = barb -> c4sl "C4S to BARB" "Alternative" "Integration"
        ctc7 = c4sl -> c7t "C4S to C4 7A Titles" "Alternative" "Integration"
        ctlv = lsp -> c4sl "C4S to Licence Validation Service" "Alternative" "Integration"
        ctsm = sm -> c4sl "C4S to Subscription Management (Aptitude)" "Alternative" "Integration"
        ctt- = thin -> c4sl "C4S to ThinkAnalytics - User Events" "Alternative" "Integration"
        ctet = wa -> mparX "C4S Tracking Events to Adobe Analytics" "Alternative" "Integration"
        ctetX = mparX -> c4sl "C4S Tracking Events to mParticle" "Alternative" "Integration"
        cvmt = free -> modX "C4S VoD Metadata to Freely" "Alternative" "Integration"
        c4st = po -> po "C4STELLARPROMO" "Alternative" "Integration"
        c4st2 = po -> stel "C4STELLARPROMO" "Alternative" "Integration"
        caap = ap -> stel "CARIA and Agency Portal from Stellar for Deals" "Mule" "Integration"
        cfsf = cari -> stel "CARIA from Stellar for Copy Rotation Instruction" "Mule" "Integration"
        ctsf = cari -> stel "CARIA to Stellar for Copy Rotation Instructions" "SFTP" "Integration"
        ctsfX = cari -> stel "CARIA to STELLAR for Deals and Campaign creation" "SFTP" "Integration"
        cro2c = ebs -> come "Cash Receipts from Oracle to Comet" "Alternative" "Integration"
        ctt = pcgs -> ptis "CGS to TIS2" "Alternative" "Integration"
        c4it = msp -> pmmX "Channel 4 Interstitals to RedBee" "Mule" "Integration"
        c4sr = braz -> c4sl "Channel 4 Streaming Recommendations to Braze" "Alternative" "Integration"
        c4tp = msp -> asp "Channel 4 to PFT token" "Mule" "Integration"
        crbt = as -> dcri "Clean Room (Brandm4tch) to Audience Segmentation" "Alternative" "Integration"
        crbt2 = as -> dcrs "Clean Room (Brandm4tch) to Audience Segmentation" "Alternative" "Integration"
        ctsfXX = fsh -> stel "Clearcast to Stellar for Copy Clearance Information" "Mule" "Integration"
        ctf = fsh -> cmt "CMT to Freewheel" "Alternative" "Integration"
        ctp = pira -> cmt "CMT to Pirate" "Mule" "Integration"
        ctpc = cmt -> pcX "CMT to Promo Create" "Alternative" "Integration"
        ctpo = po -> cmt "CMT to Promo Optimiser" "Alternative" "Integration"
        ccii = come -> ebs "Comet C4I Invoice Interface" "Alternative" "Integration"
        cffli = ebs -> come "Comet FFL Invoice Interface" "Automate" "Integration"
        cai = pira -> pris "Contract & Agreement info" "Mule" "Integration"
        caiX = pcc -> pap "Contract/Prog & Agreement info" "Alternative" "Integration"
        cpdt = pira -> anda "Contracts PAC data to Anda" "Alternative" "Integration"
        cctf = cc -> fsh "Copy Central to Freewheel" "Alternative" "Integration"
        ccts = cc -> stel "Copy Central to Stellar" "Alternative" "Integration"
        ctll = tlh -> ll "Cornerstone to LinkedIn Learning" "Alternative" "Integration"
        epct = fes -> ebs "EBS project codes to FES" "Alternative" "Integration"
        et4f = 4peo -> ebs "EBS to 4People for Employees" "Alternative" "Integration"
        ebstrd = ebs -> bsw "EBS to Basware for Reference & Transactional data" "Alternative" "Integration"
        etcf = come -> ebs "EBS to Comet for Cash Receipts" "SFTP" "Integration"
        ebsmc = msc -> ebs "EBS to Mastercard for Employee credit card transactions" "Alternative" "Integration"
        ebspir = ebs -> come "EBS to Pirate (Comet Flim4)" "Automate, SFTP" "Integration"
        ebsstr = ebs -> stel "EBS to Stellar Daily exchange rate (in) Invoices (out)" "Alternative" "Integration"
        ebscex = ebs -> stel "EBS to Stellar for Currency Exchange" "SFTP" "Integration"
        ebplan = ebs -> wda "eBusiness to Planning" "Alternative" "Integration"
        e4ti = dcri -> cedw "EDW 4 to Infosum" "Alternative" "Integration"
        emcs = df -> cedw "EDW Marketing Campaign Snapshots to Microsoft Data Fabric" "Alternative" "Integration"
        emct = df -> cedw "EDW Marketing Campaign to Microsoft Data Fabric" "Alternative" "Integration"
        esit = braz -> cedw "EDW Streaming Identity to Braze" "Alternative" "Integration"
        etdf = df -> cedw "EDW to  Data Fabric - Spots data" "Alternative" "Integration"
        etap = cedw -> pap "EDW to Artist Payment Systems (Pirate)" "Alternative" "Integration"
        etb = braz -> cedw "EDW to Braze" "Alternative" "Integration"
        etm- = cedw -> as "EDW to Mediarithmics - Instream Promo Control Audience Upload" "Alternative" "Integration"
        etm-X = as -> cedw "EDW to Mediarithmics - Streaming User Data" "Alternative" "Integration"
        ett- = thin -> cedw "EDW to ThinkAnalytics - Viewers" "Alternative" "Integration"
        etdfX = cedw -> pira "EDW TX data feed to Pirate" "Alternative" "Integration"
        fgl = pira -> ebs "Failed GL lines" "Alternative" "Integration"
        fvte = fsh -> cedw "Feewheel v4logs to EDW" "Alternative" "Integration"
        faebs = ebs -> faf "Finance Approval to E-Business Suite" "Alternative" "Integration"
        ffsf = fsh -> cedw "Freewheel from Stellar for Forecast data of VOD Campaign" "Mule" "Integration"
        ffsf2 = fsh -> stel "Freewheel from Stellar for Forecast data of VOD Campaign" "Mule" "Integration"
        fltm = fsh -> df "Freewheel logs to Microsoft Data Fabric" "Alternative" "Integration"
        ftie = dcri -> fsh "Freewheel to Infosum (Exposed Campaign Users Attribution)" "Alternative" "Integration"
        ftsf = fsh -> stel "Freewheel to Stellar for Freewheel reference data changes API" "Alternative" "Integration"
        ftsv = fsh -> stel "Freewheel to Stellar VoD Views for Commercial, Sponsorship and Promotions" "SFTP" "Integration"
        frtp = msp -> prta "From RedBee to Pirate ASRUN" "Mule" "Integration"
        fstp = stel -> pira "From Stellar to Pirate for Commercial Registrations" "Alternative" "Integration"
        idtc = bynd -> c4sl "Image DAM to C4S" "Alternative" "Integration"
        imcf = sounXX -> pira "Interstial music cuesheets from Soundmouse to Pirate" "Automate, SFTP" "Integration"
        icnf = pris -> ebs "Invoice/credit note for Royalties" "Automate" "Integration"
        lspp = pira -> c4sl "Logging Sheets & Programme Parts" "Alternative" "Integration"
        lcfl = lsp -> ppsp "LSP Contribution Feed ( Line Record)" "Alternative" "Integration"
        lmfd = lsp -> msp "LSP Media File Delivery" "Alternative" "Integration"
        lm = lsp -> osp "LSP Multicast" "Alternative" "Integration"
        lsto = osp -> lsp "LSP Simulcast to OSLP" "Alternative" "Integration"
        ltpa = pira -> lsp "LSP to Pirate Asruns" "Alternative" "Integration"
        mtbb = bynd -> modX "MediaGenix to Bynder Brand" "Alternative" "Integration"
        mtfp = fsh -> modX "MediaGenix to FreeWheel Programme Info" "Alternative" "Integration"
        mtgc = grac -> modX "MediaGenix to Gracenote Channel 4 VoD Catalogue" "Mule" "Integration"
        mtmb = modX -> modX "MediaGenix to MediaGenix BARB VOD Schedule Integration" "Alternative" "Integration"
        mtpe = pira -> modX "MediaGenix to Pirate EPG Content Warnings" "Mule" "Integration"
        mttc = thin -> modX "MediaGenix to ThinkAnalytics Channel 4 VoD Catalogue" "Mule" "Integration"
        mtbf = braz -> as "Mediarithmics to Braze for Marketing Segments" "Alternative" "Integration"
        mtff = fsh -> as "Mediarithmics to Freewheel for ALA segments" "Alternative" "Integration"
        mtic = dcri -> as "Mediarithmics to Infosum (Control Group attribution)" "Alternative" "Integration"
        mvrt = msp -> modX "MoD  VoD Request to PFT" "Alternative" "Integration"
        msdt = sm -> cedw "MPP Subscriber data to EDW" "Alternative" "Integration"
        mcra = msp -> asp "MSP Content Request API" "Alternative" "Integration"
        mcra2 = msp -> lsp "MSP Content Request API" "Alternative" "Integration"
        mcra3 = msp -> osp "MSP Content Request API" "Alternative" "Integration"
        mcra4 = msp -> ppsp "MSP Content Request API" "Alternative" "Integration"
        mmvf = msp -> osp "MSP Master Video Files to OLSP" "Alternative" "Integration"
        mmfd = msp -> dist "MSP Media File Delivery - Acquired BBC Studios" "Alternative" "Integration"
        mmfdX = msp -> dist "MSP Media File Delivery - Acquired Fox/Disney" "Alternative" "Integration"
        mmfdXX = msp -> dist "MSP Media File Delivery - Acquired Generic" "Alternative" "Integration"
        mmfdXXX = msp -> dist "MSP Media File Delivery - Acquired Sony" "Alternative" "Integration"
        mmfdXXXX = msp -> dist "MSP Media File Delivery - Acquired Turner" "Alternative" "Integration"
        mmfdXXXXX = msp -> dist "MSP Media File Delivery - Acquired Warner" "Alternative" "Integration"
        mmfdXXXXXX = msp -> cari "MSP Media File Delivery - Commercials" "Alternative" "Integration"
        mmfd2 = msp -> cc "MSP Media File Delivery - Commercials" "Alternative" "Integration"
        mmfdXXXXXXX = msp -> pcXX "MSP Media File Delivery - Commissioned Programmes" "Alternative" "Integration"
        mmfdXXXXXXXX = msp -> pcXX "MSP Media File Delivery - Interstitials" "Alternative" "Integration"
        mmfdXXXXXXXXX = msp -> lsp "MSP Media File Delivery - LSP Video Recordings" "Alternative" "Integration"
        mmfdXXXXXXXXXX = msp -> lsp "MSP Media File Delivery - LSP Voiceover Recordings" "Alternative" "Integration"
        mmfdXXXXXXXXXXX = msp -> stel "MSP Media File Delivery - MB Media to Stellar for Long Form teleshopping" "SFTP" "Integration"
        mmfdXXXXXXXXXXXX = msp -> cari "MSP Media File Delivery - Music Videos" "Alternative" "Integration"
        mmfdXXXXXXXXXXXXX = msp -> asp "MSP Media File Delivery - Subtitles & Audio Description" "Alternative" "Integration"
        mmfdXXXXXXXXXXXXXX = msp -> asp "MSP Media File Delivery - Supertrusted" "Alternative" "Integration"
        mmfd2X = msp -> ppsp "MSP Media File Delivery - Supertrusted" "Alternative" "Integration"
        mpvb = msp -> pvbX "MSP Pirate Video Browse API" "Alternative" "Integration"
        mpvbX = msp -> pvbX "MSP Pirate Video Browse File Hosting" "Alternative" "Integration"
        msfr = msp -> pira "MSP Schedule File Receipt" "Alternative" "Integration"
        mti = msp -> uv "MSP Tape Ingest" "Alternative" "Integration"
        mtp = pmmX -> msp "MSP to Pirate" "Mule" "Integration"
        mtrt = rta -> msp "MSP to Ready to Air" "Alternative" "Integration"
        mts = sounXX -> msp "MSP to Soundmouse" "Alternative" "Integration"
        mtc4 = msp -> pira "MSPs to Channel 4 DFS folders" "Mule" "Integration"
        nos = pc -> prrs "Name of Supplier" "Alternative" "Integration"
        ntn = pris -> pira "New transmitted notifications" "Alternative" "Integration"
        ebssbi = ebs -> ebs "Oracle EBS to SplashBI (Oracle eBS Schema)" "Alternative" "Integration"
        ebssbi2 = ebs -> sbi "Oracle EBS to SplashBI (Oracle eBS Schema)" "Alternative" "Integration"
        oscn = ebs -> prrs "Oracle suppliers contact names" "Alternative" "Integration"
        oatax = ebs -> atax "Oracle to AlphaTax" "Alternative" "Integration"
        opisx = ebs -> ebs "Oracle to PublicIS XML Invoice feed" "Mule" "Integration"
        otunx = ebs -> tgn "Oracle to Tungsten XML Invoice feed" "Mule" "Integration"
        pfpf = sounXX -> pira "PAC form PDFs from Soundmouse to Pirate" "Automate, SFTP" "Integration"
        pfxf = sounXX -> pira "PAC form XMLs from Soundmouse to Pirate" "Automate, SFTP" "Integration"
        pmfs = msp -> stel "Peach Media from Stellar for Attribution files" "Mule" "Integration"
        patv = pira -> passX "Pirate A55 to VMS (ex Optimum)" "Mule" "Integration"
        patv2 = pira -> pepl "Pirate A55 to VMS (ex Optimum)" "Mule" "Integration"
        patv3 = pira -> pvms "Pirate A55 to VMS (ex Optimum)" "Mule" "Integration"
        passXX = pira -> c4sl "Pirate Advance Scheduling System to C4S" "Alternative" "Integration"
        pctc = pira -> c4sl "Pirate Certification to C4S" "Alternative" "Integration"
        pctb = bynd -> pcgs "Pirate CGS to Bynder" "Mule" "Integration"
        pctf = fsh -> pcgs "Pirate CGS to Freewheel" "Mule" "Integration"
        pctm = msp -> pcgs "Pirate CGS to MSP for VPS origin" "Mule" "Integration"
        pcts = pcgs -> stel "Pirate CGS to Stellar for Programme and Platform information" "Alternative" "Integration"
        pctfX = fsh -> pcgs "Pirate Creatives to Freewheel" "Mule" "Integration"
        pffr = pira -> asp "Pirate fetch from RedBee for Subtitles" "Mule" "Integration"
        pirgl = ebs -> come "Pirate GL posted Transactions" "Alternative" "Integration"
        ppta = msp -> pppsXXX "Pirate PPS to AWS S3 Bucket" "Mule" "Integration"
        ppit = fsh -> pcgs "Pirate Programme Info to FreeWheel" "Mule" "Integration"
        prmsX = pira -> c4sl "Pirate Rights Management System to C4S" "Alternative" "Integration"
        prdt = prms -> cedw "PIRATE RMS data to  Oracle EDW" "Alternative" "Integration"
        pta = ac -> modX "Pirate To Amagi" "Alternative" "Integration"
        ptbf = modX -> pira "Pirate to BeBanjo for Catalogue Assets" "Mule" "Integration"
        ptbf2 = modX -> pp "Pirate to BeBanjo for Catalogue Assets" "Mule" "Integration"
        ptbfX = modX -> pira "Pirate to BeBanjo for Linear Scheduling" "Mule" "Integration"
        ptbf2X = modX -> passX "Pirate to BeBanjo for Linear Scheduling" "Mule" "Integration"
        ptbfXX = modX -> pira "Pirate to BeBanjo for Media Assets" "Mule" "Integration"
        ptbf2XX = modX -> pmmX "Pirate to BeBanjo for Media Assets" "Mule" "Integration"
        ptbfXXX = modX -> prms "Pirate to BeBanjo for Rights" "Mule" "Integration"
        ptbfXXXX = modX -> pira "Pirate to BeBanjo for Segment" "Mule" "Integration"
        ptbd = pmmX -> bynd "Pirate to Bynder data flow" "Alternative" "Integration"
        ptcp = msp -> pvbX "Pirate to Clear (Prime Focus Technology)" "Mule" "Integration"
        ptcs = pira -> msp "Pirate to Compliance Service" "Alternative" "Integration"
        ptdf = et -> pira "Pirate to DUK Freesat VOD publication" "Alternative" "Integration"
        ptdfX = et -> pira "Pirate to DUK Freeview VOD publication" "Alternative" "Integration"
        pte = pira -> ebs "Pirate to EBS" "Alternative" "Integration"
        ptes = pira -> msp "Pirate to Editorial Service" "Alternative" "Integration"
        ptgc = pira -> grac "Pirate to Gracenote Channel 4 channel EPGs" "Mule" "Integration"
        ptgm = pira -> grac "Pirate to Gracenote music channel EPGs" "Alternative" "Integration"
        ptk = pppsXXX -> barb "Pirate to Kantar" "Mule" "Integration"
        ptkf = barb -> pmmX "Pirate to Kantar for Assets" "Mule" "Integration"
        ptl = lsp -> pira "Pirate To LSP" "Alternative" "Integration"
        ptl2 = lsp -> stel "Pirate To LSP" "Alternative" "Integration"
        ptmo = modX -> pira "Pirate to MediaGenix On-Demand Content Metadata" "Mule" "Integration"
        ptmo2 = modX -> pepl "Pirate to MediaGenix On-Demand Content Metadata" "Mule" "Integration"
        ptpo = pppsXXX -> po "Pirate To Promo Optimser" "Mule" "Integration"
        ptss = lsp -> pppsXXX "Pirate to Schedule Service" "Alternative" "Integration"
        pts = pira -> stel "Pirate to Stellar" "Alternative" "Integration"
        ptsf = pittX -> stel "Pirate to Stellar for ASRUN commercial" "Automate, SFTP" "Integration"
        ptsfX = pppsXXX -> stel "Pirate to Stellar for ASRUN Non-commercial" "Alternative" "Integration"
        ptsfXX = pppsXXX -> stel "Pirate to Stellar for Schedule & Event timings" "Alternative" "Integration"
        ptsu = stel -> ap "Pirate to Stellar update for Brand" "Mule" "Integration"
        pvtr = msp -> ptis "Pirate VPS to (RedBee, M2A, PFT, NLDR)" "Mule" "Integration"
        pvts = msp -> pmmX "Pirate VPS to S3" "Mule" "Integration"
        pwft = pira -> stel "Pirate Weekly Forecast to Stellar" "Automate" "Integration"
        pvtc = prrs -> prms "Portal view to capture Royalty Producer shares" "Alternative" "Integration"
        pdfp = sounXX -> pira "Post-TX data from Pirate to Soundmouse" "Automate, SFTP" "Integration"
        pcfX = ppsp -> lsp "PPSP Contribution Feed" "Alternative" "Integration"
        pmfd = ppsp -> msp "PPSP Media File Delivery" "Alternative" "Integration"
        pdfpX = sounXX -> pira "Pre-TX data from Pirate to Soundmouse" "Automate, SFTP" "Integration"
        plcd = stel -> cedw "Processes linear campaign data, including agreements, breaks and spots" "Alternative" "Integration"
        prte = come -> ebs "Producer Reporting to EBS" "Automate" "Integration"
        proebs = ebs -> come "Producer Reporting to Oracle eBusiness Suite " "Alternative" "Integration"
        pptp = ppp -> pcc "Producers Portal to Pirate for Ed Spec Diversity info" "Mule" "Integration"
        pasm = sounXX -> pira "Programme and social media clip music cuesheets from Soundmouse to Pirate" "Automate, SFTP" "Integration"
        ppi = ebs -> pira "programme Payments Interface" "Alternative" "Integration"
        pctmX = modX -> pcX "Promo Create To Movida" "Mule" "Integration"
        pctp = pira -> pcX "Promo Create To Pirate" "Mule" "Integration"
        potp = pira -> po "Promo Optimiser to Pirate" "Mule" "Integration"
        rtat = lsp -> c4sl "Real Time As-Run to ALL 4" "Alternative" "Integration"
        rdfp = pira -> pris "Recoupment/Advances data from Programme Finance Committee form" "Alternative" "Integration"
        rad = pcc -> pap "Repeat agreement data" "Alternative" "Integration"
        rtc7 = prms -> c7t "Rights to C4 7A Titles" "Alternative" "Integration"
        rswe = pc -> prrs "Royalty Statement (welcome Email)" "Alternative" "Integration"
        scfmd = ebs -> sc "Sales CRM to Finance ERP - Customer Master Data" "Mule" "Integration"
        scfic = ebs -> sc "Sales CRM to Finance ERP - Invoice Creation" "Mule" "Integration"
        se = come -> pap "Sales Entry" "Alternative" "Integration"
        str = lsp -> pira "SSAPI to RTAR" "Mule" "Integration"
        sdfp = prrs -> bsw "Statement data (for pre-approved PO's)" "Alternative" "Integration"
        scdt = ap -> stel "Stellar commercial data to Agencies" "Mule" "Integration"
        stap = ap -> stel "Stellar to Agency Portal &  K2 for programme data" "Mule" "Integration"
        stapX = ap -> stel "Stellar to Agency Portal for CB and PIB" "Alternative" "Integration"
        strebs = ebs -> stel "Stellar to EBS for Sales Orders & New Customers" "Alternative" "Integration"
        ste- = stel -> cedw "STELLAR to EDW - Campaign Position and Deal Position at Group Level" "Alternative" "Integration"
        ste-X = stel -> cedw "STELLAR to EDW - Data to be used in PIB & CB reporting" "Alternative" "Integration"
        ste-XX = stel -> cedw "STELLAR to EDW - Processes Base Price Group data" "Alternative" "Integration"
        ste-XXX = stel -> cedw "STELLAR to EDW - ROI Sponsorship Revenue values per transmission" "Alternative" "Integration"
        ste-XXXX = stel -> cedw "STELLAR to EDW - Sponsorship campaign data" "Alternative" "Integration"
        stef = stel -> cedw "Stellar to EDW for ROI calculation on Channel sets" "Alternative" "Integration"
        stff = fsh -> stel "Stellar to Freewheel for Agencies, Brand, Deals and Campaigns" "Mule" "Integration"
        stna = barb -> stel "Stellar to NIELSEN and BARB for post transmission Spot Log" "SFTP" "Integration"
        stof2 = stel -> ebs "Stellar to Oracle Financials about Agency financial exposure" "Alternative" "Integration"
        stof1 = stel -> ebs "Stellar to Oracle Financials on Credit Policy" "Alternative" "Integration"
        stof = stel -> ebs "Stellar to Oracle Financials on invoicing" "Alternative" "Integration"
        stpm = msp -> stel "Stellar to Peach Media for Spot Plus files" "Mule" "Integration"
        stpf = pppsXXX -> stel "Stellar to Pirate for Commercial break pattern information" "Alternative" "Integration"
        stpfX = stel -> pppsXXX "Stellar to Pirate for Commercial Copy Registrations" "SFTP" "Integration"
        stpfXX = pittX -> stel "Stellar to Pirate for commercial playlist" "SFTP" "Integration"
        stpfXXX = stel -> pppsXXX "Stellar to Pirate for Product placement indicator" "Alternative" "Integration"
        stpfXXXX = stel -> pppsXXX "Stellar to Pirate for Promotional Campaigns" "Alternative" "Integration"
        stpfXXXXX = stel -> pppsXXX "Stellar to Pirate for Promotions Copy Registrations" "Alternative" "Integration"
        stpfXXXXXX = stel -> pppsXXX "Stellar to Pirate for Sponsorship Campaign" "Alternative" "Integration"
        stpfXXXXXXX = stel -> pppsXXX "Stellar to Pirate for Sponsorship Clocknumbers or Copy" "Alternative" "Integration"
        stpfXXXXXXXX = stel -> pppsXXX "Stellar to Pirate for Sponsorship Events" "Alternative" "Integration"
        stpfXXXXXXXXX = stel -> pppsXXX "Stellar to Pirate for Sponsorship Events for Partners" "SFTP" "Integration"
        stpfXXXXXXXXXX = stel -> pppsXXX "Stellar to Pirate for Trail patterns" "Alternative" "Integration"
        stuf = msp -> stel "Stellar to UKTV for Ad Certification" "SFTP" "Integration"
        stufX = msp -> stel "Stellar to UKTV for Commercial Copy Registrations" "SFTP" "Integration"
        scte = c4sl -> cedw "Streaming Consent to EDW" "Alternative" "Integration"
        sbde = ebs -> pap "Supplier Bank Details Exist" "Automate" "Integration"
        sffp = prrs -> cedw "Supplier fields from PIRATE to EDW(Redshift) EDW(Oracle)" "Alternative" "Integration"
        supinf = ebs -> pris "Supplier Information" "Alternative" "Integration"
        suprec = ebs -> pap "Supplier Records" "Alternative" "Integration"
        ttbs = ted -> cedw "Ted tables batch synchronisation to Coeus Redshift" "Alternative" "Integration"
        ttn = sounXX -> pira "Ted to Neo" "Automate, SFTP" "Integration"
        tts = sounXX -> pira "Ted to Silvermouse" "Automate, SFTP" "Integration"
        ttc- = thin -> c4sl "ThinkAnalytics to C4S - Recommendation" "Alternative" "Integration"
        tsfp = barb -> passX "TX Schedule from PIRATE to BARB" "Alternative" "Integration"
        vptc = osp -> c4sl "Video Pipeline to C4S" "Alternative" "Integration"
        vtcs = msp -> ppc "VisionCloud to Compliance Service" "Mule" "Integration"
        vvd = cedw -> prrs "VOD Views Data" "Alternative" "Integration"
        waad = wa -> cedw "Web Analytics (AA) data to EDW" "Alternative" "Integration"
        wdsbi = wda -> ebs "Workday Adaptive to SplashBI (Oracle eBS Schema)" "Mule" "Integration"
        wdsbi2 = wda -> sbi "Workday Adaptive to SplashBI (Oracle eBS Schema)" "Mule" "Integration"
        
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
        
        systemLandscape "SystemLandscape" {
            include *
            autoLayout
        }
        
        systemContext cp "cpContext" {
            include *
            autoLayout
        }
        
        container cp "cpContainers" {
            include *
            autoLayout
        }
        
        systemContext bms "bmsContext" {
            include *
            autoLayout
        }
        
        container bms "bmsContainers" {
            include *
            autoLayout
        }
        
        systemContext csp "cspContext" {
            include *
            autoLayout
        }
        
        container csp "cspContainers" {
            include *
            autoLayout
        }
        
        systemContext dap "dapContext" {
            include *
            autoLayout
        }
        
        container dap "dapContainers" {
            include *
            autoLayout
        }
        
        systemContext fsp "fspContext" {
            include *
            autoLayout
        }
        
        container fsp "fspContainers" {
            include *
            autoLayout
        }
        
        systemContext lpp "lppContext" {
            include *
            autoLayout
        }
        
        container lpp "lppContainers" {
            include *
            autoLayout
        }
        
        systemContext mp "mpContext" {
            include *
            autoLayout
        }
        
        container mp "mpContainers" {
            include *
            autoLayout
        }
        
        systemContext mmp "mmpContext" {
            include *
            autoLayout
        }
        
        container mmp "mmpContainers" {
            include *
            autoLayout
        }
        
        systemContext psp "pspContext" {
            include *
            autoLayout
        }
        
        container psp "pspContainers" {
            include *
            autoLayout
        }
        
        systemContext rmp "rmpContext" {
            include *
            autoLayout
        }
        
        container rmp "rmpContainers" {
            include *
            autoLayout
        }
        
        systemContext rsp "rspContext" {
            include *
            autoLayout
        }
        
        container rsp "rspContainers" {
            include *
            autoLayout
        }
        
        systemContext spX "spXContext" {
            include *
            autoLayout
        }
        
        container spX "spXContainers" {
            include *
            autoLayout
        }
        
        systemContext sbs "sbsContext" {
            include *
            autoLayout
        }
        
        container sbs "sbsContainers" {
            include *
            autoLayout
        }
        
        systemContext vsp "vspContext" {
            include *
            autoLayout
        }
        
        container vsp "vspContainers" {
            include *
            autoLayout
        }
        
        systemContext wsp "wspContext" {
            include *
            autoLayout
        }
        
        container wsp "wspContainers" {
            include *
            autoLayout
        }
    }
}