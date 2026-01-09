workspace "Channel 4 Core" "Enterprise Systems - Generated from LeanIX" {

    !identifiers hierarchical

    model {
    
        archetypes {
            application = container
        }
        
        /* ============================================================
           ORGANISATIONS / TEAMS (from LeanIX UserGroups)
           ============================================================ */
        
        cse = person "Client Sales & Engagement" "" {
            tags "team"
        }
        part = person "Partnerships" "" {
            tags "team"
        }
        so = person "Sales Operations" "Sales Operations handle the content supply chain for commercial content and plan placements withi..." {
            tags "businessUnit,Impact,Data Clean Room"
            perspectives {
                "Data Clean Room" "Data Clean Room"
            }
        }
        agen = person "Agency" "" {
            tags "customer"
        }
        bt = person "Broadcast Technology" "" {
            tags "team,Impact,Playout Next Gen"
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        av = person "AV" "" {
            tags "businessUnit"
        }
        at = person "Ad Tech" "" {
            tags "team"
        }
        camp = person "Campaign" "" {
            tags "team"
        }
        traf = person "Traffic" "" {
            tags "team"
        }
        trad = person "Trading" "" {
            tags "team"
        }
        paas = person "Presentation and Access Services" "" {
            tags "team"
        }
        cf = person "Content Finance" "" {
            tags "team"
        }
        comm = person "Communications" "" {
            tags "team"
        }
        aiX = person "Audience Integration" "" {
            tags "team"
        }
        clac = person "Corporate Legal and Compliance" "Sub-team of Commercial Affairs that handle legal and compliance for all our content. Assigning ce..." {
            tags "team"
        }
        cd = person "Content Delivery" "" {
            tags "team"
        }
        4stu = person "4Studio" "" {
            tags "businessUnit"
        }
        prod = person "Product" "" {
            tags "businessUnit"
        }
        pp = person "Partner Platform" "User group to describe partner platforms such as DUK, Youview or Sky"
        pi = person "Programme Information" "Programme Information provide distinctive, top quality, informative copy with the relevant tone o..." {
            tags "team"
        }
        co = person "Commissioning Office" "" {
            tags "team"
        }
        prodX = person "Producer" ""
        ca = person "Commercial Affairs" "The commercial affairs teams handle entitlements and agreements, including rights) with out conte..." {
            tags "businessUnit"
        }
        cspX = person "Content Strategy & Planning" "The Content Strategy team plans exhibition windows for our content on linear and non-linear using..." {
            tags "team"
        }
        yad = person "Youth and Digital" "" {
            tags "team"
        }
        cm = person "Content Management" "Technical and business team that handle content media supply chain." {
            tags "businessUnit"
        }
        ccf = person "Finance" "" {
            tags "businessUnit,Impact,Corporate Integration,Transactional Reporting Solution"
            perspectives {
                "Corporate Integration" "Corporate Integration"
                "Transactional Reporting Solution" "Transactional Reporting Solution"
            }
        }
        sci = person "Strategy & Consumer Insight" "" {
            tags "businessUnit"
        }
        mark = person "Marketing" "" {
            tags "team"
        }
        inno = person "Innovation" "" {
            tags "businessUnit"
        }
        daf = person "Daytime and Features" "" {
            tags "team"
        }
        dram = person "Drama" "" {
            tags "team"
        }
        fact = person "Factual" "" {
            tags "team"
        }
        fe = person "Factual Entertainment" "" {
            tags "team"
        }
        ncas = person "News, Current Affairs & Sport" "" {
            tags "team"
        }
        f4 = person "Film 4" "" {
            tags "businessUnit"
        }
        ba = person "Business Affairs" "" {
            tags "team"
        }
        come = person "Comedy" "" {
            tags "team"
        }
        coX = person "Commissioning Operations" "" {
            tags "team"
        }
        ente = person "Entertainment" "" {
            tags "team"
        }
        dd = person "Duty Desk" "Team that handles live content operations for our linear channels." {
            tags "team,Impact,Playout Next Gen"
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
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
        pf = person "Production Finance" "" {
            tags "team"
        }
        paa = person "Programmatic and Audience" "" {
            tags "team"
        }
        ds = person "Data Science" "" {
            tags "team"
        }
        ar = person "Audience Research" "" {
            tags "team"
        }
        digi = person "Digital" "" {
            tags "team"
        }
        dm = person "Digital Marketing" "" {
            tags "team"
        }
        tech = person "Technology" "" {
            tags "businessUnit"
        }
        insi = person "Insights" "" {
            tags "team,Impact"
        }
        tat = person "Tax and Treasury" "Manages tax compliance and planning while also overseeing cash flow, funding, liquidity, and fina..." {
            tags "team"
        }
        c4 = person "Channel 4" "" {
            tags "legalEntity,Impact"
        }
        ccfrss = person "Shared Services" "Team responsible for any financial transactional incoming and outgoing payment processing. Typica..." {
            tags "team,Impact"
        }
        cpX = person "Consumer Product" "" {
            tags "team"
        }
        dmp = person "Digital Marketing (Product)" "" {
            tags "team"
        }
        cc = person "Content & Commissioning" "" {
            tags "businessUnit"
        }
        er = person "Employee Relations" "Advise on policies, resolve employee issues and managing performance." {
            tags "team"
        }
        corp = person "Corporate" "" {
            tags "businessUnit"
        }
        ct = person "Corporate Technology" "" {
            tags "team"
        }
        lad = person "Learning and Development" "" {
            tags "team"
        }
        proc = person "Procurement" "" {
            tags "team"
        }
        clg = person "Corporate Legal & Governance" "" {
            tags "team"
        }
        view = person "Viewer" "" {
            tags "customer"
        }
        a4e = person "All 4 Editorial" "" {
            tags "team"
        }
        gs = person "Growth (Subscriptions)" "" {
            tags "team,Impact"
        }
        fm = person "Facilities Management" "" {
            tags "team"
        }

        /* ============================================================
           COMMERCIAL PLATFORM
           ============================================================ */

        cp = softwareSystem "Commercial Platform" "Platform from LeanIX" {
            tags "Impact,Streaming Transformation Program,Corporate Integration,Interstellar"
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
                "Corporate Integration" "Corporate Integration"
                "Interstellar" "Interstellar"
            }

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
                tags "Impact,Streaming Transformation Program"
                perspectives {
                    "Streaming Transformation Program" "Streaming Transformation Program"
                }
            }
            inno = container "Innovid" "Innovid is the only independent omni-channel advertising and analytics platform built for televis..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/1b3451df-a733-4e19-aff5-55c7edd0af8f
            }
            sc = container "Sales CRM" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/9bb0f6c7-7a03-4b4a-8fa9-9473fe15754f
            }
            stel = container "Stellar" "Channel4's Sales Order Processing System" "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/36680d73-914e-4f57-a8f3-bffe87a2d6c1
                tags "SSO,Impact,Corporate Integration,Interstellar"
                perspectives {
                    "Corporate Integration" "Corporate Integration"
                    "Interstellar" "Interstellar"
                }
            }
        }

        /* ============================================================
           CONTENT MANAGEMENT PLATFORM
           ============================================================ */

        bms = softwareSystem "Content Management Platform" "The applications and components that support the media management and linear scheduling for our l..." {
            tags "Impact,Playout Next Gen,Streaming Transformation Program,New VoD Management System,Flexible Series,Post VMS Business Initiatives,Corporate Integration,Promo Campaign Management"
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
                "Streaming Transformation Program" "Streaming Transformation Program"
                "New VoD Management System" "New VoD Management System"
                "Flexible Series" "Flexible Series"
                "Post VMS Business Initiatives" "Post VMS Business Initiatives"
                "Corporate Integration" "Corporate Integration"
                "Promo Campaign Management" "Promo Campaign Management"
            }

            asp = container "Access Service Provider" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/22db32c5-d118-4633-955e-9fdd07ab0b90
                tags "Impact,Playout Next Gen"
                perspectives {
                    "Playout Next Gen" "Playout Next Gen"
                }
            }
            acf = container "Acquired Cash Forecast" "For the management of cashflow for acquired content, this is all captured on a spreadsheet called..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/5b00cefe-c009-4684-a0f7-c699be221bd0
            }
            bynd = container "Bynder" "Bynder is an AI-powered, SaaS DAM solution that allows brands to easily create, find and use thei..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3c1fa911-1501-4541-afe7-96465ec458f9
                tags "SSO,Impact,Streaming Transformation Program"
                perspectives {
                    "Streaming Transformation Program" "Streaming Transformation Program"
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
                tags "Impact,New VoD Management System,Flexible Series,Post VMS Business Initiatives,Streaming Transformation Program"
                perspectives {
                    "New VoD Management System" "New VoD Management System"
                    "Flexible Series" "Flexible Series"
                    "Post VMS Business Initiatives" "Post VMS Business Initiatives"
                    "Streaming Transformation Program" "Streaming Transformation Program"
                }
            }
            olss = container "OFCOM Licensing Services-Online Services-MIDCOM" "This is the OFCOM platform used by our Access Services team to upload of our reporting to OFCOM." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/01a05cf6-e094-4bf2-bd13-310fc50da22b
            }
            osp = container "OnLine Service Provider" "Provides capabilities for ingest, transformation, transcoding, encryption and delivery of VOD; li..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bbaf9554-9a19-44f9-83fb-f6ce638e4210
                tags "SSO,Impact,Playout Next Gen,Streaming Transformation Program"
                perspectives {
                    "Playout Next Gen" "Playout Next Gen"
                    "Streaming Transformation Program" "Streaming Transformation Program"
                }
            }
            ol = container "Order list" "Setting a budget and its' allocations genres & channels. Existing commitments also captured. Targ..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/378e341d-08ed-428d-a1ef-0a4bf9853e4e
            }
            pira = container "Pirate" "Pirate is a collection of applications used by various departments. Commercial affairs (business ..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/f694fb3d-6a3b-4776-a5d8-21d9b500714c
                tags "Impact,Corporate Integration"
                perspectives {
                    "Corporate Integration" "Corporate Integration"
                }
            }
            p4ws = container "4Producers (Web Site)" "eCommissioning system. Allows C4 to engage with Production companies for Production companies to ..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/8d36fa1b-3ca6-46a5-bb77-a01cbd833667
            }
            pass = container "Advance Scheduling System" "The Advanced Scheduling System (A55) provides a view of a schedule for a specific channel and dat..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/af539ba8-e622-46fc-b561-347dad93d8b6
                tags "Impact"
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
                tags "Impact,Playout Next Gen"
                perspectives {
                    "Playout Next Gen" "Playout Next Gen"
                }
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
                tags "Impact,Promo Campaign Management"
                perspectives {
                    "Promo Campaign Management" "Promo Campaign Management"
                }
            }
            ppps-p = container "Presentation Planning System - PPS.NET" "This is the .NET version of PPS NOTE: We need to create all VOD processes and link one to this ap..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bac64e3f-59aa-433b-b1ba-7f2253bc10df
                tags "Impact,Promo Campaign Management"
                perspectives {
                    "Promo Campaign Management" "Promo Campaign Management"
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
                tags "Impact,Playout Next Gen"
                perspectives {
                    "Playout Next Gen" "Playout Next Gen"
                }
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
                tags "SSO"
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
            tags "Impact,Commissioning CRM"
            perspectives {
                "Commissioning CRM" "Commissioning CRM"
            }

            crmc = container "Customer Relationship Manager  (Content)" "A system used by the commissioning dept to track and manage programme ideas from pitch to greenlight" "paas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c7839d32-16d4-4a70-9ac4-1a630b764db8
                tags "Impact,Commissioning CRM"
                perspectives {
                    "Commissioning CRM" "Commissioning CRM"
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
                tags "Impact,Commissioning CRM"
                perspectives {
                    "Commissioning CRM" "Commissioning CRM"
                }
            }
            pp = container "Programmes" "" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/4adea0a1-d059-4edd-a2c3-90c1d67a10ed
            }
            ppX = container "Purchases" "" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/4535195e-870f-435c-96a4-fa0851828338
                tags "Impact,Commissioning CRM"
                perspectives {
                    "Commissioning CRM" "Commissioning CRM"
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
            tags "Impact,Data Clean Room,Streaming Transformation Program"
            perspectives {
                "Data Clean Room" "Data Clean Room"
                "Streaming Transformation Program" "Streaming Transformation Program"
            }

            as = container "Audience Segmentation" "Enables publishers and broadcasters to grow and retain audiences and increase monetisation for a ..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/36eea142-a4fc-4ffe-91a4-540ae18fa7a2
                tags "Impact,Data Clean Room"
                perspectives {
                    "Data Clean Room" "Data Clean Room"
                }
            }
            barb = container "BARB" "Founded by the major organisations in the UK television and advertising industry, BARB is respons..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b5c70e83-8d2a-495a-b772-c87690818d0e
            }
            bor = container "Business Objects Reporting" "This application represents all Business Object reports generated by BI team and are read by busi..." "hybrid" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/2d7b6726-96b6-4e97-819f-a865e8128e02
            }
            c4 = container "Core 4" "https://www.core4.channel4.com/hub Core4 is Channel 4's quantitative insight community, made up o..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/6cdb9763-d3c4-4fbd-8391-8fa6edb3c69b
            }
            dcri = container "Data Clean Room (InfoSum)" "A data platform with a vision to connect the world’s data without ever sharing it – by developing..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ee4c816e-16c8-489a-8844-baa0658a73b5
                tags "Impact,Data Clean Room"
                perspectives {
                    "Data Clean Room" "Data Clean Room"
                }
            }
            dcrs = container "Data Clean Room (Snowflake)" "A data platform with a vision to connect the world’s data without ever sharing it – by developing..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/682f5257-1497-4ac7-ad12-34150a67f521
                tags "SSO,Impact,Data Clean Room"
                perspectives {
                    "Data Clean Room" "Data Clean Room"
                }
            }
            dla = container "Data Lakehouse Azure" "For our Data Lakehouse implementation we use Data Fabric as an innovative approach designed to si..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/fd1625b8-a9b8-4df4-a364-d4c0792ca019
                tags "SSO"
            }
            dwa = container "Data Warehouse AWS" "Data Warehouse application used as a host of analytics data in a star schema or a columnar databa..." "hybrid" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/22cf94d3-ac4a-40b9-b29a-09fb2307799e
                tags "Impact,Data Clean Room,Streaming Transformation Program"
                perspectives {
                    "Data Clean Room" "Data Clean Room"
                    "Streaming Transformation Program" "Streaming Transformation Program"
                }
            }
            tabl = container "Tableau" "Tableau is a data visualization tool used in the Business Intelligence Industry. It helps in simp..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bcb4c0dc-cb38-4f70-9451-53443456ed8c
                tags "SSO"
            }
            wa = container "Web Analytics" "Web Analytics software used by M&VE for All 4 & Online Services Adobe Analytics is the solution f..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/f7a463e8-edb4-45d6-ad21-e2922b6305a7
                tags "Impact"
            }
        }

        /* ============================================================
           FINANCE SYSTEMS PLATFORM
           ============================================================ */

        fsp = softwareSystem "Finance Systems Platform" "The finance platform comprises a suite of integrated systems and applications designed to support..." {
            tags "Impact,Corporate Integration,Benefex Replacement,Transactional Reporting Solution"
            perspectives {
                "Corporate Integration" "Corporate Integration"
                "Benefex Replacement" "Benefex Replacement"
                "Transactional Reporting Solution" "Transactional Reporting Solution"
            }

            atax = container "Alphatax" "Corporation tax compliance software, providing complete control over the preparation and manageme..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/2193988a-9e4b-473c-8ccc-af480c3b0b6f
            }
            bbp = container "Barclays Banking Portal" "Barclays Online platform used to transact FX deals. File Gateway is a host to host connectivity p..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/985ef4c4-7c99-4eb1-a932-c373354efa1c
            }
            bdn = container "Barclays.Net" "Barclays service used to download statements." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c0756e2e-be6f-4529-8838-1bc4303dcb8e
                tags "Impact,Corporate Integration"
                perspectives {
                    "Corporate Integration" "Corporate Integration"
                }
            }
            bsw = container "Basware" "Enterprise software for financial processes, purchase to pay and financial management. Manage Inv..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/61ea2036-2682-4999-8a2b-b56a8ff60aa8
                tags "SSO,Impact,Corporate Integration"
                perspectives {
                    "Corporate Integration" "Corporate Integration"
                }
            }
            cmx = container "Cachematrix" "SaaS solution for cash management" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/fc6097df-f78d-4d74-b8af-6e668de1f3bb
            }
            ebs = container "E-Business Suite" "Channel4 Oracle E-business Suite application used in Finance department for Accounts, Cash and As..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/34852185-2e79-424a-8735-f586ca0bc6eb
                tags "SSO,Impact,Benefex Replacement,Corporate Integration"
                perspectives {
                    "Benefex Replacement" "Benefex Replacement"
                    "Corporate Integration" "Corporate Integration"
                }
            }
            faf = container "Finance Approval Form" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/331e92eb-60c0-424c-9c5c-8ed4a63e27b9
                tags "Impact"
            }
            msc = container "Mastercard" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/919c5f9f-50b8-4f2a-9b26-9b9a15797da8
                tags "Impact,Corporate Integration"
                perspectives {
                    "Corporate Integration" "Corporate Integration"
                }
            }
            odf = container "Oracle eBS Excel data files" "These are a collection of manually generated .xslx files out of Oracle e-Business that contain va..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/f0563f84-f115-450b-be67-db6c545c38b5
            }
            pjc = container "Project Codes" "App used to generate project codes which are used in Oracle and across Channel 4." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/94d329fc-0d88-431b-b78b-1fe85a9cbd14
                tags "Impact"
            }
            sov = container "Sovos" "Sovos helps in digital transformation of tax, with complete, connected offerings for tax determin..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/c917188e-f35e-4320-a0b8-d387d6863b62
                tags "Impact"
            }
            sbi = container "SplashBI" "SplashBI is an all-in-one framework for visualising, reporting and analysing data." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/618820c7-1747-4388-a9aa-cfef9e9369c0
                tags "SSO,Impact,Transactional Reporting Solution"
                perspectives {
                    "Transactional Reporting Solution" "Transactional Reporting Solution"
                }
            }
            tgn = container "Tungsten Network" "Tungsten provide a multiple distribution channel service to a single stream invoice feed." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/199f7f15-06dd-460e-90c5-7d6231f348f3
            }
            wda = container "Workday Adaptive" "Workday Adaptive is Channel 4 Finance's Planning and Consolidation tool" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/4855f235-d3b0-41d0-b983-9265f83b840c
                tags "SSO,Impact"
            }
        }

        /* ============================================================
           LINEAR PLAYOUT PLATFORM
           ============================================================ */

        lpp = softwareSystem "Linear Playout Platform" "Platform from LeanIX" {
            tags "Impact,Playout Next Gen"
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }

            lsp = container "Linear Service Provider" "" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/487b00a3-39f7-4095-bdbb-526af136a1a8
                tags "Impact,Playout Next Gen"
                perspectives {
                    "Playout Next Gen" "Playout Next Gen"
                }
            }
            pitts = container "Interface To Transmission Systems" "ITS prepares final schedules for Playout systems. It uses Programme schedules generated from PPS ..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ad4ff429-b9c4-4d11-9b78-e5935f33e664
                tags "Impact,Playout Next Gen"
                perspectives {
                    "Playout Next Gen" "Playout Next Gen"
                }
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
            tags "Impact,Promo Campaign Management,Streaming Transformation Program,Playout Next Gen"
            perspectives {
                "Promo Campaign Management" "Promo Campaign Management"
                "Streaming Transformation Program" "Streaming Transformation Program"
                "Playout Next Gen" "Playout Next Gen"
            }

            awar = container "Awards" "Awards is a repository of all awards won by Channel 4 or where Channel 4 has been nominated. Plat..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/97c919e2-8156-4df7-a5a8-afde3cd0325d
                tags "SSO"
            }
            msp = container "Media Service Provider" "Service provider for Digital Asset Management System" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b245220d-2a8d-4630-a3f5-e33f1a3c2354
                tags "Impact,Promo Campaign Management,Streaming Transformation Program"
                perspectives {
                    "Promo Campaign Management" "Promo Campaign Management"
                    "Streaming Transformation Program" "Streaming Transformation Program"
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
                tags "Impact,Playout Next Gen"
                perspectives {
                    "Playout Next Gen" "Playout Next Gen"
                }
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

        psp = softwareSystem "People Systems Platform" "The people system platform integrates a range of applications and services to manage the full emp..." {
            tags "Impact,Benefex Replacement,FES Replacement"
            perspectives {
                "Benefex Replacement" "Benefex Replacement"
                "FES Replacement" "FES Replacement"
            }

            4peo = container "4People" "4People is a cloud HR and people system that empowers mid-size organisations to effectively respo..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3db00200-a028-4cb8-baeb-a3f88d1dd6e9
                tags "SSO,Impact,Benefex Replacement"
                perspectives {
                    "Benefex Replacement" "Benefex Replacement"
                }
            }
            acti = container "ActivPay" "Actvipay is Channel 4's 3rd party payroll provider." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/cdaf03e9-7bde-49b0-bfae-ecb69af5dc27
                tags "SSO"
            }
            ac = container "Alert Cascade" "Crisis event mass communication tool" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b6bf1946-3623-41a6-9a3f-36bc6e1fc4a5
            }
            bp = container "Benefits Portal" "" "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ec56cea3-8d33-40bc-a695-805e21c0cbf0
                tags "SSO,Impact,Benefex Replacement"
                perspectives {
                    "Benefex Replacement" "Benefex Replacement"
                }
            }
            er = container "Executive Reporting" "Bespoke set of reports created in Power BI and served for the purpose of business reporting for t..." "paas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3ec6dffe-bb2b-49d6-8631-8b7b5191e4f3
            }
            fes = container "Freelancer Engagement System" "HR system to request freelancers and bring them onboard. Freelancers submit timesheets via FES. O..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/3debbdaf-b375-475b-a9ad-aaffeff1396a
                tags "Impact,FES Replacement"
                perspectives {
                    "FES Replacement" "FES Replacement"
                }
            }
            ll = container "LinkedIn Learning" "LinkedIn Learning offers video courses taught by industry experts in software, creative, and busi..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/9cd4b77f-8517-478b-b25b-6592a04d157b
                tags "SSO"
            }
            popp = container "Poppulo" "Internal communications Internal Communication, newsletter system. Used by internal comms. Integr..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/59812f2b-1d87-466b-816a-8feb530a4de3
                tags "SSO"
            }
            tlh = container "The Learning Hive" "Cornerstone is a cloud-based learning and talent management solutions platform." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ec47ad40-b9d6-4af1-a100-27beef4495e7
                tags "SSO"
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
            tags "Impact,Corporate Integration"
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }

            come = container "COMET" "Channel 4 International and National Rights Licencing Software used by Channel 4 to manage Films ..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/438491d8-6ce7-4d3a-b2c4-5aaf31fef29f
                tags "Impact,Corporate Integration"
                perspectives {
                    "Corporate Integration" "Corporate Integration"
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
                tags "Impact,Corporate Integration"
                perspectives {
                    "Corporate Integration" "Corporate Integration"
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
            tags "Impact,New VoD Management System,Flexible Series,Post VMS Business Initiatives,Streaming Transformation Program,Playout Next Gen,Promo Campaign Management"
            perspectives {
                "New VoD Management System" "New VoD Management System"
                "Flexible Series" "Flexible Series"
                "Post VMS Business Initiatives" "Post VMS Business Initiatives"
                "Streaming Transformation Program" "Streaming Transformation Program"
                "Playout Next Gen" "Playout Next Gen"
                "Promo Campaign Management" "Promo Campaign Management"
            }

            mod = container "MediaGenix On Demand" "BeBanjo Movida VOD Management system (Comprising of systems which schedule and manage transcode a..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/7bec9ebd-87c8-4ed0-bfe2-1ea5429eeabc
                tags "Impact,New VoD Management System,Flexible Series,Post VMS Business Initiatives,Streaming Transformation Program"
                perspectives {
                    "New VoD Management System" "New VoD Management System"
                    "Flexible Series" "Flexible Series"
                    "Post VMS Business Initiatives" "Post VMS Business Initiatives"
                    "Streaming Transformation Program" "Streaming Transformation Program"
                }
            }
            pass = container "Advance Scheduling System" "The Advanced Scheduling System (A55) provides a view of a schedule for a specific channel and dat..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/af539ba8-e622-46fc-b561-347dad93d8b6
                tags "Impact"
            }
            pepl = container "Electronic Press Listing" "Sends Electronic Programme Guide to other platforms Carries Rights information such as restart" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/7f92cb3b-40c6-41f8-9bb0-93bb43df94ff
            }
            pitts = container "Interface To Transmission Systems" "ITS prepares final schedules for Playout systems. It uses Programme schedules generated from PPS ..." "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/ad4ff429-b9c4-4d11-9b78-e5935f33e664
                tags "Impact,Playout Next Gen"
                perspectives {
                    "Playout Next Gen" "Playout Next Gen"
                }
            }
            ppps = container "Presentation Planning System" "Manages the detailed channel schedules with all the relevant transmission content required for br..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b2da1e23-df98-4af4-9c2a-904814ab181c
                tags "Impact,Promo Campaign Management"
                perspectives {
                    "Promo Campaign Management" "Promo Campaign Management"
                }
            }
            ppps-p = container "Presentation Planning System - PPS.NET" "This is the .NET version of PPS NOTE: We need to create all VOD processes and link one to this ap..." "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bac64e3f-59aa-433b-b1ba-7f2253bc10df
                tags "Impact,Promo Campaign Management"
                perspectives {
                    "Promo Campaign Management" "Promo Campaign Management"
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
            tags "Impact,Playout Next Gen,Flexible Series,Post VMS Business Initiatives,Streaming Transformation Program"
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
                "Flexible Series" "Flexible Series"
                "Post VMS Business Initiatives" "Post VMS Business Initiatives"
                "Streaming Transformation Program" "Streaming Transformation Program"
            }

            c4sl = container "Channel 4 Streaming (Legacy)" "Video on Demand platform across many devices including https://channel4.com" "iaas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/aa9fdfc2-1884-4181-b102-1579838e10ac
                tags "Impact,Playout Next Gen,Flexible Series,Post VMS Business Initiatives,Streaming Transformation Program"
                perspectives {
                    "Playout Next Gen" "Playout Next Gen"
                    "Flexible Series" "Flexible Series"
                    "Post VMS Business Initiatives" "Post VMS Business Initiatives"
                    "Streaming Transformation Program" "Streaming Transformation Program"
                }
            }
            cdna = container "Content Distribution Network (Accenture)" "Logical representation of the CDN's used by Channel 4 Streaming, controlled and maintained by Acc..." "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/40f4d195-24e9-4e3a-83c9-704bb3cc44ab
                tags "Impact,Streaming Transformation Program"
                perspectives {
                    "Streaming Transformation Program" "Streaming Transformation Program"
                }
            }
            free = container "Freely" "" "" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/35279c23-7ea7-45cb-b766-493f9e89b6e8
                tags "Impact,Streaming Transformation Program"
                perspectives {
                    "Streaming Transformation Program" "Streaming Transformation Program"
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
                tags "Impact,Streaming Transformation Program"
                perspectives {
                    "Streaming Transformation Program" "Streaming Transformation Program"
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
                tags "Impact,Streaming Transformation Program"
                perspectives {
                    "Streaming Transformation Program" "Streaming Transformation Program"
                }
            }
            yosp = container "YoSpace" "Dynamic Ad Insertion (replacement of linear ads) on live streams to our owned and operated stream..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/46c41f3f-30df-44f4-851b-33b583f9cf40
                tags "Impact,Streaming Transformation Program"
                perspectives {
                    "Streaming Transformation Program" "Streaming Transformation Program"
                }
            }
        }

        /* ============================================================
           WORKSPACE SYSTEMS PLATFORM
           ============================================================ */

        wsp = softwareSystem "Workspace Systems Platform" "The facilities management platform provides integrated solutions for managing physical workspaces..." {
            ac = container "Alert Cascade" "Crisis event mass communication tool" "desktopOrLaptop" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/b6bf1946-3623-41a6-9a3f-36bc6e1fc4a5
            }
            ce = container "Concept Evolution" "FM Job sheets for building maintenance used by Facilities & Workspace" "onPremise" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/cb1d3418-dabb-4165-9ef2-f1be0f380139
            }
            egen = container "Egencia" "Egencia is a SaaS platform developed by Amex GBT that offers corporate travel management solution..." "saas" {
                url https://channel4.leanix.net/Channel4Prod/factsheet/Application/bc12be35-05c9-4add-9535-ded814046530
                tags "SSO"
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

        cseToAp = cse -> cp.ap "Uses" ""
        partToAp = part -> cp.ap "Uses" ""
        soToAp = so -> cp.ap "Uses" "" "owner"
        agenToAp = agen -> cp.ap "Uses" ""
        btToCari = bt -> cp.cari "Uses" "" "owner"
        agenToCari = agen -> cp.cari "Uses" ""
        soToCc = so -> cp.cc "Uses" ""
        soToFsh = so -> cp.fsh "Uses" ""
        soToInno = so -> cp.inno "Uses" ""
        avToSc = av -> cp.sc "AV = Audio Visual" ""
        soToSc = so -> cp.sc "Uses" ""
        atToSc = at -> cp.sc "Uses" ""
        cseToStel = cse -> cp.stel "Uses" ""
        partToStel = part -> cp.stel "Uses" ""
        soToStel = so -> cp.stel "Uses" ""
        campToStel = camp -> cp.stel "Uses" ""
        trafToStel = traf -> cp.stel "Uses" ""
        tradToStel = trad -> cp.stel "Uses" ""
        paasToAsp = paas -> bms.asp "Uses" ""
        cfToAcf = cf -> bms.acf "Uses" "" "owner"
        commToBynd = comm -> bms.bynd "Uses" ""
        aiXToBynd = aiX -> bms.bynd "Uses" ""
        partToC7t = part -> bms.c7t "Uses" "" "owner"
        clacToC7t = clac -> bms.c7t "Uses" ""
        cdToC7t = cd -> bms.c7t "Uses" ""
        4stuToC7t = 4stu -> bms.c7t "Uses" ""
        prodToC7t = prod -> bms.c7t "Uses" ""
        paasToDasdpwpswra = paas -> bms.dasdpwpswra "Uses" "" "owner"
        ppToEt = pp -> bms.et "Uses" ""
        ppToGrac = pp -> bms.grac "Uses" "" "owner"
        piToMod = pi -> bms.mod "Uses" "" "owner"
        paasToOlss = paas -> bms.olss "Uses" ""
        piToOsp = pi -> bms.osp "Uses" ""
        btToOsp = bt -> bms.osp "Uses" "" "Impact,owner,Playout Next Gen" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        cfToOl = cf -> bms.ol "Uses" "" "owner"
        coToP4ws = co -> bms.p4ws "Uses" "" "owner"
        prodXToP4ws = prodX -> bms.p4ws "Uses" ""
        soToPass = so -> bms.pass "Uses" ""
        tradToPass = trad -> bms.pass "Uses" ""
        caToPass = ca -> bms.pass "Uses" ""
        cspXToPass = cspX -> bms.pass "Uses" "" "owner"
        yadToPass = yad -> bms.pass "Uses" ""
        cmToPass = cm -> bms.pass "Uses" ""
        ccfToPass = ccf -> bms.pass "Uses" ""
        sciToPass = sci -> bms.pass "Uses" ""
        markToPass = mark -> bms.pass "Uses" ""
        prodToPass = prod -> bms.pass "Uses" ""
        caToPbm = ca -> bms.pbm "Uses" ""
        ccfToPbm = ccf -> bms.pbm "Uses" ""
        cfToPbm = cf -> bms.pbm "Uses" "" "owner"
        innoToPc = inno -> bms.pc "Uses" ""
        caToPc = ca -> bms.pc "Uses" ""
        cspXToPc = cspX -> bms.pc "Uses" ""
        dafToPc = daf -> bms.pc "Uses" ""
        dramToPc = dram -> bms.pc "Uses" ""
        factToPc = fact -> bms.pc "Uses" ""
        feToPc = fe -> bms.pc "Uses" ""
        ncasToPc = ncas -> bms.pc "Uses" ""
        yadToPc = yad -> bms.pc "Uses" ""
        cmToPc = cm -> bms.pc "Uses" ""
        ccfToPc = ccf -> bms.pc "Uses" ""
        cfToPc = cf -> bms.pc "Uses" "" "owner"
        sciToPc = sci -> bms.pc "Uses" ""
        f4ToPc = f4 -> bms.pc "Uses" ""
        4stuToPc = 4stu -> bms.pc "Uses" ""
        markToPc = mark -> bms.pc "Uses" ""
        prodToPc = prod -> bms.pc "Uses" ""
        innoToPcgs = inno -> bms.pcgs "Uses" ""
        soToPcgs = so -> bms.pcgs "Uses" ""
        caToPcgs = ca -> bms.pcgs "Uses" ""
        dramToPcgs = dram -> bms.pcgs "Uses" ""
        ncasToPcgs = ncas -> bms.pcgs "Uses" ""
        cmToPcgs = cm -> bms.pcgs "Uses" ""
        piToPcgs = pi -> bms.pcgs "Uses" ""
        sciToPcgs = sci -> bms.pcgs "Uses" ""
        4stuToPcgs = 4stu -> bms.pcgs "Uses" ""
        commToPcgs = comm -> bms.pcgs "Uses" ""
        markToPcgs = mark -> bms.pcgs "Uses" ""
        prodToPcgs = prod -> bms.pcgs "Uses" ""
        innoToPcps = inno -> bms.pcps "Uses" ""
        soToPcps = so -> bms.pcps "Uses" ""
        caToPcps = ca -> bms.pcps "Uses" ""
        cspXToPcps = cspX -> bms.pcps "Uses" ""
        dramToPcps = dram -> bms.pcps "Uses" ""
        cmToPcps = cm -> bms.pcps "Uses" ""
        piToPcps = pi -> bms.pcps "Uses" ""
        prodToPcps = prod -> bms.pcps "Uses" ""
        baToPdaprs = ba -> bms.pdaprs "Uses" "" "owner"
        soToPfas = so -> bms.pfas "Uses" ""
        caToPfas = ca -> bms.pfas "Uses" ""
        cspXToPfas = cspX -> bms.pfas "Uses" "" "owner"
        ccfToPfas = ccf -> bms.pfas "Uses" ""
        sciToPfas = sci -> bms.pfas "Uses" ""
        innoToPge = inno -> bms.pge "Uses" ""
        soToPge = so -> bms.pge "Uses" ""
        tradToPge = trad -> bms.pge "Uses" ""
        caToPge = ca -> bms.pge "Uses" ""
        comeToPge = come -> bms.pge "Uses" ""
        coToPge = co -> bms.pge "Uses" ""
        coXToPge = coX -> bms.pge "Uses" ""
        cspXToPge = cspX -> bms.pge "Uses" ""
        dafToPge = daf -> bms.pge "Uses" ""
        dramToPge = dram -> bms.pge "Uses" ""
        enteToPge = ente -> bms.pge "Uses" ""
        factToPge = fact -> bms.pge "Uses" ""
        feToPge = fe -> bms.pge "Uses" ""
        ncasToPge = ncas -> bms.pge "Uses" ""
        yadToPge = yad -> bms.pge "Uses" ""
        cmToPge = cm -> bms.pge "Uses" ""
        cdToPge = cd -> bms.pge "Uses" ""
        ddToPge = dd -> bms.pge "Uses" ""
        paasToPge = paas -> bms.pge "Uses" ""
        piToPge = pi -> bms.pge "Not all information is available and needs to be obtained from other sources. Clunky" ""
        ccfToPge = ccf -> bms.pge "Uses" ""
        peopToPge = peop -> bms.pge "Uses" ""
        sciToPge = sci -> bms.pge "Uses" ""
        f4ToPge = f4 -> bms.pge "Uses" ""
        mveToPge = mve -> bms.pge "Uses" ""
        4creToPge = 4cre -> bms.pge "Uses" ""
        4stuToPge = 4stu -> bms.pge "Uses" ""
        commToPge = comm -> bms.pge "Uses" ""
        markToPge = mark -> bms.pge "Uses" ""
        prodToPge = prod -> bms.pge "Uses" ""
        yadToPip = yad -> bms.pip "Uses" ""
        cmToPip = cm -> bms.pip "Uses" ""
        ccfToPip = ccf -> bms.pip "Uses" ""
        cfToPip = cf -> bms.pip "Uses" "" "owner"
        markToPip = mark -> bms.pip "Uses" ""
        prodToPip = prod -> bms.pip "Uses" ""
        piToPitts = pi -> bms.pitts "Uses" ""
        soToPmam = so -> bms.pmam "Uses" ""
        cmToPmam = cm -> bms.pmam "Uses" ""
        ccfToPmam = ccf -> bms.pmam "Uses" ""
        cfToPmam = cf -> bms.pmam "Uses" "" "owner"
        soToPmm = so -> bms.pmm "Uses" ""
        caToPmm = ca -> bms.pmm "Uses" ""
        cspXToPmm = cspX -> bms.pmm "Uses" ""
        factToPmm = fact -> bms.pmm "Uses" ""
        ncasToPmm = ncas -> bms.pmm "Uses" ""
        yadToPmm = yad -> bms.pmm "Uses" ""
        cmToPmm = cm -> bms.pmm "Uses" ""
        cdToPmm = cd -> bms.pmm "Uses" ""
        4creToPmm = 4cre -> bms.pmm "Uses" ""
        markToPmm = mark -> bms.pmm "Uses" ""
        soToPofg = so -> bms.pofg "Uses" ""
        cmToPofg = cm -> bms.pofg "Uses" ""
        ccfToPofg = ccf -> bms.pofg "Uses" ""
        cfToPofg = cf -> bms.pofg "Uses" "" "owner"
        soToPpps = so -> bms.ppps "Uses" ""
        caToPpps = ca -> bms.ppps "Uses" ""
        cspXToPpps = cspX -> bms.ppps "Uses" ""
        feToPpps = fe -> bms.ppps "Uses" ""
        cmToPpps = cm -> bms.ppps "Uses" ""
        paasToPpps = paas -> bms.ppps "Uses" "" "owner"
        sciToPpps = sci -> bms.ppps "Uses" ""
        4creToPpps = 4cre -> bms.ppps "Uses" ""
        4stuToPpps = 4stu -> bms.ppps "Uses" ""
        markToPpps = mark -> bms.ppps "Uses" ""
        prodToPpps = prod -> bms.ppps "Uses" ""
        innoToPpps-p = inno -> bms.ppps-p "Uses" ""
        soToPpps-p = so -> bms.ppps-p "Uses" ""
        caToPpps-p = ca -> bms.ppps-p "Uses" ""
        cspXToPpps-p = cspX -> bms.ppps-p "Uses" "" "owner"
        factToPpps-p = fact -> bms.ppps-p "Uses" ""
        feToPpps-p = fe -> bms.ppps-p "Uses" ""
        cmToPpps-p = cm -> bms.ppps-p "Uses" ""
        ccfToPpps-p = ccf -> bms.ppps-p "Uses" ""
        4creToPpps-p = 4cre -> bms.ppps-p "Uses" ""
        markToPpps-p = mark -> bms.ppps-p "Uses" ""
        caToPpp = ca -> bms.ppp "Uses" ""
        comeToPpp = come -> bms.ppp "Uses" ""
        cspXToPpp = cspX -> bms.ppp "Uses" "" "owner"
        dafToPpp = daf -> bms.ppp "Uses" ""
        dramToPpp = dram -> bms.ppp "Uses" ""
        enteToPpp = ente -> bms.ppp "Uses" ""
        factToPpp = fact -> bms.ppp "Uses" ""
        feToPpp = fe -> bms.ppp "Uses" ""
        ncasToPpp = ncas -> bms.ppp "Uses" ""
        yadToPpp = yad -> bms.ppp "Uses" ""
        cmToPpp = cm -> bms.ppp "Uses" ""
        ccfToPpp = ccf -> bms.ppp "Uses" ""
        sciToPpp = sci -> bms.ppp "Uses" ""
        f4ToPpp = f4 -> bms.ppp "Uses" ""
        4creToPpp = 4cre -> bms.ppp "Uses" ""
        markToPpp = mark -> bms.ppp "Uses" ""
        prodXToPpp = prodX -> bms.ppp "Uses" ""
        soToPpc = so -> bms.ppc "Uses" ""
        caToPpc = ca -> bms.ppc "Uses" ""
        clacToPpc = clac -> bms.ppc "Uses" "" "owner"
        cspXToPpc = cspX -> bms.ppc "Uses" ""
        dafToPpc = daf -> bms.ppc "Uses" ""
        dramToPpc = dram -> bms.ppc "Uses" ""
        factToPpc = fact -> bms.ppc "Uses" ""
        feToPpc = fe -> bms.ppc "Uses" ""
        ncasToPpc = ncas -> bms.ppc "Uses" ""
        yadToPpc = yad -> bms.ppc "Uses" ""
        cmToPpc = cm -> bms.ppc "Uses" ""
        sciToPpc = sci -> bms.ppc "Uses" ""
        4creToPpc = 4cre -> bms.ppc "Uses" ""
        markToPpc = mark -> bms.ppc "Uses" ""
        piToPrta2 = pi -> bms.prta2 "Uses" ""
        ccfToPswo = ccf -> bms.pswo "Uses" ""
        cfToPswo = cf -> bms.pswo "Uses" ""
        cmToPsfv = cm -> bms.psfv "Uses" ""
        piToPsfv = pi -> bms.psfv "Uses" ""
        4stuToPsfv = 4stu -> bms.psfv "Uses" ""
        piToPtis = pi -> bms.ptis "Uses" ""
        commXToPvb = commX -> bms.pvb "Uses" ""
        clacToPvb = clac -> bms.pvb "Uses" ""
        cmToPvb = cm -> bms.pvb "Uses" ""
        ddToPvb = dd -> bms.pvb "Uses" ""
        piToPvb = pi -> bms.pvb "Uses" ""
        innoToPve = inno -> bms.pve "Uses" ""
        soToPve = so -> bms.pve "Uses" ""
        caToPve = ca -> bms.pve "Uses" ""
        cspXToPve = cspX -> bms.pve "Uses" ""
        feToPve = fe -> bms.pve "Uses" ""
        cmToPve = cm -> bms.pve "Uses" ""
        piToPve = pi -> bms.pve "Uses" ""
        sciToPve = sci -> bms.pve "Uses" ""
        markToPve = mark -> bms.pve "Uses" ""
        prodToPve = prod -> bms.pve "Uses" ""
        innoToPvmsv = inno -> bms.pvmsv "Uses" ""
        caToPvmsv = ca -> bms.pvmsv "Uses" ""
        cspXToPvmsv = cspX -> bms.pvmsv "Uses" ""
        cmToPvmsv = cm -> bms.pvmsv "Uses" ""
        piToPvma = pi -> bms.pvma "Uses" ""
        cfToSoun = cf -> bms.soun "Uses" ""
        paasToSsfatwswra = paas -> bms.ssfatwswra "Uses" ""
        piToTb = pi -> bms.tb "Uses" ""
        prodXToDist = prodX -> csp.dist "Uses" ""
        caToPasc = ca -> csp.pasc "Uses" ""
        pfToPasc = pf -> csp.pasc "Uses" "" "owner"
        cspXToPasc = cspX -> csp.pasc "Uses" ""
        ccfToPasc = ccf -> csp.pasc "Uses" ""
        soToPcf = so -> csp.pcf "Uses" ""
        caToPcf = ca -> csp.pcf "Uses" ""
        yadToPcf = yad -> csp.pcf "Uses" ""
        cmToPcf = cm -> csp.pcf "Uses" ""
        ccfToPcf = ccf -> csp.pcf "Uses" ""
        cfToPcf = cf -> csp.pcf "Uses" "" "owner"
        innoToPcc = inno -> csp.pcc "Uses" ""
        soToPcc = so -> csp.pcc "Uses" ""
        caToPcc = ca -> csp.pcc "Uses" ""
        comeToPcc = come -> csp.pcc "Uses" ""
        coToPcc = co -> csp.pcc "Uses" "" "owner"
        cspXToPcc = cspX -> csp.pcc "Uses" ""
        dafToPcc = daf -> csp.pcc "Uses" ""
        dramToPcc = dram -> csp.pcc "Uses" ""
        enteToPcc = ente -> csp.pcc "Uses" ""
        factToPcc = fact -> csp.pcc "Uses" ""
        feToPcc = fe -> csp.pcc "Uses" ""
        ncasToPcc = ncas -> csp.pcc "Uses" ""
        yadToPcc = yad -> csp.pcc "Uses" ""
        cmToPcc = cm -> csp.pcc "Uses" ""
        ccfToPcc = ccf -> csp.pcc "Uses" ""
        sciToPcc = sci -> csp.pcc "Uses" ""
        f4ToPcc = f4 -> csp.pcc "Uses" ""
        4creToPcc = 4cre -> csp.pcc "Uses" ""
        markToPcc = mark -> csp.pcc "Uses" ""
        prodXToPcc = prodX -> csp.pcc "Uses" ""
        innoToPp = inno -> csp.pp "Uses" ""
        soToPp = so -> csp.pp "Uses" ""
        caToPp = ca -> csp.pp "Uses" ""
        cspXToPp = cspX -> csp.pp "Uses" ""
        dafToPp = daf -> csp.pp "Uses" ""
        dramToPp = dram -> csp.pp "Uses" ""
        factToPp = fact -> csp.pp "Uses" ""
        feToPp = fe -> csp.pp "Uses" ""
        ncasToPp = ncas -> csp.pp "Uses" ""
        yadToPp = yad -> csp.pp "Uses" ""
        cmToPp = cm -> csp.pp "Uses" ""
        piToPp = pi -> csp.pp "Uses" ""
        ccfToPp = ccf -> csp.pp "Uses" ""
        f4ToPp = f4 -> csp.pp "Uses" ""
        commToPp = comm -> csp.pp "Uses" ""
        caToPpX = ca -> csp.ppX "Uses" ""
        cspXToPpX = cspX -> csp.ppX "Uses" ""
        dafToPpX = daf -> csp.ppX "Uses" ""
        piToPpX = pi -> csp.ppX "Uses" ""
        ccfToPpX = ccf -> csp.ppX "Uses" ""
        paaToAs = paa -> dap.as "Uses" ""
        soToBarb = so -> dap.barb "Uses" ""
        dsToBarb = ds -> dap.barb "Uses" ""
        cseToBor = cse -> dap.bor "Uses" ""
        partToBor = part -> dap.bor "Uses" ""
        soToBor = so -> dap.bor "Uses" ""
        tradToBor = trad -> dap.bor "Uses" ""
        arToC4 = ar -> dap.c4 "Uses" ""
        soToDcri = so -> dap.dcri "Uses" "" "Impact,Data Clean Room" {
            perspectives {
                "Data Clean Room" "Data Clean Room"
            }
        }
        digiToDcrs = digi -> dap.dcrs "Uses" "" "owner"
        aiXToDcrs = aiX -> dap.dcrs "C4 Audience Team and Marketing team use the Data Clean Room solution for creating overlapping aud..." ""
        dmToDcrs = dm -> dap.dcrs "Uses" ""
        soToDla = so -> dap.dla "Uses" ""
        atToDla = at -> dap.dla "Uses" ""
        arToDwa = ar -> dap.dwa "Uses" ""
        dsToDwa = ds -> dap.dwa "Uses" ""
        techToDwa = tech -> dap.dwa "Uses" ""
        insiToTabl = insi -> dap.tabl "Uses" "" "owner"
        insiToWa = insi -> dap.wa "Uses" ""
        ccfToAtax = ccf -> fsp.atax "Uses" ""
        tatToAtax = tat -> fsp.atax "Manage corporation tax" "" "owner"
        ccfToBbp = ccf -> fsp.bbp "Uses" ""
        tatToBbp = tat -> fsp.bbp "Corporate banking" ""
        c4ToBsw = c4 -> fsp.bsw "Raise and approve POs" ""
        ccfToBsw = ccf -> fsp.bsw "Uses" "" "Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        ccfrssToBsw = ccfrss -> fsp.bsw "Uses" "" "owner"
        tatToCmx = tat -> fsp.cmx "Cashflow management" "" "owner"
        ccfToEbs = ccf -> fsp.ebs "Uses" "" "Impact,owner,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        ccfrssToEbs = ccfrss -> fsp.ebs "Uses" ""
        tatToEbs = tat -> fsp.ebs "Tax data downloads and reporting" ""
        c4ToFaf = c4 -> fsp.faf "Uses" ""
        ccfToMsc = ccf -> fsp.msc "Uses" "" "Impact,owner,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        ccfToSov = ccf -> fsp.sov "Uses" "" "owner"
        tatToSov = tat -> fsp.sov "Submit digital tax" "" "owner"
        ccfToSbi = ccf -> fsp.sbi "Uses" "" "Impact,Transactional Reporting Solution" {
            perspectives {
                "Transactional Reporting Solution" "Transactional Reporting Solution"
            }
        }
        ccfrssToSbi = ccfrss -> fsp.sbi "AP/AR reporting." ""
        tatToSbi = tat -> fsp.sbi "Tax reporting" ""
        ccfrssToTgn = ccfrss -> fsp.tgn "Managed agency invoicing." ""
        ccfToWda = ccf -> fsp.wda "Uses" ""
        ddToLsp = dd -> lpp.lsp "Uses" "" "Impact,Playout Next Gen" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        piToLsp = pi -> lpp.lsp "Uses" ""
        btToLsp = bt -> lpp.lsp "Uses" "" "Impact,Playout Next Gen" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        dmToBraz = dm -> mp.braz "Uses" ""
        cpXToMpar = cpX -> mp.mpar "Uses" "" "owner"
        dmpToMpar = dmp -> mp.mpar "Uses" ""
        cspXToAwar = cspX -> mmp.awar "Uses" ""
        trafToMsp = traf -> mmp.msp "Uses" ""
        ccToMsp = cc -> mmp.msp "Uses" ""
        cmToMsp = cm -> mmp.msp "Uses" ""
        paasToMsp = paas -> mmp.msp "Uses" ""
        btToMsp = bt -> mmp.msp "Uses" "" "owner"
        4creToMsp = 4cre -> mmp.msp "Uses" ""
        prodXToMsp = prodX -> mmp.msp "Uses" ""
        clacToPpsp = clac -> mmp.ppsp "Uses" ""
        btToPpsp = bt -> mmp.ppsp "Uses" "" "Impact,Playout Next Gen" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        4creToPpsp = 4cre -> mmp.ppsp "Uses" ""
        c4To4peo = c4 -> psp.4peo "Uses" ""
        peopTo4peo = peop -> psp.4peo "Uses" "" "owner"
        erTo4peo = er -> psp.4peo "Uses" ""
        c4ToActi = c4 -> psp.acti "Uses" ""
        peopToActi = peop -> psp.acti "Uses" "" "owner"
        corpToAc = corp -> psp.ac "Uses" ""
        c4ToBp = c4 -> psp.bp "Uses" ""
        erToBp = er -> psp.bp "Uses" "" "owner"
        ctToEr = ct -> psp.er "Uses" ""
        c4ToFes = c4 -> psp.fes "Uses" ""
        tatToFes = tat -> psp.fes "Manage tax responsibilities for Freelancers." ""
        peopToFes = peop -> psp.fes "Uses" "" "owner"
        c4ToLl = c4 -> psp.ll "Uses" ""
        ladToLl = lad -> psp.ll "Uses" "" "owner"
        peopToPopp = peop -> psp.popp "Uses" "" "owner"
        c4ToTlh = c4 -> psp.tlh "Uses" ""
        ladToTlh = lad -> psp.tlh "Uses" "" "owner"
        soToPrms = so -> rmp.prms "Uses" ""
        caToPrms = ca -> rmp.prms "Uses" ""
        cspXToPrms = cspX -> rmp.prms "Uses" ""
        dramToPrms = dram -> rmp.prms "Uses" ""
        cmToPrms = cm -> rmp.prms "Uses" ""
        piToPrms = pi -> rmp.prms "Uses" ""
        ccfToPrms = ccf -> rmp.prms "Uses" ""
        4stuToPrms = 4stu -> rmp.prms "Uses" ""
        markToPrms = mark -> rmp.prms "Uses" ""
        caToRc = ca -> rmp.rc "Uses" ""
        partToCome = part -> rsp.come "Uses" ""
        caToCome = ca -> rsp.come "Uses" "" "owner"
        piToCome = pi -> rsp.come "Uses" ""
        ccfrssToCome = ccfrss -> rsp.come "Uses" ""
        caToEps = ca -> rsp.eps "Uses" "" "owner"
        caToNeo = ca -> rsp.neo "Uses" "" "owner"
        soToPap = so -> rsp.pap "Uses" ""
        caToPap = ca -> rsp.pap "Uses" ""
        ccfToPap = ccf -> rsp.pap "Uses" "" "Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        sciToPap = sci -> rsp.pap "Uses" ""
        caToPris = ca -> rsp.pris "Uses" ""
        piToPris = pi -> rsp.pris "Uses" ""
        ccfToPris = ccf -> rsp.pris "Uses" ""
        4stuToPris = 4stu -> rsp.pris "Uses" ""
        caToPrrs = ca -> rsp.prrs "Uses" ""
        ccfToPrrs = ccf -> rsp.prrs "Uses" ""
        caToSd = ca -> rsp.sd "Uses" "" "owner"
        4stuToTed = 4stu -> rsp.ted "Uses" ""
        cspXToPepl = cspX -> sp.pepl "Uses" ""
        yadToPepl = yad -> sp.pepl "Uses" ""
        cmToPepl = cm -> sp.pepl "Uses" ""
        piToPepl = pi -> sp.pepl "Uses" "" "owner"
        commToPepl = comm -> sp.pepl "Uses" ""
        clacToAnda = clac -> sbs.anda "Uses" ""
        piToAnda = pi -> sbs.anda "Clunky and difficult to use." ""
        procToCms = proc -> sbs.cms "Uses" ""
        clgToFa = clg -> sbs.fa "Uses" "" "owner"
        techToTime = tech -> sbs.time "Uses" "" "owner"
        viewToC4sl = view -> vsp.c4sl "Uses" ""
        a4eToPipe = a4e -> vsp.pipe "Uses" ""
        gsToSm = gs -> vsp.sm "Uses" ""
        techToSl = tech -> vsp.sl "Uses" "" "owner"
        piToTr = pi -> vsp.tr "Uses" ""
        cpXToThin = cpX -> vsp.thin "Uses" "" "owner"
        fmToCe = fm -> wsp.ce "Uses" ""
        c4ToEgen = c4 -> wsp.egen "Uses" ""
        ccfToEgen = ccf -> wsp.egen "Uses" "" "owner"

        /* ============================================================
           APPLICATION -> APPLICATION RELATIONSHIPS (from LeanIX Interfaces)
           ============================================================ */
        
        4ta = psp.acti -> psp.4peo "4People to ActivePay" "Incoming - Mule" "Integration"
        4tac = psp.4peo -> wsp.ac "4People to Alert cascade" "Outgoing - Mule" "Integration"
        4tb = wsp.ac -> psp.4peo "4People to Benefits" "Incoming - Mule" "Integration,Impact,Benefex Replacement" {
            perspectives {
                "Benefex Replacement" "Benefex Replacement"
            }
        }
        4tce = psp.4peo -> wsp.ce "4People to Concept Evolution" "Outgoing - Mule" "Integration"
        4tcms = psp.4peo -> sbs.cms "4People to Contract Management System(CMS)" "Outgoing - Mule" "Integration"
        4tc = psp.4peo -> psp.tlh "4People to Cornerstone" "Outgoing - Mule" "Integration"
        4te = psp.4peo -> wsp.egen "4People to Egencia" "Outgoing - Mule" "Integration"
        4toe = psp.4peo -> fsp.ebs "4People to Oracle EBS" "Outgoing - Mule" "Integration"
        4tp = psp.4peo -> fsp.wda "4People to Planning" "Incoming - Mule" "Integration"
        4tpX = psp.4peo -> psp.popp "4People to Poppulo" "Outgoing - Mule" "Integration"
        atsfasdf = sp.pass -> cp.stel "A55 to Stellar for Advanced Schedule data flow" "Outgoing - SFTP" "Integration"
        aptf = psp.acti -> fsp.wda "Active Pay to Financial Planning" "Incoming - Mule" "Integration"
        atoe = psp.acti -> fsp.ebs "ActivPay to Oracle EBS" "Outgoing - Mule" "Integration"
        asstc = vsp.yosp -> vsp.c4sl "DIRECTION NOT SET - Ad Serving System to C4S" "XXXX - Alternative" "Integration,Impact,Streaming Transformation Program,Direction not set" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        aate = dap.wa -> dap.dwa "Adobe Analytics to EDW" "Outgoing - Alternative" "Integration"
        apffpfb = bms.pbm -> cp.ap "Agency Portal fetch from Pirate for Brand" "Incoming - Mule" "Integration"
        apffsfp = cp.ap -> cp.stel "Agency Portal fetch from Stellar for Programme" "Outgoing - Mule" "Integration"
        apfsfpyot = cp.stel -> cp.ap "Agency Portal from Stellar for Pick Your Own transmission" "Incoming - Mule" "Integration"
        ai = rsp.prrs -> csp.pcc "Agreement Information" "Incoming - Alternative" "Integration"
        ap = rsp.sd -> rsp.pap "Artist payments" "Outgoing - Automate" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        adaa = bms.asp -> mmp.msp "DIRECTION NOT SET - ASP Delivery Acknowledgment API" "XXXX - Alternative" "Integration,Direction not set"
        alsstl = lpp.lsp -> bms.asp "DIRECTION NOT SET - ASP live subtitle streams to LSP" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        allsfl = bms.asp -> lpp.lsp "DIRECTION NOT SET - ASP low latency stream from LSP" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        apja = bms.asp -> mmp.msp "DIRECTION NOT SET - ASP Production Job API" "XXXX - Alternative" "Integration,Direction not set"
        apjsa = mmp.msp -> bms.asp "DIRECTION NOT SET - ASP Production Job Status API" "XXXX - Alternative" "Integration,Direction not set"
        asfp = bms.asp -> bms.pira "DIRECTION NOT SET - ASP Schedule from Pirate" "XXXX - Alternative" "Integration,Direction not set"
        assmfd = bms.asp -> mmp.msp "DIRECTION NOT SET - ASP Signer Source Media File Delivery" "XXXX - Alternative" "Integration,Direction not set"
        avcmfd = bms.asp -> mmp.msp "DIRECTION NOT SET - ASP Viewing Copy Media File Delivery" "XXXX - Alternative" "Integration,Direction not set"
        asaltf = dap.as -> cp.fsh "Audience Segments and Lookalikes to Freewheel" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        bwpfo = fsp.ebs -> fsp.bbp "BACS & Wire Payments File Out" "Outgoing - Automate" "Integration"
        brdte = dap.barb -> dap.dwa "BARB ratings data to EDW" "Outgoing - SFTP" "Integration"
        btsfau = dap.barb -> cp.stel "BARB to Stellar for Audience Universe" "Outgoing - SFTP" "Integration"
        btsfi = dap.barb -> cp.stel "BARB to Stellar for Impacts" "Outgoing - SFTP" "Integration"
        bpsri = fsp.bbp -> fsp.ebs "DIRECTION NOT SET - Barclay Payment Statement Receipt In" "XXXX - Automate" "Integration,Impact,Corporate Integration,Direction not set" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bsi = fsp.bbp -> fsp.ebs "DIRECTION NOT SET - Barclay Statement In" "XXXX - Automate" "Integration,Impact,Corporate Integration,Direction not set" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bbdc = fsp.bsw -> fsp.ebs "Basware Business Department Codes" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bcer = fsp.bsw -> fsp.ebs "Basware Currency Exchange Rates" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bglcvr = fsp.bsw -> fsp.ebs "Basware GL Cross Validation Rules" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bglnc = fsp.bsw -> fsp.ebs "Basware GL Nominal Codes" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bic = fsp.bsw -> fsp.ebs "Basware Individual Codes" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bis = fsp.ebs -> fsp.bsw "Basware Invoice Statuses" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bpvpci = fsp.bsw -> fsp.ebs "Basware Payments/Void Payments/Cancelled Invoices" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bpcc = fsp.bsw -> fsp.ebs "Basware Pirate Code Combinations" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bprodc = fsp.bsw -> fsp.ebs "Basware Product Codes" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bprojc = fsp.bsw -> fsp.ebs "Basware Project Codes" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bws = fsp.bsw -> fsp.ebs "Basware Suppliers" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        b2ebs = fsp.bsw -> fsp.ebs "Basware to EBS for Approved Invoices" "Outgoing - Automate" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        b2sbi = fsp.bsw -> fsp.ebs "Basware to SplashBI (Oracle eBS Schema)" "Outgoing - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        b2sbi2 = fsp.bsw -> fsp.sbi "Basware to SplashBI (Oracle eBS Schema)" "Outgoing - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bur = fsp.bsw -> fsp.ebs "Basware User Rights" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        buriu = fsp.bsw -> fsp.ebs "Basware User Rights (Inactive users)" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        bta = psp.bp -> psp.acti "Benefits to Actvipay" "Incoming - Alternative" "Integration,Impact,Benefex Replacement" {
            perspectives {
                "Benefex Replacement" "Benefex Replacement"
            }
        }
        bdte = cp.stel -> dap.dwa "Budget data to EDW" "Outgoing - Alternative" "Integration"
        btmii = sp.mod -> bms.bynd "DIRECTION NOT SET - Bynder to MediaGenix Image Integration" "XXXX - Alternative" "Integration,Impact,Streaming Transformation Program,Direction not set" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        btmitc = sp.mod -> bms.bynd "DIRECTION NOT SET - Bynder to MediaGenix Image Tagging Changes" "XXXX - Alternative" "Integration,Impact,Streaming Transformation Program,Direction not set" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        chptpr = dap.dla -> psp.er "C4 HR & Payroll to PowerBI Reporting" "Incoming - Mule" "Integration"
        4io = fsp.ebs -> rsp.come "C4 intl overages" "XXXX - SFTP" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        cptyfa = cp.stel -> vsp.yosp "C4 Promo to YoSpace for Advertisements" "Incoming - Mule" "Integration"
        4vatr = fsp.sov -> fsp.ebs "C4 VAT Returns" "Outgoing - Alternative" "Integration"
        cbsdte = vsp.sm -> dap.dwa "C4S Braintree Subscriber data to EDW" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        cetf = sp.pepl -> vsp.free "C4S EPG to Freely" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        cete = vsp.mpar -> dap.dwa "C4S Events to EDW" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        cfvetba = vsp.free -> vsp.ova "C4S Freely Video Events to BitMovin Analytics" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        cfvsfc = vsp.cdna -> vsp.free "C4S Freely Video Stream from CDN" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        cmifc = vsp.cdna -> sp.mod "C4S MoD Images from CDN" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        cqte = vsp.ova -> dap.dwa "C4S QoS to EDW" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        csty = vsp.yosp -> bms.osp "DIRECTION NOT SET - C4S Streams to YoSpace" "XXXX - Alternative" "Integration,Impact,Streaming Transformation Program,Direction not set" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ctaa = vsp.c4sl -> dap.wa "C4S to Adobe Analytics" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ctb = dap.barb -> vsp.c4sl "DIRECTION NOT SET - C4S to BARB" "XXXX - Alternative" "Integration,Impact,Streaming Transformation Program,Direction not set" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ctc7t = vsp.c4sl -> bms.c7t "C4S to C4 7A Titles" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ctlvs = lpp.lsp -> vsp.c4sl "DIRECTION NOT SET - C4S to Licence Validation Service" "XXXX - Alternative" "Integration,Impact,Streaming Transformation Program,Direction not set" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ctsma = vsp.c4sl -> vsp.sm "C4S to Subscription Management (Aptitude)" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ctt-ue = vsp.c4sl -> vsp.thin "C4S to ThinkAnalytics - User Events" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ctetaa = vsp.mpar -> dap.wa "C4S Tracking Events to Adobe Analytics" "Incoming - Alternative" "Integration"
        ctetm = vsp.c4sl -> vsp.mpar "C4S Tracking Events to mParticle" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        cvmtf = sp.mod -> vsp.free "C4S VoD Metadata to Freely" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        c4st = mp.po -> mp.po "DIRECTION NOT SET - C4STELLARPROMO" "XXXX - Alternative" "Integration,Direction not set"
        c4st2 = mp.po -> cp.stel "DIRECTION NOT SET - C4STELLARPROMO" "XXXX - Alternative" "Integration,Direction not set"
        caapfsfd = cp.stel -> cp.ap "CARIA and Agency Portal from Stellar for Deals" "Incoming - Mule" "Integration"
        cfsfcri = cp.cari -> cp.stel "CARIA from Stellar for Copy Rotation Instruction" "Outgoing - Mule" "Integration"
        ctsfcri = cp.cari -> cp.stel "CARIA to Stellar for Copy Rotation Instructions" "Outgoing - SFTP" "Integration"
        ctsfdacc = cp.cari -> cp.stel "CARIA to STELLAR for Deals and Campaign creation" "Outgoing - SFTP" "Integration"
        cro2c = rsp.come -> fsp.ebs "Cash Receipts from Oracle to Comet" "Incoming - Alternative" "Integration"
        ctt = bms.pcgs -> bms.ptis "DIRECTION NOT SET - CGS to TIS2" "XXXX - Alternative" "Integration,Direction not set"
        c4itr = mmp.msp -> mmp.pmm "DIRECTION NOT SET - Channel 4 Interstitals to RedBee" "XXXX - Mule" "Integration,Direction not set"
        c4srtb = mp.braz -> vsp.c4sl "Channel 4 Streaming Recommendations to Braze" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        c4tpt = bms.asp -> mmp.msp "Channel 4 to PFT token" "Incoming - Mule" "Integration"
        crbtas = dap.dcri -> dap.as "Clean Room (Brandm4tch) to Audience Segmentation" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        crbtas2 = dap.dcrs -> dap.as "Clean Room (Brandm4tch) to Audience Segmentation" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ctsfcci = cp.stel -> cp.fsh "Clearcast to Stellar for Copy Clearance Information" "Incoming - Mule" "Integration"
        ctf = cp.fsh -> bms.cmt "DIRECTION NOT SET - CMT to Freewheel" "XXXX - Alternative" "Integration,Direction not set"
        ctp = bms.pira -> bms.cmt "DIRECTION NOT SET - CMT to Pirate" "XXXX - Mule" "Integration,Direction not set"
        ctpc = bms.cmt -> bms.pcX "DIRECTION NOT SET - CMT to Promo Create" "XXXX - Alternative" "Integration,Direction not set"
        ctpo = mp.po -> bms.cmt "DIRECTION NOT SET - CMT to Promo Optimiser" "XXXX - Alternative" "Integration,Direction not set"
        ccii = rsp.come -> fsp.ebs "Comet C4I Invoice Interface" "Outgoing - Alternative" "Integration"
        cffli = fsp.ebs -> rsp.come "Comet FFL Invoice Interface" "Outgoing - Automate" "Integration"
        cai = rsp.pris -> bms.pira "Contract & Agreement info" "Incoming - Mule" "Integration"
        caiX = rsp.pap -> csp.pcc "Contract/Prog & Agreement info" "Incoming - Alternative" "Integration"
        cpdta = bms.pira -> sbs.anda "Contracts PAC data to Anda" "Outgoing - Alternative" "Integration"
        cctf = cp.cc -> cp.fsh "DIRECTION NOT SET - Copy Central to Freewheel" "XXXX - Alternative" "Integration,Direction not set"
        ccts = cp.cc -> cp.stel "DIRECTION NOT SET - Copy Central to Stellar" "XXXX - Alternative" "Integration,Direction not set"
        ctll = psp.tlh -> psp.ll "Cornerstone to LinkedIn Learning" "XXXX - Alternative" "Integration"
        epct = psp.fes -> fsp.ebs "EBS project codes to FES" "Outgoing - Alternative" "Integration"
        et4f = psp.4peo -> fsp.ebs "EBS to 4People for Employees" "Outgoing - Alternative" "Integration"
        ebstrd = fsp.ebs -> fsp.bsw "EBS to Basware for Reference & Transactional data" "Outgoing - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        etcf = rsp.come -> fsp.ebs "EBS to Comet for Cash Receipts" "Outgoing - SFTP" "Integration"
        ebsmc = fsp.msc -> fsp.ebs "EBS to Mastercard for Employee credit card transactions" "Outgoing - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        ebspir = fsp.ebs -> rsp.come "EBS to Pirate (Comet Flim4)" "XXXX - Automate, SFTP" "Integration"
        ebsstr = fsp.ebs -> cp.stel "EBS to Stellar Daily exchange rate (in) Invoices (out)" "XXXX - Alternative" "Integration"
        ebscex = fsp.ebs -> cp.stel "EBS to Stellar for Currency Exchange" "Outgoing - SFTP" "Integration"
        ebplan = fsp.ebs -> fsp.wda "eBusiness to Planning" "Outgoing - Mule" "Integration"
        e4ti = dap.dwa -> dap.dcri "EDW 4 to Infosum" "Incoming - Alternative" "Integration"
        emcstmdf = dap.dwa -> dap.dla "EDW Marketing Campaign Snapshots to Microsoft Data Fabric" "Incoming - Alternative" "Integration"
        emctmdf = dap.dwa -> dap.dla "EDW Marketing Campaign to Microsoft Data Fabric" "Incoming - Alternative" "Integration"
        esitb = dap.dwa -> mp.braz "EDW Streaming Identity to Braze" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        etdf-sd = dap.dla -> dap.dwa "EDW to  Data Fabric - Spots data" "Outgoing - Alternative" "Integration"
        etapsp = dap.dwa -> rsp.pap "EDW to Artist Payment Systems (Pirate)" "Outgoing - Alternative" "Integration"
        etb = mp.braz -> dap.dwa "EDW to Braze" "Outgoing - Alternative" "Integration"
        etm-ipcau = dap.dwa -> dap.as "EDW to Mediarithmics - Instream Promo Control Audience Upload" "Outgoing - Alternative" "Integration"
        etm-sud = dap.dwa -> dap.as "EDW to Mediarithmics - Streaming User Data" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ett-v = dap.dwa -> vsp.thin "EDW to ThinkAnalytics - Viewers" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        etdftp = dap.dwa -> bms.pira "EDW TX data feed to Pirate" "Outgoing - Alternative" "Integration"
        fgl = bms.pira -> fsp.ebs "Failed GL lines" "Outgoing - Alternative" "Integration"
        fvte = dap.dwa -> cp.fsh "Feewheel v4logs to EDW" "Incoming - Alternative" "Integration"
        faebs = fsp.ebs -> fsp.faf "DIRECTION NOT SET - Finance Approval to E-Business Suite" "XXXX - Alternative" "Integration,Direction not set"
        ffsffdovc = cp.fsh -> dap.dwa "Freewheel from Stellar for Forecast data of VOD Campaign" "Outgoing - Mule" "Integration"
        ffsffdovc2 = cp.fsh -> cp.stel "Freewheel from Stellar for Forecast data of VOD Campaign" "Outgoing - Mule" "Integration"
        fltmdf = cp.fsh -> dap.dla "Freewheel logs to Microsoft Data Fabric" "Outgoing - Alternative" "Integration"
        ftiecua = cp.fsh -> dap.dcri "Freewheel to Infosum (Exposed Campaign Users Attribution)" "Incoming - Alternative" "Integration"
        ftsffrdca = cp.fsh -> cp.stel "Freewheel to Stellar for Freewheel reference data changes API" "Outgoing - Alternative" "Integration"
        ftsvvfcsap = cp.fsh -> cp.stel "Freewheel to Stellar VoD Views for Commercial, Sponsorship and Promotions" "Outgoing - SFTP" "Integration"
        frtpa = bms.prta2 -> mmp.msp "From RedBee to Pirate ASRUN" "Incoming - Mule" "Integration"
        fstpfcr = cp.stel -> bms.pira "From Stellar to Pirate for Commercial Registrations" "Outgoing - Alternative" "Integration"
        idtc = bms.bynd -> vsp.c4sl "Image DAM to C4S" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        imcfstp = rsp.soun -> bms.pira "Interstial music cuesheets from Soundmouse to Pirate" "XXXX - Automate, SFTP" "Integration"
        icnf = rsp.pris -> fsp.ebs "Invoice/credit note for Royalties" "Outgoing - Automate" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        lspp = bms.pira -> vsp.c4sl "Logging Sheets & Programme Parts" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        lcflr = lpp.lsp -> mmp.ppsp "DIRECTION NOT SET - LSP Contribution Feed ( Line Record)" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        lmfd = lpp.lsp -> mmp.msp "DIRECTION NOT SET - LSP Media File Delivery" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        lm = lpp.lsp -> bms.osp "DIRECTION NOT SET - LSP Multicast" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        lsto = bms.osp -> lpp.lsp "LSP Simulcast to OSLP" "Outgoing - Alternative" "Integration,Impact,Playout Next Gen,Streaming Transformation Program" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ltpa = bms.pira -> lpp.lsp "DIRECTION NOT SET - LSP to Pirate Asruns" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        mtbb = bms.bynd -> sp.mod "DIRECTION NOT SET - MediaGenix to Bynder Brand" "XXXX - Alternative" "Integration,Direction not set"
        mtfpi = sp.mod -> cp.fsh "MediaGenix to FreeWheel Programme Info" "Incoming - Alternative" "Integration"
        mtgc4vc = bms.grac -> sp.mod "DIRECTION NOT SET - MediaGenix to Gracenote Channel 4 VoD Catalogue" "XXXX - Mule" "Integration,Direction not set"
        mtmbvsi = sp.mod -> sp.mod "DIRECTION NOT SET - MediaGenix to MediaGenix BARB VOD Schedule Integration" "XXXX - Alternative" "Integration,Direction not set"
        mtpecw = bms.pira -> sp.mod "DIRECTION NOT SET - MediaGenix to Pirate EPG Content Warnings" "XXXX - Mule" "Integration,Direction not set"
        mttc4vc = sp.mod -> vsp.thin "MediaGenix to ThinkAnalytics Channel 4 VoD Catalogue" "Incoming - Mule" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        mtbfms = dap.as -> mp.braz "Mediarithmics to Braze for Marketing Segments" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        mtffas = dap.as -> cp.fsh "Mediarithmics to Freewheel for ALA segments" "Incoming - Alternative" "Integration"
        mticga = dap.as -> dap.dcri "Mediarithmics to Infosum (Control Group attribution)" "Incoming - Alternative" "Integration"
        mvrtp = sp.mod -> mmp.msp "MoD  VoD Request to PFT" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        msdte = vsp.sm -> dap.dwa "MPP Subscriber data to EDW" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        mcra = mmp.msp -> bms.asp "DIRECTION NOT SET - MSP Content Request API" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        mcra2 = mmp.msp -> lpp.lsp "DIRECTION NOT SET - MSP Content Request API" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        mcra3 = mmp.msp -> bms.osp "DIRECTION NOT SET - MSP Content Request API" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        mcra4 = mmp.msp -> mmp.ppsp "DIRECTION NOT SET - MSP Content Request API" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        mmvfto = bms.osp -> mmp.msp "MSP Master Video Files to OLSP" "Incoming - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        mmfd-abs = mmp.msp -> csp.dist "DIRECTION NOT SET - MSP Media File Delivery - Acquired BBC Studios" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-af = mmp.msp -> csp.dist "DIRECTION NOT SET - MSP Media File Delivery - Acquired Fox/Disney" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-ag = mmp.msp -> csp.dist "DIRECTION NOT SET - MSP Media File Delivery - Acquired Generic" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-as = mmp.msp -> csp.dist "DIRECTION NOT SET - MSP Media File Delivery - Acquired Sony" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-at = mmp.msp -> csp.dist "DIRECTION NOT SET - MSP Media File Delivery - Acquired Turner" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-aw = mmp.msp -> csp.dist "DIRECTION NOT SET - MSP Media File Delivery - Acquired Warner" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-c = cp.cari -> mmp.msp "MSP Media File Delivery - Commercials" "Incoming - Alternative" "Integration"
        mmfd-c2 = cp.cc -> mmp.msp "MSP Media File Delivery - Commercials" "Incoming - Alternative" "Integration"
        mmfd-cp = mmp.msp -> csp.pc "DIRECTION NOT SET - MSP Media File Delivery - Commissioned Programmes" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-i = mmp.msp -> csp.pc "DIRECTION NOT SET - MSP Media File Delivery - Interstitials" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-lvr = mmp.msp -> lpp.lsp "DIRECTION NOT SET - MSP Media File Delivery - LSP Video Recordings" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        mmfd-lvrX = mmp.msp -> lpp.lsp "DIRECTION NOT SET - MSP Media File Delivery - LSP Voiceover Recordings" "XXXX - Alternative" "Integration,Impact,Playout Next Gen,Direction not set" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        mmfd-mmtsflft = mmp.msp -> cp.stel "MSP Media File Delivery - MB Media to Stellar for Long Form teleshopping" "Outgoing - SFTP" "Integration"
        mmfd-mv = mmp.msp -> cp.cari "DIRECTION NOT SET - MSP Media File Delivery - Music Videos" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-sad = mmp.msp -> bms.asp "DIRECTION NOT SET - MSP Media File Delivery - Subtitles & Audio Description" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-s = mmp.msp -> bms.asp "DIRECTION NOT SET - MSP Media File Delivery - Supertrusted" "XXXX - Alternative" "Integration,Direction not set"
        mmfd-s2 = mmp.msp -> mmp.ppsp "DIRECTION NOT SET - MSP Media File Delivery - Supertrusted" "XXXX - Alternative" "Integration,Direction not set"
        mpvba = mmp.msp -> mmp.pvb "DIRECTION NOT SET - MSP Pirate Video Browse API" "XXXX - Alternative" "Integration,Direction not set"
        mpvbfh = mmp.msp -> mmp.pvb "DIRECTION NOT SET - MSP Pirate Video Browse File Hosting" "XXXX - Alternative" "Integration,Direction not set"
        msfr = mmp.msp -> bms.pira "DIRECTION NOT SET - MSP Schedule File Receipt" "XXXX - Alternative" "Integration,Direction not set"
        mti = mmp.msp -> mmp.uv "DIRECTION NOT SET - MSP Tape Ingest" "XXXX - Alternative" "Integration,Direction not set"
        mtp = mmp.pmm -> mmp.msp "MSP to Pirate" "Outgoing - Mule" "Integration"
        mtrta = mmp.rta -> mmp.msp "DIRECTION NOT SET - MSP to Ready to Air" "XXXX - Alternative" "Integration,Direction not set"
        mts = rsp.soun -> mmp.msp "DIRECTION NOT SET - MSP to Soundmouse" "XXXX - Alternative" "Integration,Direction not set"
        mtc4df = mmp.msp -> bms.pira "MSPs to Channel 4 DFS folders" "Outgoing - Mule" "Integration"
        nos = rsp.prrs -> bms.pc "Name of Supplier" "Incoming - Alternative" "Integration"
        ntn = bms.pira -> rsp.pris "New transmitted notifications" "Incoming - Alternative" "Integration"
        oscn = rsp.prrs -> fsp.ebs "Oracle suppliers contact names" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        oatax = fsp.ebs -> fsp.atax "Oracle to AlphaTax" "Outgoing - Alternative" "Integration"
        otunx = fsp.ebs -> fsp.tgn "DIRECTION NOT SET - Oracle to Tungsten XML Invoice feed" "XXXX - Mule" "Integration,Direction not set"
        pfpfstp = rsp.soun -> bms.pira "PAC form PDFs from Soundmouse to Pirate" "XXXX - Automate, SFTP" "Integration"
        pfxfstp = rsp.soun -> bms.pira "PAC form XMLs from Soundmouse to Pirate" "Outgoing - Automate, SFTP" "Integration"
        pmfsfaf = cp.stel -> mmp.msp "Peach Media from Stellar for Attribution files" "Incoming - Mule" "Integration"
        patveo = bms.pira -> sp.pass "Pirate A55 to VMS (ex Optimum)" "XXXX - Mule" "Integration"
        patveo2 = bms.pira -> sp.pepl "Pirate A55 to VMS (ex Optimum)" "XXXX - Mule" "Integration"
        patveo3 = bms.pira -> bms.pvmsv "Pirate A55 to VMS (ex Optimum)" "XXXX - Mule" "Integration"
        passtc = bms.pira -> vsp.c4sl "Pirate Advance Scheduling System to C4S" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        pctc = bms.pira -> vsp.c4sl "Pirate Certification to C4S" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        pctb = bms.bynd -> bms.pcgs "DIRECTION NOT SET - Pirate CGS to Bynder" "XXXX - Mule" "Integration,Direction not set"
        pctf = cp.fsh -> bms.pcgs "Pirate CGS to Freewheel" "XXXX - Mule" "Integration"
        pctmfvo = bms.pcgs -> mmp.msp "Pirate CGS to MSP for VPS origin" "Incoming - Mule" "Integration"
        pctsfpapi = bms.pcgs -> cp.stel "Pirate CGS to Stellar for Programme and Platform information" "Outgoing - Alternative" "Integration"
        pctfX = cp.fsh -> bms.pcgs "Pirate Creatives to Freewheel" "Outgoing - Mule" "Integration"
        pffrfs = bms.pira -> bms.asp "DIRECTION NOT SET - Pirate fetch from RedBee for Subtitles" "XXXX - Mule" "Integration,Direction not set"
        pirgl = fsp.ebs -> rsp.come "Pirate GL posted Transactions" "Outgoing - Alternative" "Integration"
        pptasb = sp.ppps -> mmp.msp "Pirate PPS to AWS S3 Bucket" "Incoming - Mule" "Integration"
        ppitf = bms.pcgs -> cp.fsh "Pirate Programme Info to FreeWheel" "Incoming - Mule" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        prmstc = bms.pira -> vsp.c4sl "Pirate Rights Management System to C4S" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        prdtoe = rmp.prms -> dap.dwa "PIRATE RMS data to  Oracle EDW" "Outgoing - Alternative" "Integration"
        ptbfca = bms.pira -> sp.mod "Pirate to BeBanjo for Catalogue Assets" "Incoming - Mule" "Integration"
        ptbfca2 = csp.pp -> sp.mod "Pirate to BeBanjo for Catalogue Assets" "Incoming - Mule" "Integration"
        ptbfls = bms.pira -> sp.mod "Pirate to BeBanjo for Linear Scheduling" "Incoming - Mule" "Integration"
        ptbfls2 = sp.pass -> sp.mod "Pirate to BeBanjo for Linear Scheduling" "Incoming - Mule" "Integration"
        ptbfma = bms.pira -> sp.mod "Pirate to BeBanjo for Media Assets" "Incoming - Mule" "Integration"
        ptbfma2 = mmp.pmm -> sp.mod "Pirate to BeBanjo for Media Assets" "Incoming - Mule" "Integration"
        ptbfr = rmp.prms -> sp.mod "Pirate to BeBanjo for Rights" "Incoming - Mule" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        ptbfs = bms.pira -> sp.mod "Pirate to BeBanjo for Segment" "Incoming - Mule" "Integration"
        ptbdf = mmp.pmm -> bms.bynd "Pirate to Bynder data flow" "Outgoing - Alternative" "Integration"
        ptcpft = mmp.msp -> mmp.pvb "Pirate to Clear (Prime Focus Technology)" "Outgoing - Mule" "Integration"
        ptcs = bms.pira -> mmp.msp "Pirate to Compliance Service" "Outgoing - Alternative" "Integration"
        ptdfvp = bms.et -> bms.pira "DIRECTION NOT SET - Pirate to DUK Freesat VOD publication" "XXXX - Alternative" "Integration,Direction not set"
        ptdfvpX = bms.et -> bms.pira "DIRECTION NOT SET - Pirate to DUK Freeview VOD publication" "XXXX - Alternative" "Integration,Direction not set"
        pte = bms.pira -> fsp.ebs "Pirate to EBS" "XXXX - Alternative" "Integration"
        ptes = bms.pira -> mmp.msp "Pirate to Editorial Service" "Outgoing - Alternative" "Integration"
        ptgc4ce = bms.pira -> bms.grac "DIRECTION NOT SET - Pirate to Gracenote Channel 4 channel EPGs" "XXXX - Mule" "Integration,Direction not set"
        ptgmce = bms.pira -> bms.grac "DIRECTION NOT SET - Pirate to Gracenote music channel EPGs" "XXXX - Alternative" "Integration,Direction not set"
        ptk = sp.ppps -> dap.barb "DIRECTION NOT SET - Pirate to Kantar" "XXXX - Mule" "Integration,Direction not set"
        ptkfa = mmp.pmm -> dap.barb "Pirate to Kantar for Assets" "Incoming - Mule" "Integration"
        ptl = bms.pira -> lpp.lsp "Pirate To LSP" "Incoming - Alternative" "Integration,Impact,Playout Next Gen" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        ptl2 = cp.stel -> lpp.lsp "Pirate To LSP" "Incoming - Alternative" "Integration,Impact,Playout Next Gen" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        ptmocm = sp.mod -> bms.pira "Pirate to MediaGenix On-Demand Content Metadata" "Outgoing - Mule" "Integration"
        ptmocm2 = sp.mod -> sp.pepl "Pirate to MediaGenix On-Demand Content Metadata" "Outgoing - Mule" "Integration"
        ptpo = sp.ppps -> mp.po "DIRECTION NOT SET - Pirate To Promo Optimser" "XXXX - Mule" "Integration,Direction not set"
        ptss = sp.ppps -> lpp.lsp "Pirate to Schedule Service" "Incoming - Alternative" "Integration,Impact,Playout Next Gen" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        pts = bms.pira -> cp.stel "DIRECTION NOT SET - Pirate to Stellar" "XXXX - Alternative" "Integration,Direction not set"
        ptsfac = sp.pitts -> cp.stel "Pirate to Stellar for ASRUN commercial" "Outgoing - Automate, SFTP" "Integration"
        ptsfan = sp.ppps -> cp.stel "Pirate to Stellar for ASRUN Non-commercial" "Outgoing - Alternative" "Integration"
        ptsfset = sp.ppps -> cp.stel "Pirate to Stellar for Schedule & Event timings" "Outgoing - Alternative" "Integration"
        ptsufb = cp.ap -> cp.stel "Pirate to Stellar update for Brand" "Incoming - Mule" "Integration"
        pvtrmpn = mmp.msp -> bms.ptis "DIRECTION NOT SET - Pirate VPS to (RedBee, M2A, PFT, NLDR)" "XXXX - Mule" "Integration,Direction not set"
        pvts = mmp.msp -> mmp.pmm "Pirate VPS to S3" "Outgoing - Mule" "Integration"
        pwfts = bms.pira -> cp.stel "DIRECTION NOT SET - Pirate Weekly Forecast to Stellar" "XXXX - Automate" "Integration,Direction not set"
        pvtcrps = rmp.prms -> rsp.prrs "Portal view to capture Royalty Producer shares" "Incoming - Alternative" "Integration"
        pdfpts = rsp.soun -> bms.pira "Post-TX data from Pirate to Soundmouse" "XXXX - Automate, SFTP" "Integration"
        pcf = mmp.ppsp -> lpp.lsp "PPSP Contribution Feed" "Outgoing - Alternative" "Integration,Impact,Playout Next Gen" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        pmfd = mmp.ppsp -> mmp.msp "DIRECTION NOT SET - PPSP Media File Delivery" "XXXX - Alternative" "Integration,Direction not set"
        pdfptsX = rsp.soun -> bms.pira "Pre-TX data from Pirate to Soundmouse" "XXXX - Automate, SFTP" "Integration"
        prte = rsp.come -> fsp.ebs "Producer Reporting to EBS" "Outgoing - Automate" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        proebs = fsp.ebs -> rsp.come "Producer Reporting to Oracle eBusiness Suite " "Outgoing - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        pptpfesdi = csp.pcc -> bms.ppp "Producers Portal to Pirate for Ed Spec Diversity info" "Incoming - Mule" "Integration"
        pasmcmcfstp = rsp.soun -> bms.pira "Programme and social media clip music cuesheets from Soundmouse to Pirate" "XXXX - Automate, SFTP" "Integration"
        ppi = fsp.ebs -> bms.pira "DIRECTION NOT SET - programme Payments Interface" "XXXX - Alternative" "Integration,Direction not set"
        pctm = sp.mod -> bms.pcX "DIRECTION NOT SET - Promo Create To Movida" "XXXX - Mule" "Integration,Direction not set"
        pctp = bms.pira -> bms.pcX "DIRECTION NOT SET - Promo Create To Pirate" "XXXX - Mule" "Integration,Direction not set"
        potp = bms.pira -> mp.po "DIRECTION NOT SET - Promo Optimiser to Pirate" "XXXX - Mule" "Integration,Direction not set"
        rtata4 = lpp.lsp -> vsp.c4sl "Real Time As-Run to ALL 4" "Outgoing - Alternative" "Integration,Impact,Playout Next Gen,Streaming Transformation Program" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        rdfpfcf = rsp.pris -> bms.pira "Recoupment/Advances data from Programme Finance Committee form" "Incoming - Alternative" "Integration"
        rad = rsp.pap -> csp.pcc "Repeat agreement data" "Incoming - Alternative" "Integration"
        rtc7t = rmp.prms -> bms.c7t "DIRECTION NOT SET - Rights to C4 7A Titles" "XXXX - Alternative" "Integration,Direction not set"
        rswe = bms.pc -> rsp.prrs "Royalty Statement (welcome Email)" "Outgoing - Alternative" "Integration"
        se = rsp.pap -> rsp.come "Sales Entry" "Incoming - Alternative" "Integration"
        str = lpp.lsp -> bms.pira "SSAPI to RTAR" "Outgoing - Mule" "Integration,Impact,Playout Next Gen" {
            perspectives {
                "Playout Next Gen" "Playout Next Gen"
            }
        }
        sdfp = rsp.prrs -> fsp.bsw "Statement data (for pre-approved PO's)" "Outgoing - Alternative" "Integration"
        sbttefud = cp.stel -> dap.dwa "Stellar BARB & TAM to EDW for universe data" "Outgoing - Alternative" "Integration"
        scpddtefcm = cp.stel -> dap.dwa "Stellar CB & PIB delivery data to EDW for Campaign Month" "Outgoing - Alternative" "Integration"
        scdta = dap.dwa -> cp.ap "Stellar commercial data to Agencies" "Incoming - Mule" "Integration"
        scdta2 = cp.stel -> cp.ap "Stellar commercial data to Agencies" "Incoming - Mule" "Integration"
        sstefsed = cp.stel -> dap.dwa "Stellar Snapshots to EDW for Scheduled Episode data" "Outgoing - Alternative" "Integration"
        stapkfpd = cp.stel -> cp.ap "Stellar to Agency Portal &  K2 for programme data" "Incoming - Mule" "Integration"
        stapfcap = cp.ap -> cp.stel "Stellar to Agency Portal for CB and PIB" "Outgoing - Alternative" "Integration"
        strebs = fsp.ebs -> cp.stel "Stellar to EBS for Sales Orders & New Customers" "XXXX - Alternative" "Integration"
        ste-cpadpagl = cp.stel -> dap.dwa "Stellar to EDW - Campaign Position and Deal Position at Group Level" "Outgoing - Alternative" "Integration"
        ste-dtbuipcr = cp.stel -> dap.dwa "Stellar to EDW - Data to be used in PIB & CB reporting" "Outgoing - Alternative" "Integration"
        ste-pbpgd = cp.stel -> dap.dwa "Stellar to EDW - Processes Base Price Group data" "Outgoing - Alternative" "Integration"
        ste-rsrvpt = cp.stel -> dap.dwa "Stellar to EDW - ROI Sponsorship Revenue values per transmission" "Outgoing - Alternative" "Integration"
        ste-scd = cp.stel -> dap.dwa "Stellar to EDW - Sponsorship campaign data" "Outgoing - Alternative" "Integration"
        stefahil = cp.stel -> dap.dwa "Stellar to EDW for Ad Hoc Inventory Loads" "Outgoing - Alternative" "Integration"
        stefcm = cp.stel -> dap.dwa "Stellar to EDW for Campaign Month" "Outgoing - Alternative" "Integration"
        steficd = cp.stel -> dap.dwa "Stellar to EDW for Industry Channel data" "Outgoing - Alternative" "Integration"
        steflcdiabas = cp.stel -> dap.dwa "Stellar to EDW for Linear Campaign Data, including Agreements, Breaks and Spots" "Outgoing - Alternative" "Integration"
        stefocd = cp.stel -> dap.dwa "Stellar to EDW for Online Campaign Data" "Outgoing - Alternative" "Integration"
        stefpcd = cp.stel -> dap.dwa "Stellar to EDW for Promo Campaign data" "Outgoing - Alternative" "Integration"
        stefrsd = cp.stel -> dap.dwa "Stellar to EDW for Revenue Set data" "Outgoing - Alternative" "Integration"
        stefrcocs = cp.stel -> dap.dwa "Stellar to EDW for ROI calculation on Channel sets" "Outgoing - Alternative" "Integration"
        stffabdac = cp.fsh -> cp.stel "Stellar to Freewheel for Agencies, Brand, Deals and Campaigns" "Outgoing - Mule" "Integration"
        stnabfptsl = cp.stel -> dap.barb "Stellar to NIELSEN and BARB for post transmission Spot Log" "Incoming - SFTP" "Integration"
        stof2 = cp.stel -> fsp.ebs "Stellar to Oracle Financials about Agency financial exposure" "Outgoing - Alternative" "Integration"
        stof1 = cp.stel -> fsp.ebs "Stellar to Oracle Financials on Credit Policy" "Outgoing - Alternative" "Integration"
        stof = cp.stel -> fsp.ebs "Stellar to Oracle Financials on invoicing" "Outgoing - Alternative" "Integration"
        stpmfspf = mmp.msp -> cp.stel "Stellar to Peach Media for Spot Plus files" "Outgoing - Mule" "Integration"
        stpfcbpi = cp.stel -> sp.ppps "Stellar to Pirate for Commercial break pattern information" "Incoming - Alternative" "Integration"
        stpfccr = cp.stel -> sp.ppps "Stellar to Pirate for Commercial Copy Registrations" "Outgoing - SFTP" "Integration"
        stpfcp = cp.stel -> sp.pitts "Stellar to Pirate for commercial playlist" "Incoming - SFTP" "Integration"
        stpfppi = cp.stel -> sp.ppps "Stellar to Pirate for Product placement indicator" "Outgoing - Alternative" "Integration"
        stpfpc = cp.stel -> sp.ppps "Stellar to Pirate for Promotional Campaigns" "Outgoing - Alternative" "Integration"
        stpfpcr = cp.stel -> sp.ppps "Stellar to Pirate for Promotions Copy Registrations" "Outgoing - Alternative" "Integration"
        stpfsc = cp.stel -> sp.ppps "Stellar to Pirate for Sponsorship Campaign" "Outgoing - Alternative" "Integration"
        stpfscoc = cp.stel -> sp.ppps "Stellar to Pirate for Sponsorship Clocknumbers or Copy" "Outgoing - Alternative" "Integration"
        stpfse = cp.stel -> sp.ppps "DIRECTION NOT SET - Stellar to Pirate for Sponsorship Events" "XXXX - Alternative" "Integration,Direction not set"
        stpfsefp = cp.stel -> sp.ppps "Stellar to Pirate for Sponsorship Events for Partners" "Outgoing - SFTP" "Integration"
        stpftp = cp.stel -> sp.ppps "Stellar to Pirate for Trail patterns" "Outgoing - Alternative" "Integration"
        stufac = cp.stel -> mmp.msp "Stellar to UKTV for Ad Certification" "Incoming - SFTP" "Integration"
        stufccr = cp.stel -> mmp.msp "Stellar to UKTV for Commercial Copy Registrations" "Incoming - SFTP" "Integration"
        scte = vsp.c4sl -> dap.dwa "Streaming Consent to EDW" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        sbde = rsp.pap -> fsp.ebs "Supplier Bank Details Exist" "Incoming - Automate" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        sffpte = rsp.prrs -> dap.dwa "Supplier fields from Pirate to EDW" "Outgoing - Alternative" "Integration"
        supinf = rsp.pris -> fsp.ebs "Supplier Information" "Incoming - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        suprec = fsp.ebs -> rsp.pap "Supplier Records" "Outgoing - Alternative" "Integration,Impact,Corporate Integration" {
            perspectives {
                "Corporate Integration" "Corporate Integration"
            }
        }
        ttbster = rsp.ted -> dap.dwa "Ted tables batch synchronisation to EDW Redshift" "Outgoing - Alternative" "Integration"
        ttn = rsp.soun -> bms.pira "DIRECTION NOT SET - Ted to Neo" "XXXX - Automate, SFTP" "Integration,Direction not set"
        ttc-r = vsp.thin -> vsp.c4sl "ThinkAnalytics to C4S - Recommendation" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        tsfptb = sp.pass -> dap.barb "TX Schedule from PIRATE to BARB" "Incoming - Alternative" "Integration"
        vptc = bms.osp -> vsp.c4sl "DIRECTION NOT SET - Video Pipeline to C4S" "XXXX - Alternative" "Integration,Impact,Streaming Transformation Program,Direction not set" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        vtcs = bms.ppc -> mmp.msp "VisionCloud to Compliance Service" "Incoming - Mule" "Integration"
        vvd = rsp.prrs -> dap.dwa "VOD Views Data" "Incoming - Alternative" "Integration"
        waadte = dap.wa -> dap.dwa "Web Analytics (AA) data to EDW" "Outgoing - Alternative" "Integration,Impact,Streaming Transformation Program" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        wdsbi = fsp.wda -> fsp.ebs "Workday Adaptive to SplashBI (Oracle eBS Schema)" "Outgoing - Mule" "Integration"
        wdsbi2 = fsp.wda -> fsp.sbi "Workday Adaptive to SplashBI (Oracle eBS Schema)" "Outgoing - Mule" "Integration"
        ytf = vsp.yosp -> cp.fsh "DIRECTION NOT SET - YoSpace to Freewheel" "XXXX - Alternative" "Integration,Impact,Streaming Transformation Program,Direction not set" {
            perspectives {
                "Streaming Transformation Program" "Streaming Transformation Program"
            }
        }
        
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