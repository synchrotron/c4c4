# c4c4 - Channel 4 Core Architecture

Python-based Structurizr DSL generator with Channel 4 branding and customizations.

## Overview

This project generates Structurizr DSL files from Python code using pystructurizr, then post-processes them to add Channel 4-specific features including custom themes, branding, terminology, and relationship identifiers for cross-workspace references.

## Prerequisites

- Python 3.8 or higher
- Git (for cloning and managing the repository)

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/synchrotron/c4c4.git
cd c4c4
```

### 2. Set up Python virtual environment

```bash
# Create a virtual environment
python -m venv venv

# Activate the virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
# venv\Scripts\activate
```

### 3. Install dependencies

```bash
# Install all required packages from requirements.txt
pip install -r requirements.txt
```

This will install:
- **pystructurizr**: The core library for generating Structurizr DSL from Python
- **click**: Command-line interface utilities
- **python-dotenv**: Environment variable management (for future LeanIX integration)

## Usage

### Quick Start - Generate DSL

Once your virtual environment is activated and dependencies are installed:

```bash
python generate_dsl.py
```

This will:
1. Generate base DSL from `main.py` using pystructurizr
2. Add Channel 4 customizations (themes, branding, terminology, relationship identifiers)
3. Output the final DSL to `dsl/c4-core-workspace.dsl`

### Manual Step-by-Step Process

If you prefer to run each step individually:

1. **Generate base DSL:**
```bash
pystructurizr dump --view main.py > temp_raw.dsl
```

2. **Post-process with enhancements:**
```bash
python post_process_dsl.py temp_raw.dsl dsl/c4-core-workspace.dsl
```

3. **Clean up temporary files:**
```bash
rm temp_raw.dsl
```

### Preview in Development Mode

For live preview while editing:

```bash
pystructurizr dev --view main.py
```

Opens a browser with live preview (note: won't include post-processing enhancements).

## Project Structure

```
c4c4/
├── README.md                  # This file
├── requirements.txt           # Python dependencies
├── main.py                    # Core architecture model definition
├── post_process_dsl.py        # Post-processor for DSL enhancements
├── generate_dsl.py            # Complete generation workflow
├── assets/                    # Channel 4 branding assets
│   ├── 4-logo-black.png
│   ├── c4-default-theme.json
│   └── 4Text-Regular.ttf
└── dsl/                       # Generated DSL output
    └── c4-core-workspace.dsl
```

## Features

### Core Architecture Model (main.py)

- **Finance System Platform** with 13 applications:
  - Oracle e-Business Suite, Workday Adaptive, SplashBI, Baseware, and more
- **People Platform** with 3 applications:
  - 4People, Handle, FES
- **6 Teams/Departments**: Commercial Finance, Finance, Shared Services, Tax and Treasury, People Ops, All Colleagues
- **4 Additional Platforms**: Commercial, Small Business Systems, Streaming, Royalties and Sales
- **Comprehensive relationships** between systems and users

### Post-Processing Enhancements

The post-processor adds the following to the generated DSL:

- ✅ **Workspace metadata**: Name and description
- ✅ **`!identifiers flat`**: Directive for global identifier scope
- ✅ **Archetypes**: Maps `application = container` semantically
- ✅ **Custom terminology**: 
  - `person` → "Team"
  - `softwareSystem` → "Platform"
  - `container` → "Application"
- ✅ **Channel 4 theme**: Custom colour scheme and styling
- ✅ **Channel 4 branding**: Logo and 4Text font
- ✅ **Relationship identifiers**: Enables cross-workspace references
- ✅ **Documentation comments**: Header with project information
- ✅ **Removes conflicting styles**: Ensures theme takes precedence

## Customization

### Modify the Architecture Model

Edit `main.py` to:
- Add or remove teams, platforms, or applications
- Change relationships between elements
- Update descriptions and technologies
- Add new containers or components

### Customize Post-Processing

Edit `post_process_dsl.py` to change:
- Workspace name and description
- Theme and branding URLs
- Terminology mappings
- Identifier naming conventions

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

1. Activate your virtual environment:
```bash
source venv/bin/activate
```

2. Make changes to `main.py` or other files

3. Regenerate the DSL:
```bash
python generate_dsl.py
```

4. Commit your changes:
```bash
git add .
git commit -m "Description of changes"
git push
```

### Adding New Platforms or Applications

In `main.py`, add new software systems or containers:

```python
# Add a new platform
new_platform = model.SoftwareSystem(
    "New Platform Name",
    description="Description of the platform"
)

# Add a new application to existing platform
new_app = existing_platform.Container(
    "New Application",
    description="What this application does",
    technology="Technology stack"
)

# Add relationships
team.uses(new_app, "How they use it")
```

## Roadmap

### Phase 1: ✅ Complete
- Static workspace generation from Python
- Channel 4 branding and customizations
- Cross-workspace relationship references

### Phase 2: Planned - LeanIX Integration
- GraphQL client for LeanIX API
- Automatic data fetching from EAM
- Dynamic model generation from live architecture data
- Mapping LeanIX entities to Structurizr elements

### Phase 3: Planned - Advanced Features
- Component-level diagrams
- Deployment views
- Dynamic views for user journeys
- Filtered views by business capability
- Automated diagram generation pipeline

## Troubleshooting

### Error: `pystructurizr` command not found

Make sure you've activated your virtual environment and installed dependencies:
```bash
source venv/bin/activate
pip install -r requirements.txt
```

### Error: Module import issues

Ensure you're in the project root directory and the virtual environment is activated.

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