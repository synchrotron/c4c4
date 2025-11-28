# c4c4 - Channel 4 Core Architecture

Direct Structurizr DSL generator with Channel 4 branding and customizations.

## Overview

This project generates Structurizr DSL files directly in Python, with full control over identifiers, names, and formatting. No external dependencies required - just Python 3.8+!

## Prerequisites

- Python 3.8 or higher
- Git (for cloning and managing the repository)

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/synchrotron/c4c4.git
cd c4c4
```

### 2. That's it!

No dependencies to install for basic DSL generation. Everything uses Python's standard library.

## Usage

### Generate DSL from LeanIX (Main Workflow)

```bash
python generate_from_leanix.py
```

This will:
1. Connect to LeanIX using credentials from `.env`
2. Fetch the Finance Systems Platform and its applications
3. Fetch all interfaces (integrations)
4. Map to Structurizr DSL with Channel 4 branding
5. Save to `dsl/c4-core-workspace.dsl`

### Generate Static Example DSL

For testing or reference, you can generate a static example:

```bash
python generate_c4_dsl_static.py
```

This creates a hardcoded example without connecting to LeanIX.

### Preview the DSL

```bash
cat dsl/c4-core-workspace.dsl
```

## Project Structure

```
c4c4/
├── README.md                      # This file
├── requirements.txt               # Python dependencies
├── .env                           # LeanIX credentials (not in git)
├── generate_from_leanix.py        # Main: Generate DSL from LeanIX
├── generate_c4_dsl_static.py      # Static example generator
├── leanix/                        # LeanIX integration package
│   ├── __init__.py
│   ├── client.py                  # LeanIX GraphQL client
│   ├── queries.py                 # GraphQL queries
│   └── mapper.py                  # LeanIX → Structurizr mapper
├── assets/                        # Channel 4 branding assets
│   ├── 4-logo-black.png
│   ├── c4-default-theme.json
│   └── 4Text-Regular.ttf
└── dsl/                           # Generated DSL output
    └── c4-core-workspace.dsl      # Main workspace (from LeanIX)
```

## Features

### Architecture Model

The generated DSL includes:

- **Finance System Platform** with 13 applications:
  - Oracle e-Business Suite (ebs), Workday Adaptive (wda), SplashBI (sbi), Baseware (bsw), and more
- **People Platform** with 3 applications:
  - 4People (fourPo), Handle (hnd), FES (fes)
- **6 Teams/Departments**: Commercial Finance, Finance, Shared Services, Tax and Treasury, People Ops, All Colleagues
- **4 Additional Platforms**: Commercial, Small Business Systems, Streaming, Royalties and Sales
- **Comprehensive relationships** with named identifiers for cross-workspace references

### DSL Features

- ✅ **Clean identifiers**: Short, memorable (ebs, wda, fsp)
- ✅ **Display names with spaces**: "Finance System Platform", "Oracle e-Business Suite"
- ✅ **Relationship identifiers**: ebsToWda, comFinTeamToWda, etc.
- ✅ **`!identifiers flat`**: Global identifier scope
- ✅ **Archetypes**: Maps `application = container`
- ✅ **Custom terminology**: 
  - `person` → "Team"
  - `softwareSystem` → "Platform"
  - `container` → "Application"
- ✅ **Channel 4 theme**: Custom colors and styling from GitHub
- ✅ **Channel 4 branding**: Logo and 4Text font from GitHub
- ✅ **Multiple views**: System Landscape, Context, and Container views

## Customization

### Modify the Architecture Model

Edit `generate_c4_dsl.py` to:
- Add or remove teams, platforms, or applications
- Change relationships between elements
- Update descriptions and technologies
- Add new views

The DSL is defined as a Python f-string in the `generate()` method, making it easy to edit directly.

### Customize Branding

Edit the `__init__` method in `generate_c4_dsl.py` to change:
- Workspace name and description
- Theme and branding URLs
- Terminology mappings

### Update Assets

Replace files in the `assets/` directory:
- `4-logo-black.png`: Channel 4 logo
- `c4-default-theme.json`: Structurizr theme definition
- `4Text-Regular.ttf`: Channel 4 font

After updating assets, commit and push to GitHub so the URLs remain valid.

## Uploading to Structurizr

### Option 1: Structurizr Cloud/On-Premises Web UI

1. Go to your Structurizr workspace
2. Navigate to the DSL editor
3. Copy the contents of `dsl/c4-core-workspace.dsl`
4. Paste into the editor and save

### Option 2: Structurizr CLI

```bash
# Push to Structurizr workspace
structurizr-cli push \
  -url https://your-structurizr-instance \
  -id YOUR_WORKSPACE_ID \
  -key YOUR_API_KEY \
  -secret YOUR_API_SECRET \
  -workspace dsl/c4-core-workspace.dsl
```

### Option 3: Structurizr Lite (Local)

```bash
# Run Structurizr Lite with Docker
docker run -it --rm -p 8080:8080 \
  -v $(pwd)/dsl:/usr/local/structurizr \
  structurizr/lite
```

Then open http://localhost:8080 in your browser.

## Development

### Making Changes

1. Edit `generate_c4_dsl.py`

2. Regenerate the DSL:
```bash
python generate_c4_dsl.py
```

3. Commit your changes:
```bash
git add .
git commit -m "Description of changes"
git push
```

### Adding New Platforms or Applications

In `generate_c4_dsl.py`, add to the DSL string in the `generate()` method:

```python
# Add a new platform
newPlatform = softwareSystem "New Platform Name" "Description" {
    
    newApp = container "New Application" "What it does" "Technology"
}

# Add relationships
teamToNewApp = team -> newApp "How they use it"
```

## Roadmap

### Phase 1: ✅ Complete
- Direct DSL generation from Python
- Channel 4 branding and customizations
- Clean identifiers and relationship references

### Phase 2: ✅ Complete
- LeanIX GraphQL client
- Fetch TechPlatform and Applications
- Map UserGroups to Persons
- Map Interfaces to Relationships
- Dynamic DSL generation from live architecture data

### Phase 3: Planned - Advanced Features
- Multiple platforms support
- Component-level diagrams
- Deployment views
- Dynamic views for user journeys
- Filtered views by business capability
- Automated sync from LeanIX on schedule

## Troubleshooting

### Error: Python version too old

Make sure you're using Python 3.8 or higher:
```bash
python --version
```

### Error: Assets not found (logo/theme/font)

The post-processor uses GitHub URLs pointing to `https://raw.githubusercontent.com/synchrotron/c4c4/main/assets/`. Make sure:
1. Assets are committed to the `assets/` folder
2. Repository is pushed to GitHub
3. Files are accessible at the URLs specified in `post_process_dsl.py`

## Contributing

This is an internal Channel 4 project. For questions or contributions, please contact the Enterprise Architecture team.

## License

Internal Channel 4 use only.

## Contact

For questions or support, contact the Channel 4 Enterprise Architecture team.