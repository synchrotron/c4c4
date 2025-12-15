workspace "Channel 4 Core" "Enterprise Systems - Generated from LeanIX" {

    !identifiers hierarchical

    model {
    
        archetypes {
            application = container
        }
        
        /* ============================================================
           ORGANISATIONS / TEAMS (from LeanIX UserGroups)
           ============================================================ */
        
        cse = person "Client Sales & Engagement" ""
        part = person "Partnerships" ""
        so = person "Sales Operations" "Sales Operations handle the content supply chain for commercial content and plan placements withi..." {
            tags "businessUnit,Impact"
            perspectives {
                Data Clean Room "Data Clean Room"
            }
        }
        agen = person "Agency" "" {
            tags "customer"
        }
        bt = person "Broadcast Technology" ""
        av = person "AV" "" {
            tags "businessUnit"
        }
        at = person "Ad Tech" ""
        camp = person "Campaign" ""
        traf = person "Traffic" ""
        trad = person "Trading" ""
        paas = person "Presentation and Access Services" ""
        cf = person "Content Finance" ""
        comm = person "Communications" ""
        aiX = person "Audience Integration" ""
        clac = person "Corporate Legal and Compliance" "Sub-team of Commercial Affairs that handle legal and compliance for all our content. Assigning ce..."
        cd = person "Content Delivery" ""
        4stu = person "4Studio" "" {
            tags "businessUnit"
        }
        prod = person "Product" "" {
            tags "businessUnit"
        }
        pp = person "Partner Platform" "User group to describe partner platforms such as DUK, Youview or Sky"
        pi = person "Programme Information" "Programme Information provide distinctive, top quality, informative copy with the relevant tone o..."
        co = person "Commissioning Office" ""
        prodX = person "Producer" ""
        ca = person "Commercial Affairs" "The commercial affairs teams handle entitlements and agreements, including rights) with out conte..." {
            tags "businessUnit"
        }
        cspX = person "Content Strategy & Planning" "The Content Strategy team plans exhibition windows for our content on linear and non-linear using..."
        yad = person "Youth and Digital" ""
        cm = person "Content Management" "Technical and business team that handle content media supply chain." {
            tags "businessUnit"
        }
        ccf = person "Finance" "" {
            tags "businessUnit,Impact"
            perspectives {
                Corporate Integration "Corporate Integration"
                Finance & People Transformation "Finance & People Transformation"
                Transactional Reporting Solution "Transactional Reporting Solution"
            }
        }
        sci = person "Strategy & Consumer Insight" "" {
            tags "businessUnit"
        }
        mark = person "Marketing" ""
        inno = person "Innovation" "" {
            tags "businessUnit"
        }
        daf = person "Daytime and Features" ""
        dram = person "Drama" ""
        fact = person "Factual" ""
        fe = person "Factual Entertainment" ""
        ncas = person "News, Current Affairs & Sport" ""
        f4 = person "Film 4" "" {
            tags "businessUnit"
        }
        ba = person "Business Affairs" ""
        come = person "Comedy" ""
        coX = person "Commissioning Operations" ""
        ente = person "Entertainment" ""
        dd = person "Duty Desk" "Team that handles live content operations for our linear channels."
        peop = person "People" "" {
            tags "businessUnit"
        }
        mve = person "MVE" "" {
            tags "businessUnit"
        }
        4cre = person "4Creative" "Creative Team that creates new content for Channel 4." {
            tags "businessUnit"
        }
        commX = person "Commercial" "" {
            tags "businessUnit"
        }
        pf = person "Production Finance" ""
        paa = person "Programmatic and Audience" ""
        ds = person "Data Science" ""
        ar = person "Audience Research" ""
        tech = person "Technology" "" {
            tags "businessUnit"
        }
        digi = person "Digital" ""
        dm = person "Digital Marketing" ""
        insi = person "Insights" "" {
            tags "Impact"
            perspectives {
                Customer Journey Analytics (CJA) "Customer Journey Analytics (CJA)"
            }
        }
        c4 = person "Channel 4" "" {
            tags "legalEntity,Impact"
            perspectives {
                Finance & People Transformation "Finance & People Transformation"
            }
        }
        ccfrss = person "Shared Services" "Team responsible for any financial transactional incoming and outgoing payment processing. Typica..." {
            tags "Impact"
            perspectives {
                Finance & People Transformation "Finance & People Transformation"
            }
        }
        cpX = person "Consumer Product" ""
        dmp = person "Digital Marketing (Product)" ""
        cc = person "Content & Commissioning" "" {
            tags "businessUnit"
        }
        corp = person "Corporate" "" {
            tags "businessUnit"
        }
        er = person "Employee Relations" ""
        ct = person "Corporate Technology" ""
        lad = person "Learning and Development" ""
        proc = person "Procurement" ""
        clg = person "Corporate Legal & Governance" ""
        view = person "Viewer" "" {
            tags "customer"
        }
        a4e = person "All 4 Editorial" ""
        gs = person "Growth (Subscriptions)" "" {
            tags "Impact"
            perspectives {
                Customer Journey Analytics (CJA) "Customer Journey Analytics (CJA)"
            }
        }
        fm = person "Facilities Management" ""

        /* ============================================================
           COMMERCIAL PLATFORM
           ============================================================ */
        
        cp = softwareSystem "Commercial Platform" "Platform from LeanIX" {
            
            ap = container "Agency Portal" "Empowering advertising agencies with their Channel4 campaign data." "paas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/eddf6908-0ee4-4f5d-a0f6-b97b487259d0
            }
            cari = container "Caria" "The platform on which UK & Irish airtime is traded, and upon which copy rotation instructions are..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/49886d90-5ffc-4f1f-bce7-5b513a389335
            }
            cc = container "Copy Central" "Service that provides information about copy restrictions and/or certifications. Also known as Cl..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/a4032df7-cefa-456d-a666-0a3331ef9c50
            }
            fsh = container "Freewheel Streaming Hub" "Freewheel Streaming Hub (aka MRM) is a software application that enables publishers and broadcast..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/6dd95ab1-0351-4792-b1b7-71bd1cadbe4b
                tags "Impact"
                perspectives {
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            inno = container "Innovid" "Innovid is the only independent omni-channel advertising and analytics platform built for televis..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/1b3451df-a733-4e19-aff5-55c7edd0af8f
            }
            moat = container "Moat" "Moat enables measuring consumer attention across channels, devices, and platforms" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/7d73d7ee-1ae1-45e8-91ce-60cbcbf84da0
            }
            sc = container "Sales CRM" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/9bb0f6c7-7a03-4b4a-8fa9-9473fe15754f
            }
            stel = container "Stellar" "Channel4's Sales Order Processing System" "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/36680d73-914e-4f57-a8f3-bffe87a2d6c1
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    Corporate Integration "Corporate Integration"
                    Interstellar "Interstellar"
                }
            }
        }

        /* ============================================================
           CONTENT MANAGEMENT PLATFORM
           ============================================================ */
        
        bms = softwareSystem "Content Management Platform" "The applications and components that support the media management and linear scheduling for our l..." {
            
            asp = container "Access Service Provider" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/22db32c5-d118-4633-955e-9fdd07ab0b90
            }
            acf = container "Acquired Cash Forecast" "For the management of cashflow for acquired content, this is all captured on a spreadsheet called..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/5b00cefe-c009-4684-a0f7-c699be221bd0
            }
            bynd = container "Bynder" "Bynder is an AI-powered, SaaS DAM solution that allows brands to easily create, find and use thei..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3c1fa911-1501-4541-afe7-96465ec458f9
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            c7t = container "C4 7A Titles" "Home grown system to schedule long form content on YouTube with workflow for Rights and Compliance." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/46d06260-aae5-43b8-958b-cc549131676d
            }
            cmt = container "CMT" "Hosted by I2, CMT is a web-based tool with secure log-in credentials . The tool allows Long Term ..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/918078d9-bc77-402c-b3f4-e37ba8bfa26e
            }
            dasdpwpswra = container "DTT Audio & Signing Date prompts with peak stats (with RB amendments)" "Business Objects report Displays the total volume of transmitted content during a time period, an..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/19af6a2d-fd84-436a-9f4e-c02b15b2c52f
            }
            et = container "Everyone TV" "Everyone TV is the new name for Digital UK. [JV with UK PSB's] NOTE: This is NOT an Application E..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/77b7f4a1-79a3-4325-841f-cd9f4385634d
            }
            grac = container "Gracenote" "Gracenote is the world’s leading entertainment data and technology company. We power the top musi..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/fa77d7f3-dd38-4f23-9404-2c1365fe9270
            }
            mod = container "MediaGenix On Demand" "BeBanjo Movida VOD Management system (Comprising of systems which schedule and manage transcode a..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/7bec9ebd-87c8-4ed0-bfe2-1ea5429eeabc
                tags "Impact"
                perspectives {
                    New VoD Management System "New VoD Management System"
                    Flexible Series "Flexible Series"
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            olss = container "OFCOM Licensing Services-Online Services-MIDCOM" "This is the OFCOM platform used by our Access Services team to upload of our reporting to OFCOM." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/01a05cf6-e094-4bf2-bd13-310fc50da22b
            }
            osp = container "OnLine Service Provider" "Provides capabilities for ingest, transformation, transcoding, encryption and delivery of VOD; li..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bbaf9554-9a19-44f9-83fb-f6ce638e4210
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            ol = container "Order list" "Setting a budget and its' allocations genres & channels. Existing commitments also captured. Targ..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/378e341d-08ed-428d-a1ef-0a4bf9853e4e
            }
            pira = container "Pirate" "Pirate is a collection of applications used by various departments. Commercial affairs (business ..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/f694fb3d-6a3b-4776-a5d8-21d9b500714c
                tags "Impact"
                perspectives {
                    Corporate Integration "Corporate Integration"
                }
            }
            p4ws = container "4Producers (Web Site)" "eCommissioning system. Allows C4 to engage with Production companies for Production companies to ..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/8d36fa1b-3ca6-46a5-bb77-a01cbd833667
            }
            pass = container "Advance Scheduling System" "The Advanced Scheduling System (A55) provides a view of a schedule for a specific channel and dat..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/af539ba8-e622-46fc-b561-347dad93d8b6
                tags "Impact"
                perspectives {
                    UK FAST "UK FAST"
                }
            }
            pbm = container "Brand Management" "An application where can create or update Pirate Brands. This enables the business to group toget..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/40779771-f867-4ae3-b52f-eec13651d19e
            }
            pc = container "Companies" "This application allows users to create companies like production companies, studios etc" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/502a22f2-f644-468f-8b86-362e696f2eec
            }
            pcgs = container "Content Generation System" "Generates the required detailed metadata required for each target platform and sends the appropri..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/990c1b35-ab93-4eb1-a143-a540b847bdad
            }
            pcps = container "Content Planning System" "VOD Scheduling" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/65c29e83-77b9-40a6-848f-2368bb4eee47
            }
            pdaprs = container "Director and Producer Reporting System" "DPRS Transmission/Sales Report This report works in various stages: 1. A list of all contract num..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/9c4466ce-2729-4694-9c66-6ad6ed4c7eb8
            }
            pfas = container "Film Advanced Scheduling" "Manages the film scheduling scenarios based on deals purchased" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/562855b8-5326-43ce-95c1-a5f527042337
            }
            pge = container "General Enquiry" "Contains query functionality and several reports that can be run based on a broad range of topics..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c36f9667-6771-471f-ba38-11d4ce9f14ed
            }
            pip = container "Interface Payments" "Maintenance tables for 1. Nominal accounts – specifying what codes are valid 2. Specifying which ..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/a6c7f5e7-2586-470c-a643-c25a0fa6a62f
            }
            pitts = container "Interface To Transmission Systems" "ITS prepares final schedules for Playout systems. It uses Programme schedules generated from PPS ..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ad4ff429-b9c4-4d11-9b78-e5935f33e664
            }
            pmam = container "Management Account Maintenance" "Maintenance of reference data related to Management Accounts (Programme Finance)  Not used much,..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/26c1c9f6-2b27-4dfb-b20b-5d9dc0a4ce30
            }
            pmm = container "Media Management" "Video browse can also be launched from this application" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/a1f20124-70fe-49d2-9741-0af94eb527ea
            }
            pofg = container "OFCOM File Generator" "Review one or more channels for their compliance with statutory commercial minutage regulations. ..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/076dc45e-176b-440b-9f6c-5df522074ea4
            }
            ppps = container "Presentation Planning System" "Manages the detailed channel schedules with all the relevant transmission content required for br..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b2da1e23-df98-4af4-9c2a-904814ab181c
                tags "Impact"
                perspectives {
                    Promo Campaign Management "Promo Campaign Management"
                }
            }
            ppps-p = container "Presentation Planning System - PPS.NET" "This is the .NET version of PPS NOTE: We need to create all VOD processes and link one to this ap..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bac64e3f-59aa-433b-b1ba-7f2253bc10df
                tags "Impact"
                perspectives {
                    Promo Campaign Management "Promo Campaign Management"
                }
            }
            ppp = container "Producers Portal" "An app which allows C4 to engage with Production companies for Production companies to fill in th..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/850505c1-6ba6-459c-b213-14cec449dcc5
            }
            ppc = container "Programme Certification" "Programme Certification gives the users of the system the ability look at the assets when they ar..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c26352c7-aac4-46a5-b615-173fde82cf11
            }
            prta2 = container "Real Time As-Run 2" "Provides real-time playout updates to Pirate systems." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/788ae1fa-fb93-4b5c-b452-7d3d885c75b3
            }
            pswo = container "Stock Write Off" "Channel 4 commission or purchase programmes (stock) to be consumed by the schedule using annual t..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/53f21c7a-4734-4b22-a84a-25379898ef6e
            }
            psfv = container "Subtitle File Viewer" "Provides a view over the content of subtitles and the ability to quickly search for bad-language ..." "hybrid" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/0746ec61-b8b1-4ae8-adb1-82ed344f1dee
            }
            ptis = container "Transcode Initiation Service" "TIS2 is the back-end engine of the VoD system, running background jobs ranging from asset synchro..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3e83668e-b232-42da-bd9b-1da5b24ab393
            }
            pvb = container "Video Browse" "Video Browse is a client-side.NET application that is part of the Pirate domain. It provides user..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c7cff9d8-2ecf-4f17-bf5e-46f10b6cd919
            }
            pve = container "Viewer Enquiry" "Viewing the logged calls made by viewers regarding transmitted programmes. EXE name: VE" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/15770840-75f3-4fe0-a8f6-d8fda937fa9e
            }
            pvmsv = container "VOD Management System (VMS)" "" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ea67c4f9-186d-4864-8a79-8e3ec19596c6
            }
            pvma = container "VoD Material Allocation" "VoD Material Allocation is small module inside Media Management. This module used by Programme Ma..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c34a08a9-94d6-4bbb-b8b8-dcdd6200f41e
            }
            pvt = container "VOD Tracker" "Support tool for monitoring VOD systems and workflows" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c4c4d397-c0ed-48d5-a3f6-aee6541d9bef
            }
            pt = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/65a2ae66-2900-4133-acb6-de1758c0e930
            }
            pcX = container "Promo Create" "Hosted by I2, CMT is a web-based tool with secure log-in credentials . The tool allows Long Term ..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/75456893-128a-417b-8b29-e6ee262edc32
            }
            scf = container "Sky Curated Feeds" "Web application designed to create ordered curated lists for presentation on Sky UVP/VRP platforms" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/e0ba5e4a-1d2b-4122-9aab-abe5d04266d4
            }
            soun = container "Soundmouse" "Representation of Soundmouse as company. Covers all SaaS products offered by Soundmouse: Soundmou..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/9734e44e-2b83-4f85-ae47-b3f8450c2951
            }
            spape = container "Soundmouse Pre-TX and Post-TX Exporter" "Creates both Pre-TX and Post-TX export files to Soundmouse for music reporting and production rep..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/585ae5e1-5e8b-49fd-b034-dbcddd64ca01
            }
            spri = container "Sprinklr" "Sprinklr is a social media management platform that enables enterprise brands to connect with cus..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/f2b3a2a6-5fdb-49e8-bd41-30969abaaf3c
                perspectives {
                    SSO "Authenticated using SSO"
                }
            }
            ssfatwswra = container "Subtitling Sep FLS and Teletext with Subtotals (with Ray Amendments)" "Business Objects Report 'Subtitling Sep FLS and Teletext with Subtotals (with Ray Amendments)' - ..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/08a36cbf-3719-4bc7-84f8-73bed68d9619
            }
            tb = container "The Bible" "The bible is a host of information related to the programme idea, such as the programme descripti..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/4e3a4081-51c7-4ada-a73b-f2dbfc570c99
            }
            typ = container "Three Year Plan" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/897061d5-4e4e-426a-b273-0ee82e9e1980
            }
        }

        /* ============================================================
           CONTENT SOURCING PLATFORM
           ============================================================ */
        
        csp = softwareSystem "Content Sourcing Platform" "Platform from LeanIX" {
            
            crmc = container "Customer Relationship Manager  (Content)" "A system used by the commissioning dept to track and manage programme ideas from pitch to greenlight" "paas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c7839d32-16d4-4a70-9ac4-1a630b764db8
                tags "Impact"
                perspectives {
                    Commissioning CRM "Commissioning CRM"
                }
            }
            dist = container "Distributor" "Supplier of acquired content e.g. a US Studio" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/e63beee9-46e6-4f3d-9735-d87f06394469
            }
            pasc = container "Acquisition Stock Control" "A Read-only/Live reporting tool, allowing users to track stock usage (available, scheduled, used)..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/0434a8ef-35cd-4d8b-b7ed-45cc43046114
            }
            pcf = container "Cashflow Forecasting" "Forecasting tool for managing cash, when are production companies actually going to be paid compa..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/d6470753-cd9a-44ea-98f8-729a47538815
            }
            pcc = container "Commissioning Cycle" "Manages the agreements of commissioned content." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/34252dd7-c25b-4ac3-8a2e-6e0742096e0e
                tags "Impact"
                perspectives {
                    Commissioning CRM "Commissioning CRM"
                }
            }
            pp = container "Programmes" "" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/4adea0a1-d059-4edd-a2c3-90c1d67a10ed
            }
            ppX = container "Purchases" "" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/4535195e-870f-435c-96a4-fa0851828338
                tags "Impact"
                perspectives {
                    Commissioning CRM "Commissioning CRM"
                }
            }
            pc = container "Production Company" "Supplier of commissioned content e.g. All 3 Media NOTE: NOT an application" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/45991022-b69a-4a32-b291-1c2818de03a0
            }
        }

        /* ============================================================
           DATA AND ANALYTICS PLATFORM
           ============================================================ */
        
        dap = softwareSystem "Data and Analytics Platform" "An extensive Massive Parallel Processing (MPP) platform designed for analytics tasks, which inclu..." {
            
            as = container "Audience Segmentation" "Enables publishers and broadcasters to grow and retain audiences and increase monetisation for a ..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/36eea142-a4fc-4ffe-91a4-540ae18fa7a2
                tags "Impact"
                perspectives {
                    Data Clean Room "Data Clean Room"
                }
            }
            barb = container "BARB" "Founded by the major organisations in the UK television and advertising industry, BARB is respons..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b5c70e83-8d2a-495a-b772-c87690818d0e
            }
            bor = container "Business Objects Reporting" "This application represents all Business Object reports generated by BI team and are read by busi..." "hybrid" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/2d7b6726-96b6-4e97-819f-a865e8128e02
            }
            edw = container "Enterprise Data Warehouse" "Data Warehouse application used as a host of analytics data in a star schema or a columnar databa..." "hybrid" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/22cf94d3-ac4a-40b9-b29a-09fb2307799e
                tags "Impact"
                perspectives {
                    Data Clean Room "Data Clean Room"
                    Customer Journey Analytics (CJA) "Customer Journey Analytics (CJA)"
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            c4 = container "Core 4" "https://www.core4.channel4.com/hub Core4 is Channel 4's quantitative insight community, made up o..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/6cdb9763-d3c4-4fbd-8391-8fa6edb3c69b
            }
            dcri = container "Data Clean Room (InfoSum)" "A data platform with a vision to connect the world’s data without ever sharing it – by developing..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ee4c816e-16c8-489a-8844-baa0658a73b5
                tags "Impact"
                perspectives {
                    Data Clean Room "Data Clean Room"
                }
            }
            dcrs = container "Data Clean Room (Snowflake)" "A data platform with a vision to connect the world’s data without ever sharing it – by developing..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/682f5257-1497-4ac7-ad12-34150a67f521
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    Data Clean Room "Data Clean Room"
                }
            }
            df = container "Data Fabric" "Data Fabric is an innovative approach designed to simplify and streamline data management across ..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/fd1625b8-a9b8-4df4-a364-d4c0792ca019
                perspectives {
                    SSO "Authenticated using SSO"
                }
            }
            tabl = container "Tableau" "Tableau is a data visualization tool used in the Business Intelligence Industry. It helps in simp..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bcb4c0dc-cb38-4f70-9451-53443456ed8c
                perspectives {
                    SSO "Authenticated using SSO"
                }
            }
            wa = container "Web Analytics" "Web Analytics software used by M&VE for All 4 & Online Services Adobe Analytics is the solution f..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/f7a463e8-edb4-45d6-ad21-e2922b6305a7
                tags "Impact"
                perspectives {
                    Customer Journey Analytics (CJA) "Customer Journey Analytics (CJA)"
                }
            }
        }

        /* ============================================================
           FINANCE SYSTEMS PLATFORM
           ============================================================ */
        
        fsp = softwareSystem "Finance Systems Platform" "Platform from LeanIX" {
            
            atax = container "Alphatax" "Corporation tax compliance software, providing complete control over the preparation and manageme..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/2193988a-9e4b-473c-8ccc-af480c3b0b6f
            }
            bbp = container "Barclays Banking Portal" "Barclays Online platform used to transact FX deals. File Gateway is a host to host connectivity p..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/985ef4c4-7c99-4eb1-a932-c373354efa1c
            }
            bdn = container "Barclays.Net" "Barclays service used to download statements." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c0756e2e-be6f-4529-8838-1bc4303dcb8e
                tags "Impact"
                perspectives {
                    Corporate Integration "Corporate Integration"
                }
            }
            bsw = container "Basware" "Enterprise software for financial processes, purchase to pay and financial management. Manage Inv..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/61ea2036-2682-4999-8a2b-b56a8ff60aa8
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    Corporate Integration "Corporate Integration"
                    Finance & People Transformation "Finance & People Transformation"
                }
            }
            cmx = container "Cachematrix" "SaaS solution for cash management" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/fc6097df-f78d-4d74-b8af-6e668de1f3bb
            }
            ebs = container "E-Business Suite" "Channel4 Oracle E-business Suite application used in Finance department for Accounts, Cash and As..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/34852185-2e79-424a-8735-f586ca0bc6eb
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    Benefex Replacement "Benefex Replacement"
                    Corporate Integration "Corporate Integration"
                    Finance & People Transformation "Finance & People Transformation"
                }
            }
            faf = container "Finance Approval Form" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/331e92eb-60c0-424c-9c5c-8ed4a63e27b9
                tags "Impact"
                perspectives {
                    Finance & People Transformation "Finance & People Transformation"
                }
            }
            msc = container "Mastercard" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/919c5f9f-50b8-4f2a-9b26-9b9a15797da8
                tags "Impact"
                perspectives {
                    Corporate Integration "Corporate Integration"
                }
            }
            odf = container "Oracle eBS Excel data files" "These are a collection of manually generated .xslx files out of Oracle e-Business that contain va..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/f0563f84-f115-450b-be67-db6c545c38b5
            }
            pjc = container "Project Codes" "App used to generate project codes which are used in Oracle and across Channel 4." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/94d329fc-0d88-431b-b78b-1fe85a9cbd14
                tags "Impact"
                perspectives {
                    Finance & People Transformation "Finance & People Transformation"
                }
            }
            sov = container "Sovos" "Sovos helps in digital transformation of tax, with complete, connected offerings for tax determin..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c917188e-f35e-4320-a0b8-d387d6863b62
                tags "Impact"
                perspectives {
                    Finance & People Transformation "Finance & People Transformation"
                }
            }
            sbi = container "SplashBI" "SplashBI is an all-in-one framework for visualising, reporting and analysing data." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/618820c7-1747-4388-a9aa-cfef9e9369c0
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    Finance & People Transformation "Finance & People Transformation"
                    Transactional Reporting Solution "Transactional Reporting Solution"
                }
            }
            tgn = container "Tungsten Network" "Tungsten provide a multiple distribution channel service to a single stream invoice feed." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/199f7f15-06dd-460e-90c5-7d6231f348f3
            }
            wda = container "Workday Adaptive" "Workday Adaptive is Channel 4 Finance's Planning and Consolidation tool" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/4855f235-d3b0-41d0-b983-9265f83b840c
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    Finance & People Transformation "Finance & People Transformation"
                }
            }
        }

        /* ============================================================
           LINEAR PLAYOUT PLATFORM
           ============================================================ */
        
        lpp = softwareSystem "Linear Playout Platform" "Platform from LeanIX" {
            
            ac = container "Amagi Cloudport" "<https://www.amagi.com/products/cloudport-cloud-playout>\ \ Amagi CLOUDPORT supports media ingest..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/fec42b44-df14-4d3d-9b6d-f530a4e41a03
                tags "Impact"
                perspectives {
                    UK FAST "UK FAST"
                }
            }
            lsp = container "Linear Service Provider" "" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/487b00a3-39f7-4095-bdbb-526af136a1a8
            }
            ppps = container "Presentation Planning System" "Manages the detailed channel schedules with all the relevant transmission content required for br..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b2da1e23-df98-4af4-9c2a-904814ab181c
                tags "Impact"
                perspectives {
                    Promo Campaign Management "Promo Campaign Management"
                }
            }
            pt = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/65a2ae66-2900-4133-acb6-de1758c0e930
            }
            sp = container "Stargate Portal" "" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b3e222c1-abbe-4a8c-ac5f-ffd927085edd
            }
        }

        /* ============================================================
           MARKETING PLATFORM
           ============================================================ */
        
        mp = softwareSystem "Marketing Platform" "Platform from LeanIX" {
            
            braz = container "Braze" "Braze is a mobile marketing automation platform that provides a CRM and multichannel messaging su..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/f5eb1ded-7018-467d-a159-c9c29507070c
            }
            mpar = container "mParticle" "mParticle is a Customer Data Platform. It collects customer data once through secure APIs and SDK..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/1dbd5c77-8a0a-4649-bc7e-362d04fbb228
            }
            po = container "Promo Optimizer" "User-friendly TV promo scheduling tool. Leveraging advanced optimization and sequencing algorithm..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ad1499e9-eafa-45b0-be95-6fdafd880967
            }
        }

        /* ============================================================
           MEDIA MANAGEMENT PLATFORM
           ============================================================ */
        
        mmp = softwareSystem "Media Management Platform" "Platform from LeanIX" {
            
            awar = container "Awards" "Awards is a repository of all awards won by Channel 4 or where Channel 4 has been nominated. Plat..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/97c919e2-8156-4df7-a5a8-afde3cd0325d
                perspectives {
                    SSO "Authenticated using SSO"
                }
            }
            msp = container "Media Service Provider" "Service provider for Digital Asset Management System" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b245220d-2a8d-4630-a3f5-e33f1a3c2354
                tags "Impact"
                perspectives {
                    Promo Campaign Management "Promo Campaign Management"
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            pmm = container "Media Management" "Video browse can also be launched from this application" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/a1f20124-70fe-49d2-9741-0af94eb527ea
            }
            pvb = container "Video Browse" "Video Browse is a client-side.NET application that is part of the Pirate domain. It provides user..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c7cff9d8-2ecf-4f17-bf5e-46f10b6cd919
            }
            pt = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/65a2ae66-2900-4133-acb6-de1758c0e930
            }
            ppsp = container "Post Production Service Provider" "Post production service is pre-integrated to MSP and has suites available in HFR. This work can b..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/8b307930-c941-4758-b3a4-f16293becdb8
            }
            rta = container "Ready to Air" "Deliver pre-transmission & pre-release video to journalists securely and reliably, wherever they ..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/0e668044-56f2-465b-b69c-d21a4b575553
            }
            uv = container "Underground Vault" "Team that handles live content operations for our linear channels.Controlled and secure location ..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/4f26c8ed-def1-4f78-a362-292c3828d9fc
            }
        }

        /* ============================================================
           PEOPLE SYSTEMS PLATFORM
           ============================================================ */
        
        psp = softwareSystem "People Systems Platform" "Platform from LeanIX" {
            
            4peo = container "4People" "4People is a cloud HR and people system that empowers mid-size organisations to effectively respo..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3db00200-a028-4cb8-baeb-a3f88d1dd6e9
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    AI People Team "AI People Team"
                    Benefex Replacement "Benefex Replacement"
                }
            }
            acti = container "ActivPay" "Actvipay is Channel 4's 3rd party payroll provider." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/cdaf03e9-7bde-49b0-bfae-ecb69af5dc27
                perspectives {
                    SSO "Authenticated using SSO"
                }
            }
            ac = container "Alert Cascade" "Crisis event mass communication tool" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b6bf1946-3623-41a6-9a3f-36bc6e1fc4a5
            }
            bp = container "Benefits Portal" "" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ec56cea3-8d33-40bc-a695-805e21c0cbf0
                tags "Impact"
                perspectives {
                    SSO "Authenticated using SSO"
                    Benefex Replacement "Benefex Replacement"
                }
            }
            er = container "Executive Reporting" "Bespoke set of reports created in Power BI and served for the purpose of business reporting for t..." "paas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3ec6dffe-bb2b-49d6-8631-8b7b5191e4f3
            }
            fes = container "Freelancer Engagement System" "HR system to request freelancers and bring them onboard. Freelancers submit timesheets via FES. O..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3debbdaf-b375-475b-a9ad-aaffeff1396a
                tags "Impact"
                perspectives {
                    FES Replacement "FES Replacement"
                }
            }
            ll = container "LinkedIn Learning" "LinkedIn Learning offers video courses taught by industry experts in software, creative, and busi..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/9cd4b77f-8517-478b-b25b-6592a04d157b
                perspectives {
                    SSO "Authenticated using SSO"
                }
            }
            popp = container "Poppulo" "Internal communications Internal Communication, newsletter system. Used by internal comms. Integr..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/59812f2b-1d87-466b-816a-8feb530a4de3
                perspectives {
                    SSO "Authenticated using SSO"
                }
            }
            tlh = container "The Learning Hive" "Cornerstone is a cloud-based learning and talent management solutions platform." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ec47ad40-b9d6-4af1-a100-27beef4495e7
                perspectives {
                    SSO "Authenticated using SSO"
                }
            }
        }

        /* ============================================================
           RIGHTS MANAGEMENT PLATFORM
           ============================================================ */
        
        rmp = softwareSystem "Rights Management Platform" "Platform from LeanIX" {
            
            prms = container "Rights Management System" "" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/4fd9c7b1-6378-4092-b583-9361df3e70b1
            }
            pt = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/65a2ae66-2900-4133-acb6-de1758c0e930
            }
            rc = container "Repeats Clearances" "This excel spreadsheet is our record of all programmes repeated on C4 with details of any rights/..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c1ed6654-10a6-4e28-812d-f86fbd721245
            }
            soun = container "Soundmouse" "Representation of Soundmouse as company. Covers all SaaS products offered by Soundmouse: Soundmou..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/9734e44e-2b83-4f85-ae47-b3f8450c2951
            }
        }

        /* ============================================================
           ROYALTIES AND SALES PLATFORM
           ============================================================ */
        
        rsp = softwareSystem "Royalties and Sales Platform" "Platform from LeanIX" {
            
            come = container "COMET" "Channel 4 International and National Rights Licencing Software used by Channel 4 to manage Films ..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/438491d8-6ce7-4d3a-b2c4-5aaf31fef29f
                tags "Impact"
                perspectives {
                    Corporate Integration "Corporate Integration"
                }
            }
            eps = container "Exclusivity Payment Schedules" "Contains payment details due to the artist for an exclusivity deal" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/490fbd9b-4ad9-4cd7-9fad-ae62d3dc1e2b
            }
            neo = container "Neo" "NEO is a Soundmouse application that 4Studio and Rights Team users use. NEO does a shazam of soci..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/1f627283-07fa-4571-b8d8-148a2ee5848c
            }
            pap = container "Artist Payments" "Application for reporting artist royalties" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/fde00f48-6c5b-4dce-852a-1e14887fcc78
                tags "Impact"
                perspectives {
                    Corporate Integration "Corporate Integration"
                }
            }
            pris = container "Royalties Income system" "Manages the Statements and chasing of Statements to ensure Royalties owed to Channel 4 are tracke..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/9b4214f2-0398-428e-814e-83cd8e3a8be3
            }
            prrs = container "Royalties Reporting System" "RRS Overview Description: The Royalty Reporting System (RRS) is an application used for the conso..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/8dfdc0df-f89d-45a3-a740-4d2fdfeda059
            }
            pt = container "Pirate Tracker" "Monitoring Service for Pirate Services/applications" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/65a2ae66-2900-4133-acb6-de1758c0e930
            }
            rc = container "Repeats Clearances" "This excel spreadsheet is our record of all programmes repeated on C4 with details of any rights/..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c1ed6654-10a6-4e28-812d-f86fbd721245
            }
            sd = container "Sargent Disc" "Sargent-Disc is the U.K.’s foremost entertainment-technology provider, building cloud-based workf..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/d6b73ef4-483d-4f35-9333-74b9163872af
            }
            soun = container "Soundmouse" "Representation of Soundmouse as company. Covers all SaaS products offered by Soundmouse: Soundmou..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/9734e44e-2b83-4f85-ae47-b3f8450c2951
            }
            ted = container "Ted" "Ted is a (tactical) web application that is used by 4Studio to capture key information concerning..." "iaas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/a066a5ff-f7e7-4074-ad63-df05eee82b51
            }
            ussw = container "UK Secondary Sales Wishlist" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/0da47795-a87a-4d90-ad0f-48d25f311a1b
            }
            vr = container "VOD Revenue" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/98b4607d-5424-47fb-996f-7d5333e4c962
            }
            vwgmp = container "VOD Writers Guild & Musician Payments" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/59afe4c2-5910-40b3-8a68-19f282a589ff
            }
            wga = container "Writers Guild Advances" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ba9387c7-9929-437d-9e4e-d05cd64325bb
            }
        }

        /* ============================================================
           SCHEDULING PLATFORM
           ============================================================ */
        
        sp = softwareSystem "Scheduling Platform" "The Scheduling Platform is a core functional domain that orchestrates the creation and management..." {
            
            mod = container "MediaGenix On Demand" "BeBanjo Movida VOD Management system (Comprising of systems which schedule and manage transcode a..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/7bec9ebd-87c8-4ed0-bfe2-1ea5429eeabc
                tags "Impact"
                perspectives {
                    New VoD Management System "New VoD Management System"
                    Flexible Series "Flexible Series"
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            pass = container "Advance Scheduling System" "The Advanced Scheduling System (A55) provides a view of a schedule for a specific channel and dat..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/af539ba8-e622-46fc-b561-347dad93d8b6
                tags "Impact"
                perspectives {
                    UK FAST "UK FAST"
                }
            }
            pepl = container "Electronic Press Listing" "Sends Electronic Programme Guide to other platforms Carries Rights information such as restart" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/7f92cb3b-40c6-41f8-9bb0-93bb43df94ff
            }
            pitts = container "Interface To Transmission Systems" "ITS prepares final schedules for Playout systems. It uses Programme schedules generated from PPS ..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ad4ff429-b9c4-4d11-9b78-e5935f33e664
            }
            ppps = container "Presentation Planning System" "Manages the detailed channel schedules with all the relevant transmission content required for br..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b2da1e23-df98-4af4-9c2a-904814ab181c
                tags "Impact"
                perspectives {
                    Promo Campaign Management "Promo Campaign Management"
                }
            }
            ppps-p = container "Presentation Planning System - PPS.NET" "This is the .NET version of PPS NOTE: We need to create all VOD processes and link one to this ap..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bac64e3f-59aa-433b-b1ba-7f2253bc10df
                tags "Impact"
                perspectives {
                    Promo Campaign Management "Promo Campaign Management"
                }
            }
        }

        /* ============================================================
           SMALL BUSINESS SERVICES
           ============================================================ */
        
        sbs = softwareSystem "Small Business Services" "A set of small applications delivering discreet business processes usually hosted on SQL on prem ..." {
            
            anda = container "ANDA" "ANDA is a document archive repository. Where physical documents need to be archived (signed contr..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/dc02b3c2-a279-42c9-a468-76b8818c36fe
            }
            comp = container "Competitions" "It is used by Legal & Compliance to select winners and runner ups for Channel 4 competitions. The..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/61a5b92c-6427-441a-9feb-3937d2f80591
            }
            cms = container "Contract Management System" "Contract Management System, used as a repository for contracts Owned by Procurement storing the m..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/8873272c-e651-4e46-b3f2-efa986155c86
            }
            dsd = container "Diversity Suppliers DB" "This is a database of supplier information used by the Creative Diversity team based in Glasgow," "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/2bfd1da5-1a0e-4069-a76e-6b7d70cab25f
            }
            fa = container "FOIA Application" "Application built on SQL Server for storing Freedom of Information Act requests" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/317ac554-8f28-4103-9c9f-6380e85394cd
            }
            mc = container "Music Clearance" "It is used by colleagues in CACL - Commercial Affairs every time Channel 4 license a music track ..." "hybrid" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/24a58028-9b26-41d8-b3da-c053c69db1bb
            }
            pps = container "Post Production Schedule" "This application is used by 4Creative to plan the development of on-air promotional material and ..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/593b2e40-b629-4ce1-a00f-5f1c1941aae7
            }
            pr = container "Producer Reporting" "It is used by Finance to format the producer reporting statements. The application takes all the ..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/723ecda3-6a5d-4f7b-a7dc-78044b006db9
            }
            sac = container "Stills and Clips" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/8a5691b5-5905-443e-bc20-43613fa2ce71
            }
            time = container "Timesheets" "" "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/8ae5a3ef-7865-430d-b8b6-6d2a30b30e12
            }
        }

        /* ============================================================
           VIDEO STREAMING PLATFORM
           ============================================================ */
        
        vsp = softwareSystem "Video Streaming Platform" "Includes all items that provide the value chain" {
            
            c4sl = container "Channel 4 Streaming (Legacy)" "Video on Demand platform across many devices including https://channel4.com" "iaas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/aa9fdfc2-1884-4181-b102-1579838e10ac
                tags "Impact"
                perspectives {
                    Flexible Series "Flexible Series"
                    Streaming Transformation Program "Streaming Transformation Program"
                    UK FAST "UK FAST"
                }
            }
            cdna = container "Content Distribution Network (Accenture)" "Logical representation of the CDN's used by Channel 4 Streaming, controlled and maintained by Acc..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/40f4d195-24e9-4e3a-83c9-704bb3cc44ab
                tags "Impact"
                perspectives {
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            free = container "Freely" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/35279c23-7ea7-45cb-b766-493f9e89b6e8
                tags "Impact"
                perspectives {
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            mpar = container "mParticle" "mParticle is a Customer Data Platform. It collects customer data once through secure APIs and SDK..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/1dbd5c77-8a0a-4649-bc7e-362d04fbb228
            }
            ova = container "Online Video Analytics" "Real-Time Streaming Video Intelligence" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/14297f38-dac8-4b46-a87b-a4fc7e3d1279
            }
            pipe = container "PIPE" "The CMS that drivers Channel 4 Streaming UX in the apps" "iaas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/12ff7faf-0750-475f-bf77-a37901ecc5e1
            }
            sm = container "Subscription Management" "The application that manages our subscription products such as offers and deals." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/a73cf223-4a69-4bfa-91c2-fbfd4daa57cc
                tags "Impact"
                perspectives {
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            sl = container "Sumo Logic" "Sumo Logic is a cloud-based log management and analytics service that leverages machine-generated..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/6bdd41b7-f5a3-4fdb-9022-4914c9505bff
            }
            tr = container "Tag Recommender" "A Data Science led application to aid the Channel 4 Streaming editors with tagging for Brands" "iaas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/cd963fb4-7d3b-4fdf-8d87-92d4fc23551c
            }
            thin = container "ThinkAnalytics" "World leaders in AI personalized content discovery, hyper-targeted advertising and customer insight." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/f323399a-7830-4ce9-88d0-e3d111f71102
                tags "Impact"
                perspectives {
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
            yosp = container "YoSpace" "Dynamic Ad Insertion (replacement of linear ads) on live streams to our owned and operated stream..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/46c41f3f-30df-44f4-851b-33b583f9cf40
                tags "Impact"
                perspectives {
                    Streaming Transformation Program "Streaming Transformation Program"
                }
            }
        }

        /* ============================================================
           WORKSPACE SYSTEMS PLATFORM
           ============================================================ */
        
        wsp = softwareSystem "Workspace Systems Platform" "Platform from LeanIX" {
            
            ac = container "Alert Cascade" "Crisis event mass communication tool" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b6bf1946-3623-41a6-9a3f-36bc6e1fc4a5
            }
            ce = container "Concept Evolution" "FM Job sheets for building maintenance used by Facilities & Workspace" "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/cb1d3418-dabb-4165-9ef2-f1be0f380139
            }
            egen = container "Egencia" "Egencia is a SaaS platform developed by Amex GBT that offers corporate travel management solution..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bc12be35-05c9-4add-9535-ded814046530
                perspectives {
                    SSO "Authenticated using SSO"
                }
            }
            tb = container "Taxi Booking" "This application describes are taxi booking capability at Channel 4." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3b5ca269-2905-4273-8bff-36aa694152cb
            }
            tb-n = container "Taxi Booking - non-London" "This application is used for London based Taxi bookings to and from Horseferry Road" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/59f0b9cc-6b23-4630-a46f-557de8be2079
            }
        }
        
        /* ============================================================
           PERSON -> APPLICATION RELATIONSHIPS
           ============================================================ */
        
        cseToAp = cse -> cp.ap "Uses"
        partToAp = part -> cp.ap "Uses"
        soToAp = so -> cp.ap "Uses"
        agenToAp = agen -> cp.ap "Uses"
        btToCari = bt -> cp.cari "Uses"
        agenToCari = agen -> cp.cari "Uses"
        soToCc = so -> cp.cc "Uses"
        soToFsh = so -> cp.fsh "Uses"
        soToInno = so -> cp.inno "Uses"
        avToSc = av -> cp.sc "AV = Audio Visual"
        soToSc = so -> cp.sc "Uses"
        atToSc = at -> cp.sc "Uses"
        cseToStel = cse -> cp.stel "Uses"
        partToStel = part -> cp.stel "Uses"
        soToStel = so -> cp.stel "Uses"
        campToStel = camp -> cp.stel "Uses"
        trafToStel = traf -> cp.stel "Uses"
        tradToStel = trad -> cp.stel "Uses"
        paasToAsp = paas -> bms.asp "Uses"
        cfToAcf = cf -> bms.acf "Uses"
        commToBynd = comm -> bms.bynd "Uses"
        aiXToBynd = aiX -> bms.bynd "Uses"
        partToC7t = part -> bms.c7t "Uses"
        clacToC7t = clac -> bms.c7t "Uses"
        cdToC7t = cd -> bms.c7t "Uses"
        4stuToC7t = 4stu -> bms.c7t "Uses"
        prodToC7t = prod -> bms.c7t "Uses"
        paasToDasdpwpswra = paas -> bms.dasdpwpswra "Uses"
        ppToEt = pp -> bms.et "Uses"
        ppToGrac = pp -> bms.grac "Uses"
        piToMod = pi -> bms.mod "Uses"
        paasToOlss = paas -> bms.olss "Uses"
        piToOsp = pi -> bms.osp "Uses"
        btToOsp = bt -> bms.osp "Uses"
        cfToOl = cf -> bms.ol "Uses"
        coToP4ws = co -> bms.p4ws "Uses"
        prodXToP4ws = prodX -> bms.p4ws "Uses"
        soToPass = so -> bms.pass "Uses"
        tradToPass = trad -> bms.pass "Uses"
        caToPass = ca -> bms.pass "Uses"
        cspXToPass = cspX -> bms.pass "Uses"
        yadToPass = yad -> bms.pass "Uses"
        cmToPass = cm -> bms.pass "Uses"
        ccfToPass = ccf -> bms.pass "Uses"
        sciToPass = sci -> bms.pass "Uses"
        markToPass = mark -> bms.pass "Uses"
        prodToPass = prod -> bms.pass "Uses"
        caToPbm = ca -> bms.pbm "Uses"
        ccfToPbm = ccf -> bms.pbm "Uses"
        cfToPbm = cf -> bms.pbm "Uses"
        innoToPc = inno -> bms.pc "Uses"
        caToPc = ca -> bms.pc "Uses"
        cspXToPc = cspX -> bms.pc "Uses"
        dafToPc = daf -> bms.pc "Uses"
        dramToPc = dram -> bms.pc "Uses"
        factToPc = fact -> bms.pc "Uses"
        feToPc = fe -> bms.pc "Uses"
        ncasToPc = ncas -> bms.pc "Uses"
        yadToPc = yad -> bms.pc "Uses"
        cmToPc = cm -> bms.pc "Uses"
        ccfToPc = ccf -> bms.pc "Uses"
        cfToPc = cf -> bms.pc "Uses"
        sciToPc = sci -> bms.pc "Uses"
        f4ToPc = f4 -> bms.pc "Uses"
        4stuToPc = 4stu -> bms.pc "Uses"
        markToPc = mark -> bms.pc "Uses"
        prodToPc = prod -> bms.pc "Uses"
        innoToPcgs = inno -> bms.pcgs "Uses"
        soToPcgs = so -> bms.pcgs "Uses"
        caToPcgs = ca -> bms.pcgs "Uses"
        dramToPcgs = dram -> bms.pcgs "Uses"
        ncasToPcgs = ncas -> bms.pcgs "Uses"
        cmToPcgs = cm -> bms.pcgs "Uses"
        piToPcgs = pi -> bms.pcgs "Uses"
        sciToPcgs = sci -> bms.pcgs "Uses"
        4stuToPcgs = 4stu -> bms.pcgs "Uses"
        commToPcgs = comm -> bms.pcgs "Uses"
        markToPcgs = mark -> bms.pcgs "Uses"
        prodToPcgs = prod -> bms.pcgs "Uses"
        innoToPcps = inno -> bms.pcps "Uses"
        soToPcps = so -> bms.pcps "Uses"
        caToPcps = ca -> bms.pcps "Uses"
        cspXToPcps = cspX -> bms.pcps "Uses"
        dramToPcps = dram -> bms.pcps "Uses"
        cmToPcps = cm -> bms.pcps "Uses"
        piToPcps = pi -> bms.pcps "Uses"
        prodToPcps = prod -> bms.pcps "Uses"
        baToPdaprs = ba -> bms.pdaprs "Uses"
        soToPfas = so -> bms.pfas "Uses"
        caToPfas = ca -> bms.pfas "Uses"
        cspXToPfas = cspX -> bms.pfas "Uses"
        ccfToPfas = ccf -> bms.pfas "Uses"
        sciToPfas = sci -> bms.pfas "Uses"
        innoToPge = inno -> bms.pge "Uses"
        soToPge = so -> bms.pge "Uses"
        tradToPge = trad -> bms.pge "Uses"
        caToPge = ca -> bms.pge "Uses"
        comeToPge = come -> bms.pge "Uses"
        coToPge = co -> bms.pge "Uses"
        coXToPge = coX -> bms.pge "Uses"
        cspXToPge = cspX -> bms.pge "Uses"
        dafToPge = daf -> bms.pge "Uses"
        dramToPge = dram -> bms.pge "Uses"
        enteToPge = ente -> bms.pge "Uses"
        factToPge = fact -> bms.pge "Uses"
        feToPge = fe -> bms.pge "Uses"
        ncasToPge = ncas -> bms.pge "Uses"
        yadToPge = yad -> bms.pge "Uses"
        cmToPge = cm -> bms.pge "Uses"
        cdToPge = cd -> bms.pge "Uses"
        ddToPge = dd -> bms.pge "Uses"
        paasToPge = paas -> bms.pge "Uses"
        piToPge = pi -> bms.pge "Not all information is available and needs to be obtained from other sources. Clunky"
        ccfToPge = ccf -> bms.pge "Uses"
        peopToPge = peop -> bms.pge "Uses"
        sciToPge = sci -> bms.pge "Uses"
        f4ToPge = f4 -> bms.pge "Uses"
        mveToPge = mve -> bms.pge "Uses"
        4creToPge = 4cre -> bms.pge "Uses"
        4stuToPge = 4stu -> bms.pge "Uses"
        commToPge = comm -> bms.pge "Uses"
        markToPge = mark -> bms.pge "Uses"
        prodToPge = prod -> bms.pge "Uses"
        yadToPip = yad -> bms.pip "Uses"
        cmToPip = cm -> bms.pip "Uses"
        ccfToPip = ccf -> bms.pip "Uses"
        cfToPip = cf -> bms.pip "Uses"
        markToPip = mark -> bms.pip "Uses"
        prodToPip = prod -> bms.pip "Uses"
        piToPitts = pi -> bms.pitts "Uses"
        soToPmam = so -> bms.pmam "Uses"
        cmToPmam = cm -> bms.pmam "Uses"
        ccfToPmam = ccf -> bms.pmam "Uses"
        cfToPmam = cf -> bms.pmam "Uses"
        soToPmm = so -> bms.pmm "Uses"
        caToPmm = ca -> bms.pmm "Uses"
        cspXToPmm = cspX -> bms.pmm "Uses"
        factToPmm = fact -> bms.pmm "Uses"
        ncasToPmm = ncas -> bms.pmm "Uses"
        yadToPmm = yad -> bms.pmm "Uses"
        cmToPmm = cm -> bms.pmm "Uses"
        cdToPmm = cd -> bms.pmm "Uses"
        4creToPmm = 4cre -> bms.pmm "Uses"
        markToPmm = mark -> bms.pmm "Uses"
        soToPofg = so -> bms.pofg "Uses"
        cmToPofg = cm -> bms.pofg "Uses"
        ccfToPofg = ccf -> bms.pofg "Uses"
        cfToPofg = cf -> bms.pofg "Uses"
        soToPpps = so -> bms.ppps "Uses"
        caToPpps = ca -> bms.ppps "Uses"
        cspXToPpps = cspX -> bms.ppps "Uses"
        feToPpps = fe -> bms.ppps "Uses"
        cmToPpps = cm -> bms.ppps "Uses"
        paasToPpps = paas -> bms.ppps "Uses"
        sciToPpps = sci -> bms.ppps "Uses"
        4creToPpps = 4cre -> bms.ppps "Uses"
        4stuToPpps = 4stu -> bms.ppps "Uses"
        markToPpps = mark -> bms.ppps "Uses"
        prodToPpps = prod -> bms.ppps "Uses"
        innoToPpps-p = inno -> bms.ppps-p "Uses"
        soToPpps-p = so -> bms.ppps-p "Uses"
        caToPpps-p = ca -> bms.ppps-p "Uses"
        cspXToPpps-p = cspX -> bms.ppps-p "Uses"
        factToPpps-p = fact -> bms.ppps-p "Uses"
        feToPpps-p = fe -> bms.ppps-p "Uses"
        cmToPpps-p = cm -> bms.ppps-p "Uses"
        ccfToPpps-p = ccf -> bms.ppps-p "Uses"
        4creToPpps-p = 4cre -> bms.ppps-p "Uses"
        markToPpps-p = mark -> bms.ppps-p "Uses"
        caToPpp = ca -> bms.ppp "Uses"
        comeToPpp = come -> bms.ppp "Uses"
        cspXToPpp = cspX -> bms.ppp "Uses"
        dafToPpp = daf -> bms.ppp "Uses"
        dramToPpp = dram -> bms.ppp "Uses"
        enteToPpp = ente -> bms.ppp "Uses"
        factToPpp = fact -> bms.ppp "Uses"
        feToPpp = fe -> bms.ppp "Uses"
        ncasToPpp = ncas -> bms.ppp "Uses"
        yadToPpp = yad -> bms.ppp "Uses"
        cmToPpp = cm -> bms.ppp "Uses"
        ccfToPpp = ccf -> bms.ppp "Uses"
        sciToPpp = sci -> bms.ppp "Uses"
        f4ToPpp = f4 -> bms.ppp "Uses"
        4creToPpp = 4cre -> bms.ppp "Uses"
        markToPpp = mark -> bms.ppp "Uses"
        prodXToPpp = prodX -> bms.ppp "Uses"
        soToPpc = so -> bms.ppc "Uses"
        caToPpc = ca -> bms.ppc "Uses"
        clacToPpc = clac -> bms.ppc "Uses"
        cspXToPpc = cspX -> bms.ppc "Uses"
        dafToPpc = daf -> bms.ppc "Uses"
        dramToPpc = dram -> bms.ppc "Uses"
        factToPpc = fact -> bms.ppc "Uses"
        feToPpc = fe -> bms.ppc "Uses"
        ncasToPpc = ncas -> bms.ppc "Uses"
        yadToPpc = yad -> bms.ppc "Uses"
        cmToPpc = cm -> bms.ppc "Uses"
        sciToPpc = sci -> bms.ppc "Uses"
        4creToPpc = 4cre -> bms.ppc "Uses"
        markToPpc = mark -> bms.ppc "Uses"
        piToPrta2 = pi -> bms.prta2 "Uses"
        ccfToPswo = ccf -> bms.pswo "Uses"
        cfToPswo = cf -> bms.pswo "Uses"
        cmToPsfv = cm -> bms.psfv "Uses"
        piToPsfv = pi -> bms.psfv "Uses"
        4stuToPsfv = 4stu -> bms.psfv "Uses"
        piToPtis = pi -> bms.ptis "Uses"
        commXToPvb = commX -> bms.pvb "Uses"
        clacToPvb = clac -> bms.pvb "Uses"
        cmToPvb = cm -> bms.pvb "Uses"
        ddToPvb = dd -> bms.pvb "Uses"
        piToPvb = pi -> bms.pvb "Uses"
        innoToPve = inno -> bms.pve "Uses"
        soToPve = so -> bms.pve "Uses"
        caToPve = ca -> bms.pve "Uses"
        cspXToPve = cspX -> bms.pve "Uses"
        feToPve = fe -> bms.pve "Uses"
        cmToPve = cm -> bms.pve "Uses"
        piToPve = pi -> bms.pve "Uses"
        sciToPve = sci -> bms.pve "Uses"
        markToPve = mark -> bms.pve "Uses"
        prodToPve = prod -> bms.pve "Uses"
        innoToPvmsv = inno -> bms.pvmsv "Uses"
        caToPvmsv = ca -> bms.pvmsv "Uses"
        cspXToPvmsv = cspX -> bms.pvmsv "Uses"
        cmToPvmsv = cm -> bms.pvmsv "Uses"
        piToPvma = pi -> bms.pvma "Uses"
        cfToSoun = cf -> bms.soun "Uses"
        paasToSsfatwswra = paas -> bms.ssfatwswra "Uses"
        piToTb = pi -> bms.tb "Uses"
        prodXToDist = prodX -> csp.dist "Uses"
        caToPasc = ca -> csp.pasc "Uses"
        pfToPasc = pf -> csp.pasc "Uses"
        cspXToPasc = cspX -> csp.pasc "Uses"
        ccfToPasc = ccf -> csp.pasc "Uses"
        soToPcf = so -> csp.pcf "Uses"
        caToPcf = ca -> csp.pcf "Uses"
        yadToPcf = yad -> csp.pcf "Uses"
        cmToPcf = cm -> csp.pcf "Uses"
        ccfToPcf = ccf -> csp.pcf "Uses"
        cfToPcf = cf -> csp.pcf "Uses"
        innoToPcc = inno -> csp.pcc "Uses"
        soToPcc = so -> csp.pcc "Uses"
        caToPcc = ca -> csp.pcc "Uses"
        comeToPcc = come -> csp.pcc "Uses"
        coToPcc = co -> csp.pcc "Uses"
        cspXToPcc = cspX -> csp.pcc "Uses"
        dafToPcc = daf -> csp.pcc "Uses"
        dramToPcc = dram -> csp.pcc "Uses"
        enteToPcc = ente -> csp.pcc "Uses"
        factToPcc = fact -> csp.pcc "Uses"
        feToPcc = fe -> csp.pcc "Uses"
        ncasToPcc = ncas -> csp.pcc "Uses"
        yadToPcc = yad -> csp.pcc "Uses"
        cmToPcc = cm -> csp.pcc "Uses"
        ccfToPcc = ccf -> csp.pcc "Uses"
        sciToPcc = sci -> csp.pcc "Uses"
        f4ToPcc = f4 -> csp.pcc "Uses"
        4creToPcc = 4cre -> csp.pcc "Uses"
        markToPcc = mark -> csp.pcc "Uses"
        prodXToPcc = prodX -> csp.pcc "Uses"
        innoToPp = inno -> csp.pp "Uses"
        soToPp = so -> csp.pp "Uses"
        caToPp = ca -> csp.pp "Uses"
        cspXToPp = cspX -> csp.pp "Uses"
        dafToPp = daf -> csp.pp "Uses"
        dramToPp = dram -> csp.pp "Uses"
        factToPp = fact -> csp.pp "Uses"
        feToPp = fe -> csp.pp "Uses"
        ncasToPp = ncas -> csp.pp "Uses"
        yadToPp = yad -> csp.pp "Uses"
        cmToPp = cm -> csp.pp "Uses"
        piToPp = pi -> csp.pp "Uses"
        ccfToPp = ccf -> csp.pp "Uses"
        f4ToPp = f4 -> csp.pp "Uses"
        commToPp = comm -> csp.pp "Uses"
        caToPpX = ca -> csp.ppX "Uses"
        cspXToPpX = cspX -> csp.ppX "Uses"
        dafToPpX = daf -> csp.ppX "Uses"
        piToPpX = pi -> csp.ppX "Uses"
        ccfToPpX = ccf -> csp.ppX "Uses"
        paaToAs = paa -> dap.as "Uses"
        soToBarb = so -> dap.barb "Uses"
        dsToBarb = ds -> dap.barb "Uses"
        cseToBor = cse -> dap.bor "Uses"
        partToBor = part -> dap.bor "Uses"
        soToBor = so -> dap.bor "Uses"
        tradToBor = trad -> dap.bor "Uses"
        arToEdw = ar -> dap.edw "Uses"
        dsToEdw = ds -> dap.edw "Uses"
        techToEdw = tech -> dap.edw "Uses"
        arToC4 = ar -> dap.c4 "Uses"
        soToDcri = so -> dap.dcri "Uses"
        digiToDcrs = digi -> dap.dcrs "Uses"
        aiXToDcrs = aiX -> dap.dcrs "C4 Audience Team and Marketing team use the Data Clean Room solution for creating overlapping aud..."
        dmToDcrs = dm -> dap.dcrs "Uses"
        soToDf = so -> dap.df "Uses"
        atToDf = at -> dap.df "Uses"
        insiToTabl = insi -> dap.tabl "Uses"
        insiToWa = insi -> dap.wa "Uses"
        ccfToAtax = ccf -> fsp.atax "Uses"
        ccfToBbp = ccf -> fsp.bbp "Uses"
        c4ToBsw = c4 -> fsp.bsw "Raise and approve POs"
        ccfToBsw = ccf -> fsp.bsw "Uses"
        ccfrssToBsw = ccfrss -> fsp.bsw "Uses"
        ccfToEbs = ccf -> fsp.ebs "Uses"
        ccfrssToEbs = ccfrss -> fsp.ebs "Uses"
        c4ToFaf = c4 -> fsp.faf "Uses"
        ccfToMsc = ccf -> fsp.msc "Uses"
        ccfToSov = ccf -> fsp.sov "Uses"
        ccfToSbi = ccf -> fsp.sbi "Uses"
        ccfrssToSbi = ccfrss -> fsp.sbi "Uses"
        ccfrssToTgn = ccfrss -> fsp.tgn "Uses"
        ccfToWda = ccf -> fsp.wda "Uses"
        ddToLsp = dd -> lpp.lsp "Uses"
        piToLsp = pi -> lpp.lsp "Uses"
        btToLsp = bt -> lpp.lsp "Uses"
        btToSp = bt -> lpp.sp "Uses"
        dmToBraz = dm -> mp.braz "Uses"
        cpXToMpar = cpX -> mp.mpar "Uses"
        dmpToMpar = dmp -> mp.mpar "Uses"
        cspXToAwar = cspX -> mmp.awar "Uses"
        trafToMsp = traf -> mmp.msp "Uses"
        ccToMsp = cc -> mmp.msp "Uses"
        cmToMsp = cm -> mmp.msp "Uses"
        paasToMsp = paas -> mmp.msp "Uses"
        btToMsp = bt -> mmp.msp "Uses"
        4creToMsp = 4cre -> mmp.msp "Uses"
        prodXToMsp = prodX -> mmp.msp "Uses"
        clacToPpsp = clac -> mmp.ppsp "Uses"
        btToPpsp = bt -> mmp.ppsp "Uses"
        4creToPpsp = 4cre -> mmp.ppsp "Uses"
        c4To4peo = c4 -> psp.4peo "Uses"
        peopTo4peo = peop -> psp.4peo "Uses"
        c4ToActi = c4 -> psp.acti "Uses"
        peopToActi = peop -> psp.acti "Uses"
        corpToAc = corp -> psp.ac "Uses"
        c4ToBp = c4 -> psp.bp "Uses"
        erToBp = er -> psp.bp "Uses"
        ctToEr = ct -> psp.er "Uses"
        c4ToFes = c4 -> psp.fes "Uses"
        peopToFes = peop -> psp.fes "Uses"
        c4ToLl = c4 -> psp.ll "Uses"
        ladToLl = lad -> psp.ll "Uses"
        peopToPopp = peop -> psp.popp "Uses"
        c4ToTlh = c4 -> psp.tlh "Uses"
        soToPrms = so -> rmp.prms "Uses"
        caToPrms = ca -> rmp.prms "Uses"
        cspXToPrms = cspX -> rmp.prms "Uses"
        dramToPrms = dram -> rmp.prms "Uses"
        cmToPrms = cm -> rmp.prms "Uses"
        piToPrms = pi -> rmp.prms "Uses"
        ccfToPrms = ccf -> rmp.prms "Uses"
        4stuToPrms = 4stu -> rmp.prms "Uses"
        markToPrms = mark -> rmp.prms "Uses"
        caToRc = ca -> rmp.rc "Uses"
        partToCome = part -> rsp.come "Uses"
        caToCome = ca -> rsp.come "Uses"
        piToCome = pi -> rsp.come "Uses"
        ccfrssToCome = ccfrss -> rsp.come "Uses"
        caToEps = ca -> rsp.eps "Uses"
        caToNeo = ca -> rsp.neo "Uses"
        soToPap = so -> rsp.pap "Uses"
        caToPap = ca -> rsp.pap "Uses"
        ccfToPap = ccf -> rsp.pap "Uses"
        sciToPap = sci -> rsp.pap "Uses"
        caToPris = ca -> rsp.pris "Uses"
        piToPris = pi -> rsp.pris "Uses"
        ccfToPris = ccf -> rsp.pris "Uses"
        4stuToPris = 4stu -> rsp.pris "Uses"
        caToPrrs = ca -> rsp.prrs "Uses"
        ccfToPrrs = ccf -> rsp.prrs "Uses"
        caToSd = ca -> rsp.sd "Uses"
        4stuToTed = 4stu -> rsp.ted "Uses"
        cspXToPepl = cspX -> sp.pepl "Uses"
        yadToPepl = yad -> sp.pepl "Uses"
        cmToPepl = cm -> sp.pepl "Uses"
        piToPepl = pi -> sp.pepl "Uses"
        commToPepl = comm -> sp.pepl "Uses"
        clacToAnda = clac -> sbs.anda "Uses"
        piToAnda = pi -> sbs.anda "Clunky and difficult to use."
        procToCms = proc -> sbs.cms "Uses"
        clgToFa = clg -> sbs.fa "Uses"
        techToTime = tech -> sbs.time "Uses"
        viewToC4sl = view -> vsp.c4sl "Uses"
        a4eToPipe = a4e -> vsp.pipe "Uses"
        gsToSm = gs -> vsp.sm "Uses"
        techToSl = tech -> vsp.sl "Uses"
        piToTr = pi -> vsp.tr "Uses"
        cpXToThin = cpX -> vsp.thin "Uses"
        fmToCe = fm -> wsp.ce "Uses"
        c4ToEgen = c4 -> wsp.egen "Uses"
        ccfToEgen = ccf -> wsp.egen "Uses"

        /* ============================================================
           APPLICATION -> APPLICATION RELATIONSHIPS (from LeanIX Interfaces)
           ============================================================ */
        
        4ta = psp.4peo -> psp.acti "4People to ActivePay" "Mule" "Integration"
        4tac = psp.4peo -> wsp.ac "4People to Alert cascade" "Mule" "Integration"
        4tb = psp.4peo -> wsp.ac "4People to Benefits" "Mule" "Integration,Benefex Replacement,Impact"
        4tce = psp.4peo -> wsp.ce "4People to Concept Evolution" "Mule" "Integration"
        4tcms = psp.4peo -> sbs.cms "4People to Contract Management System(CMS)" "Mule" "Integration"
        4tc = psp.4peo -> psp.tlh "4People to Cornerstone" "Mule" "Integration"
        4te = psp.4peo -> wsp.egen "4People to Egencia" "Mule" "Integration"
        4toe = psp.4peo -> fsp.ebs "4People to Oracle EBS" "Mule" "Integration"
        4tp = psp.4peo -> fsp.wda "4People to Planning" "Alternative" "Integration"
        4tpX = psp.4peo -> psp.popp "4People to Poppulo" "Mule" "Integration"
        atsfasdf = sp.pass -> cp.stel "A55 to Stellar for Advanced Schedule data flow" "SFTP" "Integration"
        aptf = psp.acti -> fsp.wda "Active Pay to Financial Planning" "Mule" "Integration"
        atoe = psp.acti -> fsp.ebs "ActivPay to Oracle EBS" "Mule" "Integration"
        asstc = vsp.yosp -> vsp.c4sl "Ad Serving System to C4S" "Alternative" "Integration,Streaming Transformation Program,Impact"
        aate = dap.wa -> dap.edw "Adobe Analytics to EDW" "Alternative" "Integration"
        apffpfb = cp.ap -> bms.pbm "Agency Portal fetch from Pirate for Brand" "Mule" "Integration"
        apffsfp = cp.ap -> cp.stel "Agency Portal fetch from Stellar for Programme" "Mule" "Integration"
        apfsfpyot = cp.ap -> cp.stel "Agency Portal from Stellar for Pick Your Own transmission" "Mule" "Integration"
        ai = csp.pcc -> rsp.prrs "Agreement Information" "Alternative" "Integration"
        ap = rsp.sd -> rsp.pap "Artist payments" "Automate" "Integration,Corporate Integration,Impact"
        adaa = bms.asp -> mmp.msp "ASP Delivery Acknowledgment API" "Alternative" "Integration"
        alsstl = lpp.lsp -> bms.asp "ASP live subtitle streams to LSP" "Alternative" "Integration"
        allsfl = bms.asp -> lpp.lsp "ASP low latency stream from LSP" "Alternative" "Integration"
        apja = bms.asp -> mmp.msp "ASP Production Job API" "Alternative" "Integration"
        apjsa = mmp.msp -> bms.asp "ASP Production Job Status API" "Alternative" "Integration"
        asfp = bms.asp -> bms.pira "ASP Schedule from Pirate" "Alternative" "Integration"
        assmfd = bms.asp -> mmp.msp "ASP Signer Source Media File Delivery" "Alternative" "Integration"
        avcmfd = bms.asp -> mmp.msp "ASP Viewing Copy Media File Delivery" "Alternative" "Integration"
        asaltf = cp.fsh -> dap.as "Audience Segments and Lookalikes to Freewheel" "Alternative" "Integration,Streaming Transformation Program,Impact"
        bwpfo = fsp.ebs -> fsp.bbp "BACS & Wire Payments File Out" "Automate" "Integration"
        brdte = dap.barb -> dap.edw "BARB ratings data to EDW" "SFTP" "Integration"
        btsfau = dap.barb -> cp.stel "BARB to Stellar for Audience Universe" "SFTP" "Integration"
        btsfi = dap.barb -> cp.stel "BARB to Stellar for Impacts" "SFTP" "Integration"
        bpsri = fsp.bbp -> fsp.ebs "Barclay Payment Statement Receipt In" "Automate" "Integration,Corporate Integration,Impact"
        bsi = fsp.bbp -> fsp.ebs "Barclay Statement In" "Automate" "Integration,Corporate Integration,Impact"
        bbdc = fsp.ebs -> fsp.bsw "Basware Business Department Codes" "Alternative" "Integration,Corporate Integration,Impact"
        bcer = fsp.ebs -> fsp.bsw "Basware Currency Exchange Rates" "Alternative" "Integration,Corporate Integration,Impact"
        bglcvr = fsp.ebs -> fsp.bsw "Basware GL Cross Validation Rules" "Alternative" "Integration,Corporate Integration,Impact"
        bglnc = fsp.ebs -> fsp.bsw "Basware GL Nominal Codes" "Alternative" "Integration,Corporate Integration,Impact"
        bic = fsp.ebs -> fsp.bsw "Basware Individual Codes" "Alternative" "Integration,Corporate Integration,Impact"
        bis = fsp.bsw -> fsp.ebs "Basware Invoice Statuses" "Alternative" "Integration,Corporate Integration,Impact"
        bpvpci = fsp.ebs -> fsp.bsw "Basware Payments/Void Payments/Cancelled Invoices" "Alternative" "Integration,Corporate Integration,Impact"
        bpcc = fsp.ebs -> fsp.bsw "Basware Pirate Code Combinations" "Alternative" "Integration,Corporate Integration,Impact"
        bprodc = fsp.ebs -> fsp.bsw "Basware Product Codes" "Alternative" "Integration,Corporate Integration,Impact"
        bprojc = fsp.ebs -> fsp.bsw "Basware Project Codes" "Alternative" "Integration,Corporate Integration,Impact"
        bws = fsp.ebs -> fsp.bsw "Basware Suppliers" "Alternative" "Integration,Corporate Integration,Impact"
        b2ebs = fsp.bsw -> fsp.ebs "Basware to EBS for Approved Invoices" "Automate" "Integration,Corporate Integration,Impact"
        b2sbi = fsp.bsw -> fsp.ebs "Basware to SplashBI (Oracle eBS Schema)" "Alternative" "Integration,Corporate Integration,Impact"
        b2sbi2 = fsp.bsw -> fsp.sbi "Basware to SplashBI (Oracle eBS Schema)" "Alternative" "Integration,Corporate Integration,Impact"
        bur = fsp.ebs -> fsp.bsw "Basware User Rights" "Alternative" "Integration,Corporate Integration,Impact"
        buriu = fsp.ebs -> fsp.bsw "Basware User Rights (Inactive users)" "Alternative" "Integration,Corporate Integration,Impact"
        bta = psp.acti -> psp.bp "Benefits to Actvipay" "Alternative" "Integration,Benefex Replacement,Review Benefits Portal,Impact"
        bdte = cp.stel -> dap.edw "Budget data to EDW" "Alternative" "Integration"
        btmii = sp.mod -> bms.bynd "Bynder to MediaGenix Image Integration" "Alternative" "Integration,Streaming Transformation Program,Impact"
        btmitc = sp.mod -> bms.bynd "Bynder to MediaGenix Image Tagging Changes" "Alternative" "Integration,Streaming Transformation Program,Impact"
        chptpr = psp.er -> dap.bor "C4 HR & Payroll to PowerBI Reporting" "Mule" "Integration"
        4io = fsp.ebs -> rsp.come "C4 intl overages" "SFTP" "Integration,Corporate Integration,Impact"
        cptyfa = vsp.yosp -> cp.stel "C4 Promo to YoSpace for Advertisements" "Mule" "Integration"
        4vatr = fsp.sov -> fsp.ebs "C4 VAT Returns" "Alternative" "Integration"
        cbsdte = vsp.sm -> dap.edw "C4S Braintree Subscriber data to EDW" "Alternative" "Integration,Streaming Transformation Program,Impact"
        cetf = vsp.free -> sp.pepl "C4S EPG to Freely" "Alternative" "Integration,Streaming Transformation Program,Impact"
        cete = vsp.mpar -> dap.edw "C4S Events to EDW" "Alternative" "Integration,Streaming Transformation Program,Impact"
        cfvetba = vsp.ova -> vsp.free "C4S Freely Video Events to BitMovin Analytics" "Alternative" "Integration,Streaming Transformation Program,Impact"
        cfvsfc = vsp.cdna -> vsp.free "C4S Freely Video Stream from CDN" "Alternative" "Integration,Streaming Transformation Program,Impact"
        cmifc = vsp.cdna -> sp.mod "C4S MoD Images from CDN" "Alternative" "Integration,Streaming Transformation Program,Impact"
        cqte = vsp.ova -> dap.edw "C4S QoS to EDW" "Alternative" "Integration,Streaming Transformation Program,Impact"
        csty = vsp.yosp -> bms.osp "C4S Streams to YoSpace" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ctaa = dap.wa -> vsp.c4sl "C4S to Adobe Analytics" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ctb = dap.barb -> vsp.c4sl "C4S to BARB" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ctc7t = vsp.c4sl -> bms.c7t "C4S to C4 7A Titles" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ctlvs = lpp.lsp -> vsp.c4sl "C4S to Licence Validation Service" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ctsma = vsp.sm -> vsp.c4sl "C4S to Subscription Management (Aptitude)" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ctt-ue = vsp.thin -> vsp.c4sl "C4S to ThinkAnalytics - User Events" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ctetaa = dap.wa -> vsp.mpar "C4S Tracking Events to Adobe Analytics" "Alternative" "Integration"
        ctetm = vsp.mpar -> vsp.c4sl "C4S Tracking Events to mParticle" "Alternative" "Integration,Streaming Transformation Program,Impact"
        cvmtf = vsp.free -> sp.mod "C4S VoD Metadata to Freely" "Alternative" "Integration,Streaming Transformation Program,Impact"
        c4st = mp.po -> mp.po "C4STELLARPROMO" "Alternative" "Integration"
        c4st2 = mp.po -> cp.stel "C4STELLARPROMO" "Alternative" "Integration"
        caapfsfd = cp.ap -> cp.stel "CARIA and Agency Portal from Stellar for Deals" "Mule" "Integration"
        cfsfcri = cp.cari -> cp.stel "CARIA from Stellar for Copy Rotation Instruction" "Mule" "Integration"
        ctsfcri = cp.cari -> cp.stel "CARIA to Stellar for Copy Rotation Instructions" "SFTP" "Integration"
        ctsfdacc = cp.cari -> cp.stel "CARIA to STELLAR for Deals and Campaign creation" "SFTP" "Integration"
        cro2c = fsp.ebs -> rsp.come "Cash Receipts from Oracle to Comet" "Alternative" "Integration"
        ctt = bms.pcgs -> bms.ptis "CGS to TIS2" "Alternative" "Integration"
        c4itr = mmp.msp -> mmp.pmm "Channel 4 Interstitals to RedBee" "Mule" "Integration"
        c4srtb = mp.braz -> vsp.c4sl "Channel 4 Streaming Recommendations to Braze" "Alternative" "Integration,Streaming Transformation Program,Impact"
        c4tpt = mmp.msp -> bms.asp "Channel 4 to PFT token" "Mule" "Integration"
        crbtas = dap.as -> dap.dcri "Clean Room (Brandm4tch) to Audience Segmentation" "Alternative" "Integration,Streaming Transformation Program,Impact"
        crbtas2 = dap.as -> dap.dcrs "Clean Room (Brandm4tch) to Audience Segmentation" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ctsfcci = cp.fsh -> cp.stel "Clearcast to Stellar for Copy Clearance Information" "Mule" "Integration"
        ctf = cp.fsh -> bms.cmt "CMT to Freewheel" "Alternative" "Integration"
        ctp = bms.pira -> bms.cmt "CMT to Pirate" "Mule" "Integration"
        ctpc = bms.cmt -> bms.pcX "CMT to Promo Create" "Alternative" "Integration"
        ctpo = mp.po -> bms.cmt "CMT to Promo Optimiser" "Alternative" "Integration"
        ccii = rsp.come -> fsp.ebs "Comet C4I Invoice Interface" "Alternative" "Integration"
        cffli = fsp.ebs -> rsp.come "Comet FFL Invoice Interface" "Automate" "Integration"
        cai = bms.pira -> rsp.pris "Contract & Agreement info" "Mule" "Integration"
        caiX = csp.pcc -> rsp.pap "Contract/Prog & Agreement info" "Alternative" "Integration"
        cpdta = bms.pira -> sbs.anda "Contracts PAC data to Anda" "Alternative" "Integration"
        cctf = cp.cc -> cp.fsh "Copy Central to Freewheel" "Alternative" "Integration"
        ccts = cp.cc -> cp.stel "Copy Central to Stellar" "Alternative" "Integration"
        ctll = psp.tlh -> psp.ll "Cornerstone to LinkedIn Learning" "Alternative" "Integration"
        epct = psp.fes -> fsp.ebs "EBS project codes to FES" "Alternative" "Integration"
        et4f = psp.4peo -> fsp.ebs "EBS to 4People for Employees" "Alternative" "Integration"
        ebstrd = fsp.ebs -> fsp.bsw "EBS to Basware for Reference & Transactional data" "Alternative" "Integration,Corporate Integration,Impact"
        etcf = rsp.come -> fsp.ebs "EBS to Comet for Cash Receipts" "SFTP" "Integration"
        ebsmc = fsp.msc -> fsp.ebs "EBS to Mastercard for Employee credit card transactions" "Alternative" "Integration,Corporate Integration,Impact"
        ebspir = fsp.ebs -> rsp.come "EBS to Pirate (Comet Flim4)" "Automate, SFTP" "Integration"
        ebsstr = fsp.ebs -> cp.stel "EBS to Stellar Daily exchange rate (in) Invoices (out)" "Alternative" "Integration"
        ebscex = fsp.ebs -> cp.stel "EBS to Stellar for Currency Exchange" "SFTP" "Integration"
        ebplan = fsp.ebs -> fsp.wda "eBusiness to Planning" "Alternative" "Integration"
        e4ti = dap.dcri -> dap.edw "EDW 4 to Infosum" "Alternative" "Integration"
        emcstmdf = dap.df -> dap.edw "EDW Marketing Campaign Snapshots to Microsoft Data Fabric" "Alternative" "Integration"
        emctmdf = dap.df -> dap.edw "EDW Marketing Campaign to Microsoft Data Fabric" "Alternative" "Integration"
        esitb = mp.braz -> dap.edw "EDW Streaming Identity to Braze" "Alternative" "Integration,Streaming Transformation Program,Impact"
        etdf-sd = dap.df -> dap.edw "EDW to  Data Fabric - Spots data" "Alternative" "Integration"
        etapsp = dap.edw -> rsp.pap "EDW to Artist Payment Systems (Pirate)" "Alternative" "Integration"
        etb = mp.braz -> dap.edw "EDW to Braze" "Alternative" "Integration"
        etm-ipcau = dap.edw -> dap.as "EDW to Mediarithmics - Instream Promo Control Audience Upload" "Alternative" "Integration"
        etm-sud = dap.as -> dap.edw "EDW to Mediarithmics - Streaming User Data" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ett-v = vsp.thin -> dap.edw "EDW to ThinkAnalytics - Viewers" "Alternative" "Integration,Streaming Transformation Program,Impact"
        etdftp = dap.edw -> bms.pira "EDW TX data feed to Pirate" "Alternative" "Integration"
        fgl = bms.pira -> fsp.ebs "Failed GL lines" "Alternative" "Integration"
        fvte = cp.fsh -> dap.edw "Feewheel v4logs to EDW" "Alternative" "Integration"
        faebs = fsp.ebs -> fsp.faf "Finance Approval to E-Business Suite" "Alternative" "Integration"
        ffsffdovc = cp.fsh -> dap.edw "Freewheel from Stellar for Forecast data of VOD Campaign" "Mule" "Integration"
        ffsffdovc2 = cp.fsh -> cp.stel "Freewheel from Stellar for Forecast data of VOD Campaign" "Mule" "Integration"
        fltmdf = cp.fsh -> dap.df "Freewheel logs to Microsoft Data Fabric" "Alternative" "Integration"
        ftiecua = dap.dcri -> cp.fsh "Freewheel to Infosum (Exposed Campaign Users Attribution)" "Alternative" "Integration"
        ftsffrdca = cp.fsh -> cp.stel "Freewheel to Stellar for Freewheel reference data changes API" "Alternative" "Integration"
        ftsvvfcsap = cp.fsh -> cp.stel "Freewheel to Stellar VoD Views for Commercial, Sponsorship and Promotions" "SFTP" "Integration"
        frtpa = mmp.msp -> bms.prta2 "From RedBee to Pirate ASRUN" "Mule" "Integration"
        fstpfcr = cp.stel -> bms.pira "From Stellar to Pirate for Commercial Registrations" "Alternative" "Integration"
        idtc = bms.bynd -> vsp.c4sl "Image DAM to C4S" "Alternative" "Integration,Streaming Transformation Program,Impact"
        imcfstp = rsp.soun -> bms.pira "Interstial music cuesheets from Soundmouse to Pirate" "Automate, SFTP" "Integration"
        icnf = rsp.pris -> fsp.ebs "Invoice/credit note for Royalties" "Automate" "Integration,Corporate Integration,Impact"
        lspp = bms.pira -> vsp.c4sl "Logging Sheets & Programme Parts" "Alternative" "Integration,Streaming Transformation Program,Impact"
        lcflr = lpp.lsp -> mmp.ppsp "LSP Contribution Feed ( Line Record)" "Alternative" "Integration"
        lmfd = lpp.lsp -> mmp.msp "LSP Media File Delivery" "Alternative" "Integration"
        lm = lpp.lsp -> bms.osp "LSP Multicast" "Alternative" "Integration"
        lsto = bms.osp -> lpp.lsp "LSP Simulcast to OSLP" "Alternative" "Integration,Streaming Transformation Program,Impact"
        ltpa = bms.pira -> lpp.lsp "LSP to Pirate Asruns" "Alternative" "Integration"
        mtbb = bms.bynd -> sp.mod "MediaGenix to Bynder Brand" "Alternative" "Integration"
        mtfpi = cp.fsh -> sp.mod "MediaGenix to FreeWheel Programme Info" "Alternative" "Integration"
        mtgc4vc = bms.grac -> sp.mod "MediaGenix to Gracenote Channel 4 VoD Catalogue" "Mule" "Integration"
        mtmbvsi = sp.mod -> sp.mod "MediaGenix to MediaGenix BARB VOD Schedule Integration" "Alternative" "Integration"
        mtpecw = bms.pira -> sp.mod "MediaGenix to Pirate EPG Content Warnings" "Mule" "Integration"
        mttc4vc = vsp.thin -> sp.mod "MediaGenix to ThinkAnalytics Channel 4 VoD Catalogue" "Mule" "Integration,Streaming Transformation Program,Impact"
        mtbfms = mp.braz -> dap.as "Mediarithmics to Braze for Marketing Segments" "Alternative" "Integration,Streaming Transformation Program,Impact"
        mtffas = cp.fsh -> dap.as "Mediarithmics to Freewheel for ALA segments" "Alternative" "Integration"
        mticga = dap.dcri -> dap.as "Mediarithmics to Infosum (Control Group attribution)" "Alternative" "Integration"
        mvrtp = mmp.msp -> sp.mod "MoD  VoD Request to PFT" "Alternative" "Integration,Streaming Transformation Program,Impact"
        msdte = vsp.sm -> dap.edw "MPP Subscriber data to EDW" "Alternative" "Integration,Streaming Transformation Program,Impact"
        mcra = mmp.msp -> bms.asp "MSP Content Request API" "Alternative" "Integration"
        mcra2 = mmp.msp -> lpp.lsp "MSP Content Request API" "Alternative" "Integration"
        mcra3 = mmp.msp -> bms.osp "MSP Content Request API" "Alternative" "Integration"
        mcra4 = mmp.msp -> mmp.ppsp "MSP Content Request API" "Alternative" "Integration"
        mmvfto = mmp.msp -> bms.osp "MSP Master Video Files to OLSP" "Alternative" "Integration,Streaming Transformation Program,Impact"
        mmfd-abs = mmp.msp -> csp.dist "MSP Media File Delivery - Acquired BBC Studios" "Alternative" "Integration"
        mmfd-af = mmp.msp -> csp.dist "MSP Media File Delivery - Acquired Fox/Disney" "Alternative" "Integration"
        mmfd-ag = mmp.msp -> csp.dist "MSP Media File Delivery - Acquired Generic" "Alternative" "Integration"
        mmfd-as = mmp.msp -> csp.dist "MSP Media File Delivery - Acquired Sony" "Alternative" "Integration"
        mmfd-at = mmp.msp -> csp.dist "MSP Media File Delivery - Acquired Turner" "Alternative" "Integration"
        mmfd-aw = mmp.msp -> csp.dist "MSP Media File Delivery - Acquired Warner" "Alternative" "Integration"
        mmfd-c = mmp.msp -> cp.cari "MSP Media File Delivery - Commercials" "Alternative" "Integration"
        mmfd-c2 = mmp.msp -> cp.cc "MSP Media File Delivery - Commercials" "Alternative" "Integration"
        mmfd-cp = mmp.msp -> csp.pc "MSP Media File Delivery - Commissioned Programmes" "Alternative" "Integration"
        mmfd-i = mmp.msp -> csp.pc "MSP Media File Delivery - Interstitials" "Alternative" "Integration"
        mmfd-lvr = mmp.msp -> lpp.lsp "MSP Media File Delivery - LSP Video Recordings" "Alternative" "Integration"
        mmfd-lvrX = mmp.msp -> lpp.lsp "MSP Media File Delivery - LSP Voiceover Recordings" "Alternative" "Integration"
        mmfd-mmtsflft = mmp.msp -> cp.stel "MSP Media File Delivery - MB Media to Stellar for Long Form teleshopping" "SFTP" "Integration"
        mmfd-mv = mmp.msp -> cp.cari "MSP Media File Delivery - Music Videos" "Alternative" "Integration"
        mmfd-sad = mmp.msp -> bms.asp "MSP Media File Delivery - Subtitles & Audio Description" "Alternative" "Integration"
        mmfd-s = mmp.msp -> bms.asp "MSP Media File Delivery - Supertrusted" "Alternative" "Integration"
        mmfd-s2 = mmp.msp -> mmp.ppsp "MSP Media File Delivery - Supertrusted" "Alternative" "Integration"
        mpvba = mmp.msp -> mmp.pvb "MSP Pirate Video Browse API" "Alternative" "Integration"
        mpvbfh = mmp.msp -> mmp.pvb "MSP Pirate Video Browse File Hosting" "Alternative" "Integration"
        msfr = mmp.msp -> bms.pira "MSP Schedule File Receipt" "Alternative" "Integration"
        mti = mmp.msp -> mmp.uv "MSP Tape Ingest" "Alternative" "Integration"
        mtp = mmp.pmm -> mmp.msp "MSP to Pirate" "Mule" "Integration"
        mtrta = mmp.rta -> mmp.msp "MSP to Ready to Air" "Alternative" "Integration"
        mts = rsp.soun -> mmp.msp "MSP to Soundmouse" "Alternative" "Integration"
        mtc4df = mmp.msp -> bms.pira "MSPs to Channel 4 DFS folders" "Mule" "Integration"
        nos = bms.pc -> rsp.prrs "Name of Supplier" "Alternative" "Integration"
        ntn = rsp.pris -> bms.pira "New transmitted notifications" "Alternative" "Integration"
        oscn = fsp.ebs -> rsp.prrs "Oracle suppliers contact names" "Alternative" "Integration,Corporate Integration,Impact"
        oatax = fsp.ebs -> fsp.atax "Oracle to AlphaTax" "Alternative" "Integration"
        otunx = fsp.ebs -> fsp.tgn "Oracle to Tungsten XML Invoice feed" "Mule" "Integration"
        pfpfstp = rsp.soun -> bms.pira "PAC form PDFs from Soundmouse to Pirate" "Automate, SFTP" "Integration"
        pfxfstp = rsp.soun -> bms.pira "PAC form XMLs from Soundmouse to Pirate" "Automate, SFTP" "Integration"
        pmfsfaf = mmp.msp -> cp.stel "Peach Media from Stellar for Attribution files" "Mule" "Integration"
        patveo = bms.pira -> sp.pass "Pirate A55 to VMS (ex Optimum)" "Mule" "Integration"
        patveo2 = bms.pira -> sp.pepl "Pirate A55 to VMS (ex Optimum)" "Mule" "Integration"
        patveo3 = bms.pira -> bms.pvmsv "Pirate A55 to VMS (ex Optimum)" "Mule" "Integration"
        passtc = bms.pira -> vsp.c4sl "Pirate Advance Scheduling System to C4S" "Alternative" "Integration,Streaming Transformation Program,Impact"
        pctc = bms.pira -> vsp.c4sl "Pirate Certification to C4S" "Alternative" "Integration,Streaming Transformation Program,Impact"
        pctb = bms.bynd -> bms.pcgs "Pirate CGS to Bynder" "Mule" "Integration"
        pctf = cp.fsh -> bms.pcgs "Pirate CGS to Freewheel" "Mule" "Integration"
        pctmfvo = mmp.msp -> bms.pcgs "Pirate CGS to MSP for VPS origin" "Mule" "Integration"
        pctsfpapi = bms.pcgs -> cp.stel "Pirate CGS to Stellar for Programme and Platform information" "Alternative" "Integration"
        pctfX = cp.fsh -> bms.pcgs "Pirate Creatives to Freewheel" "Mule" "Integration"
        pffrfs = bms.pira -> bms.asp "Pirate fetch from RedBee for Subtitles" "Mule" "Integration"
        pirgl = fsp.ebs -> rsp.come "Pirate GL posted Transactions" "Alternative" "Integration"
        pptasb = mmp.msp -> sp.ppps "Pirate PPS to AWS S3 Bucket" "Mule" "Integration"
        ppitf = cp.fsh -> bms.pcgs "Pirate Programme Info to FreeWheel" "Mule" "Integration,Streaming Transformation Program,Impact"
        prmstc = bms.pira -> vsp.c4sl "Pirate Rights Management System to C4S" "Alternative" "Integration,Streaming Transformation Program,Impact"
        prdtoe = rmp.prms -> dap.edw "PIRATE RMS data to  Oracle EDW" "Alternative" "Integration"
        pta = lpp.ac -> sp.mod "Pirate To Amagi" "Alternative" "Integration"
        ptbfca = sp.mod -> bms.pira "Pirate to BeBanjo for Catalogue Assets" "Mule" "Integration"
        ptbfca2 = sp.mod -> csp.pp "Pirate to BeBanjo for Catalogue Assets" "Mule" "Integration"
        ptbfls = sp.mod -> bms.pira "Pirate to BeBanjo for Linear Scheduling" "Mule" "Integration"
        ptbfls2 = sp.mod -> sp.pass "Pirate to BeBanjo for Linear Scheduling" "Mule" "Integration"
        ptbfma = sp.mod -> bms.pira "Pirate to BeBanjo for Media Assets" "Mule" "Integration"
        ptbfma2 = sp.mod -> mmp.pmm "Pirate to BeBanjo for Media Assets" "Mule" "Integration"
        ptbfr = sp.mod -> rmp.prms "Pirate to BeBanjo for Rights" "Mule" "Integration,Streaming Transformation Program,Impact"
        ptbfs = sp.mod -> bms.pira "Pirate to BeBanjo for Segment" "Mule" "Integration"
        ptbdf = mmp.pmm -> bms.bynd "Pirate to Bynder data flow" "Alternative" "Integration"
        ptcpft = mmp.msp -> mmp.pvb "Pirate to Clear (Prime Focus Technology)" "Mule" "Integration"
        ptcs = bms.pira -> mmp.msp "Pirate to Compliance Service" "Alternative" "Integration"
        ptdfvp = bms.et -> bms.pira "Pirate to DUK Freesat VOD publication" "Alternative" "Integration"
        ptdfvpX = bms.et -> bms.pira "Pirate to DUK Freeview VOD publication" "Alternative" "Integration"
        pte = bms.pira -> fsp.ebs "Pirate to EBS" "Alternative" "Integration"
        ptes = bms.pira -> mmp.msp "Pirate to Editorial Service" "Alternative" "Integration"
        ptgc4ce = bms.pira -> bms.grac "Pirate to Gracenote Channel 4 channel EPGs" "Mule" "Integration"
        ptgmce = bms.pira -> bms.grac "Pirate to Gracenote music channel EPGs" "Alternative" "Integration"
        ptk = sp.ppps -> dap.barb "Pirate to Kantar" "Mule" "Integration"
        ptkfa = dap.barb -> mmp.pmm "Pirate to Kantar for Assets" "Mule" "Integration"
        ptl = lpp.lsp -> bms.pira "Pirate To LSP" "Alternative" "Integration"
        ptl2 = lpp.lsp -> cp.stel "Pirate To LSP" "Alternative" "Integration"
        ptmocm = sp.mod -> bms.pira "Pirate to MediaGenix On-Demand Content Metadata" "Mule" "Integration"
        ptmocm2 = sp.mod -> sp.pepl "Pirate to MediaGenix On-Demand Content Metadata" "Mule" "Integration"
        ptpo = sp.ppps -> mp.po "Pirate To Promo Optimser" "Mule" "Integration"
        ptss = lpp.lsp -> sp.ppps "Pirate to Schedule Service" "Alternative" "Integration"
        pts = bms.pira -> cp.stel "Pirate to Stellar" "Alternative" "Integration"
        ptsfac = sp.pitts -> cp.stel "Pirate to Stellar for ASRUN commercial" "Automate, SFTP" "Integration"
        ptsfan = sp.ppps -> cp.stel "Pirate to Stellar for ASRUN Non-commercial" "Alternative" "Integration"
        ptsfset = sp.ppps -> cp.stel "Pirate to Stellar for Schedule & Event timings" "Alternative" "Integration"
        ptsufb = cp.stel -> cp.ap "Pirate to Stellar update for Brand" "Mule" "Integration"
        pvtrmpn = mmp.msp -> bms.ptis "Pirate VPS to (RedBee, M2A, PFT, NLDR)" "Mule" "Integration"
        pvts = mmp.msp -> mmp.pmm "Pirate VPS to S3" "Mule" "Integration"
        pwfts = bms.pira -> cp.stel "Pirate Weekly Forecast to Stellar" "Automate" "Integration"
        pvtcrps = rsp.prrs -> rmp.prms "Portal view to capture Royalty Producer shares" "Alternative" "Integration"
        pdfpts = rsp.soun -> bms.pira "Post-TX data from Pirate to Soundmouse" "Automate, SFTP" "Integration"
        pcf = mmp.ppsp -> lpp.lsp "PPSP Contribution Feed" "Alternative" "Integration"
        pmfd = mmp.ppsp -> mmp.msp "PPSP Media File Delivery" "Alternative" "Integration"
        pdfptsX = rsp.soun -> bms.pira "Pre-TX data from Pirate to Soundmouse" "Automate, SFTP" "Integration"
        prte = rsp.come -> fsp.ebs "Producer Reporting to EBS" "Automate" "Integration,Corporate Integration,Impact"
        proebs = fsp.ebs -> rsp.come "Producer Reporting to Oracle eBusiness Suite " "Alternative" "Integration,Corporate Integration,Impact"
        pptpfesdi = bms.ppp -> csp.pcc "Producers Portal to Pirate for Ed Spec Diversity info" "Mule" "Integration"
        pasmcmcfstp = rsp.soun -> bms.pira "Programme and social media clip music cuesheets from Soundmouse to Pirate" "Automate, SFTP" "Integration"
        ppi = fsp.ebs -> bms.pira "programme Payments Interface" "Alternative" "Integration"
        pctm = sp.mod -> bms.pcX "Promo Create To Movida" "Mule" "Integration"
        pctp = bms.pira -> bms.pcX "Promo Create To Pirate" "Mule" "Integration"
        potp = bms.pira -> mp.po "Promo Optimiser to Pirate" "Mule" "Integration"
        rtata4 = lpp.lsp -> vsp.c4sl "Real Time As-Run to ALL 4" "Alternative" "Integration,Streaming Transformation Program,Impact"
        rdfpfcf = bms.pira -> rsp.pris "Recoupment/Advances data from Programme Finance Committee form" "Alternative" "Integration"
        rad = csp.pcc -> rsp.pap "Repeat agreement data" "Alternative" "Integration"
        rtc7t = rmp.prms -> bms.c7t "Rights to C4 7A Titles" "Alternative" "Integration"
        rswe = bms.pc -> rsp.prrs "Royalty Statement (welcome Email)" "Alternative" "Integration"
        scfmd = fsp.ebs -> cp.sc "Sales CRM to Finance ERP - Customer Master Data" "Mule" "Integration"
        scfic = fsp.ebs -> cp.sc "Sales CRM to Finance ERP - Invoice Creation" "Mule" "Integration"
        se = rsp.come -> rsp.pap "Sales Entry" "Alternative" "Integration"
        str = lpp.lsp -> bms.pira "SSAPI to RTAR" "Mule" "Integration"
        sdfp = rsp.prrs -> fsp.bsw "Statement data (for pre-approved PO's)" "Alternative" "Integration"
        sbttefud = cp.stel -> dap.edw "Stellar BARB & TAM to EDW for universe data" "Alternative" "Integration"
        scpddtefcm = cp.stel -> dap.edw "Stellar CB & PIB delivery data to EDW for Campaign Month" "Alternative" "Integration"
        scdta = cp.ap -> dap.edw "Stellar commercial data to Agencies" "Mule" "Integration"
        scdta2 = cp.ap -> cp.stel "Stellar commercial data to Agencies" "Mule" "Integration"
        sstefsed = cp.stel -> dap.edw "Stellar Snapshots to EDW for Scheduled Episode data" "Alternative" "Integration"
        stapkfpd = cp.ap -> cp.stel "Stellar to Agency Portal &  K2 for programme data" "Mule" "Integration"
        stapfcap = cp.ap -> cp.stel "Stellar to Agency Portal for CB and PIB" "Alternative" "Integration"
        strebs = fsp.ebs -> cp.stel "Stellar to EBS for Sales Orders & New Customers" "Alternative" "Integration"
        ste-cpadpagl = cp.stel -> dap.edw "Stellar to EDW - Campaign Position and Deal Position at Group Level" "Alternative" "Integration"
        ste-dtbuipcr = cp.stel -> dap.edw "Stellar to EDW - Data to be used in PIB & CB reporting" "Alternative" "Integration"
        ste-pbpgd = cp.stel -> dap.edw "Stellar to EDW - Processes Base Price Group data" "Alternative" "Integration"
        ste-rsrvpt = cp.stel -> dap.edw "Stellar to EDW - ROI Sponsorship Revenue values per transmission" "Alternative" "Integration"
        ste-scd = cp.stel -> dap.edw "Stellar to EDW - Sponsorship campaign data" "Alternative" "Integration"
        stefahil = cp.stel -> dap.edw "Stellar to EDW for Ad Hoc Inventory Loads" "Alternative" "Integration"
        stefcm = cp.stel -> dap.edw "Stellar to EDW for Campaign Month" "Alternative" "Integration"
        steficd = cp.stel -> dap.edw "Stellar to EDW for Industry Channel data" "Alternative" "Integration"
        steflcdiabas = cp.stel -> dap.edw "Stellar to EDW for Linear Campaign Data, including Agreements, Breaks and Spots" "Alternative" "Integration"
        stefocd = cp.stel -> dap.edw "Stellar to EDW for Online Campaign Data" "Alternative" "Integration"
        stefpcd = cp.stel -> dap.edw "Stellar to EDW for Promo Campaign data" "Alternative" "Integration"
        stefrsd = cp.stel -> dap.edw "Stellar to EDW for Revenue Set data" "Alternative" "Integration"
        stefrcocs = cp.stel -> dap.edw "Stellar to EDW for ROI calculation on Channel sets" "Alternative" "Integration"
        stffabdac = cp.fsh -> cp.stel "Stellar to Freewheel for Agencies, Brand, Deals and Campaigns" "Mule" "Integration"
        stnabfptsl = dap.barb -> cp.stel "Stellar to NIELSEN and BARB for post transmission Spot Log" "SFTP" "Integration"
        stof2 = cp.stel -> fsp.ebs "Stellar to Oracle Financials about Agency financial exposure" "Alternative" "Integration"
        stof1 = cp.stel -> fsp.ebs "Stellar to Oracle Financials on Credit Policy" "Alternative" "Integration"
        stof = cp.stel -> fsp.ebs "Stellar to Oracle Financials on invoicing" "Alternative" "Integration"
        stpmfspf = mmp.msp -> cp.stel "Stellar to Peach Media for Spot Plus files" "Mule" "Integration"
        stpfcbpi = sp.ppps -> cp.stel "Stellar to Pirate for Commercial break pattern information" "Alternative" "Integration"
        stpfccr = cp.stel -> sp.ppps "Stellar to Pirate for Commercial Copy Registrations" "SFTP" "Integration"
        stpfcp = sp.pitts -> cp.stel "Stellar to Pirate for commercial playlist" "SFTP" "Integration"
        stpfppi = cp.stel -> sp.ppps "Stellar to Pirate for Product placement indicator" "Alternative" "Integration"
        stpfpc = cp.stel -> sp.ppps "Stellar to Pirate for Promotional Campaigns" "Alternative" "Integration"
        stpfpcr = cp.stel -> sp.ppps "Stellar to Pirate for Promotions Copy Registrations" "Alternative" "Integration"
        stpfsc = cp.stel -> sp.ppps "Stellar to Pirate for Sponsorship Campaign" "Alternative" "Integration"
        stpfscoc = cp.stel -> sp.ppps "Stellar to Pirate for Sponsorship Clocknumbers or Copy" "Alternative" "Integration"
        stpfse = cp.stel -> sp.ppps "Stellar to Pirate for Sponsorship Events" "Alternative" "Integration"
        stpfsefp = cp.stel -> sp.ppps "Stellar to Pirate for Sponsorship Events for Partners" "SFTP" "Integration"
        stpftp = cp.stel -> sp.ppps "Stellar to Pirate for Trail patterns" "Alternative" "Integration"
        stufac = mmp.msp -> cp.stel "Stellar to UKTV for Ad Certification" "SFTP" "Integration"
        stufccr = mmp.msp -> cp.stel "Stellar to UKTV for Commercial Copy Registrations" "SFTP" "Integration"
        scte = vsp.c4sl -> dap.edw "Streaming Consent to EDW" "Alternative" "Integration,Streaming Transformation Program,Impact"
        sbde = fsp.ebs -> rsp.pap "Supplier Bank Details Exist" "Automate" "Integration,Corporate Integration,Impact"
        sffpte = rsp.prrs -> dap.edw "Supplier fields from Pirate to EDW" "Alternative" "Integration"
        supinf = fsp.ebs -> rsp.pris "Supplier Information" "Alternative" "Integration,Corporate Integration,Impact"
        suprec = fsp.ebs -> rsp.pap "Supplier Records" "Alternative" "Integration,Corporate Integration,Impact"
        ttbster = rsp.ted -> dap.edw "Ted tables batch synchronisation to EDW Redshift" "Alternative" "Integration"
        ttn = rsp.soun -> bms.pira "Ted to Neo" "Automate, SFTP" "Integration"
        tts = rsp.soun -> bms.pira "Ted to Silvermouse" "Automate, SFTP" "Integration"
        ttc-r = vsp.thin -> vsp.c4sl "ThinkAnalytics to C4S - Recommendation" "Alternative" "Integration,Streaming Transformation Program,Impact"
        tsfptb = dap.barb -> sp.pass "TX Schedule from PIRATE to BARB" "Alternative" "Integration"
        vptc = bms.osp -> vsp.c4sl "Video Pipeline to C4S" "Alternative" "Integration,Streaming Transformation Program,Impact"
        vtcs = mmp.msp -> bms.ppc "VisionCloud to Compliance Service" "Mule" "Integration"
        vvd = dap.edw -> rsp.prrs "VOD Views Data" "Alternative" "Integration"
        waadte = dap.wa -> dap.edw "Web Analytics (AA) data to EDW" "Alternative" "Integration,Streaming Transformation Program,Impact"
        wdsbi = fsp.wda -> fsp.ebs "Workday Adaptive to SplashBI (Oracle eBS Schema)" "Mule" "Integration"
        wdsbi2 = fsp.wda -> fsp.sbi "Workday Adaptive to SplashBI (Oracle eBS Schema)" "Mule" "Integration"
        ytf = vsp.yosp -> cp.fsh "YoSpace to Freewheel" "Alternative" "Integration,Streaming Transformation Program,Impact"
        
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

        systemLandscape c4_landscape "Landscape diagram of all platforms and users" {
            include *
            
        }

    }
}