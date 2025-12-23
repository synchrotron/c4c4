# Projects Configuration Guide

The LeanIX to Structurizr generator supports flexible configuration for how Projects are rendered in the output DSL.

**Note:** In LeanIX, projects can have parent projects (sometimes called "initiatives" in the UI). This tool treats them all as projects and extracts both the project itself and any parent projects.

## Command-Line Options

```bash
python3 generate_from_leanix.py [OPTIONS]

Options:
  --projects-mode {tags,perspectives,both}
                        How to render projects (including parent projects). Default: tags
```

## Modes Explained

### Tags Mode (default)
Projects (including parent projects) appear as **tags** on elements (applications, persons, relationships).

**Example:**
```dsl
app = container "My App" "Description" "Cloud" {
    tags "SSO,Impact,Project Alpha,Project Beta,Strategic Initiative X"
}
```

**Pros:**
- Simple and compact
- Easy to filter and color in Structurizr views
- All information visible in element properties
- Works well when you have a small number of projects

**Cons:**
- Can get cluttered with many projects
- Tags are comma-separated strings (no structure)
- Harder to filter by specific projects in complex diagrams

### Perspectives Mode
Projects (including parent projects) appear as **perspectives** on elements.

**Example:**
```dsl
app = container "My App" "Description" "Cloud" {
    tags "SSO,Impact"
    perspectives {
        "Project Alpha" "Project Alpha"
        "Project Beta" "Project Beta"
        "Strategic Initiative X" "Strategic Initiative X"
    }
}
```

**Pros:**
- Better for filtering views by specific projects
- Keeps tags clean for categorical information (SSO, Impact, Team, etc.)
- Native Structurizr feature designed for view filtering
- Easier to create project-specific views

**Cons:**
- Slightly more verbose
- Requires using Structurizr perspective filtering in views

### Both Mode
Projects appear as **both tags and perspectives**.

**Example:**
```dsl
app = container "My App" "Description" "Cloud" {
    tags "SSO,Impact,Project Alpha,Strategic Initiative X"
    perspectives {
        "Project Alpha" "Project Alpha"
        "Strategic Initiative X" "Strategic Initiative X"
    }
}
```

**Pros:**
- Maximum flexibility
- Works with both tag-based and perspective-based filtering
- Useful during transition period when deciding which approach to use

**Cons:**
- Most verbose
- Duplicates information

## Usage Examples

### Example 1: Default (Projects as Tags)
```bash
python3 generate_from_leanix.py
# or explicitly:
python3 generate_from_leanix.py --projects-mode tags
```

**Results in:**
- Tags: `SSO,Impact,Project Alpha,Project Beta,Strategic Initiative X`
- Perspectives: (none)

### Example 2: Projects as Perspectives (Recommended)
```bash
python3 generate_from_leanix.py --projects-mode perspectives
```

**Results in:**
- Tags: `SSO,Impact` (only categorical markers)
- Perspectives: `Project Alpha, Project Beta, Strategic Initiative X`

### Example 3: Maximum Visibility (Both)
```bash
python3 generate_from_leanix.py --projects-mode both
```

**Results in:**
- Tags: `SSO,Impact,Project Alpha,Project Beta,Strategic Initiative X`
- Perspectives: `Project Alpha, Project Beta, Strategic Initiative X`

## Recommendation

For most use cases, we recommend:

```bash
python3 generate_from_leanix.py --projects-mode perspectives
```

This keeps tags clean for categorical information (SSO, Impact, Integration, Team category) and uses perspectives for organizational/temporal filtering (projects), which is what perspectives were designed for in Structurizr.

## What's Included

When the tool extracts projects, it automatically includes:
- The project directly linked to the element
- Any parent projects of that project (what LeanIX UI calls "initiatives")

For example, if "Project Alpha" has a parent project "Strategic Initiative X", and an application is linked to "Project Alpha", both will be included in the output.

## Testing Different Modes

1. Generate with default (tags):
   ```bash
   python3 generate_from_leanix.py
   ```

2. Generate with perspectives:
   ```bash
   python3 generate_from_leanix.py --projects-mode perspectives
   ```

3. Compare the outputs in `dsl/c4-core-workspace.dsl`

4. Upload to Structurizr and test filtering:
   - **Tag-based**: Use element styles and tag filtering
   - **Perspective-based**: Use perspective filtering in views

## Technical Details

The mode configuration affects:
- **Containers (Applications)**: All projects as tags and/or perspectives
- **Persons (Teams/Organizations)**: All projects as tags and/or perspectives
- **Relationships (Integrations)**: All projects as tags and/or perspectives
- **Person→Container Relationships**: **Only shared projects** (intersection) as tags and/or perspectives

### Special Behavior for Person→Container Relationships

When a Person (team/organization) has a relationship to a Container (application), only the **shared projects** appear on the relationship. This makes it easy to see which projects connect the team to the application.

**Example:**
- Person has: Project A, Project B, Strategic Initiative X
- Container has: Project B, Project C, Strategic Initiative X
- Relationship will have: Project B, Strategic Initiative X (only the shared ones)

This applies whether projects are rendered as tags, perspectives, or both.

The 'Impact' tag is always added when projects exist, regardless of mode.

## What Changed

Previously (commit 983a47b), the code used perspectives by default. We found the distinction between "projects" and "initiatives" confusing since they're the same type of entity in LeanIX. Now:
- Single `--projects-mode` flag controls all project rendering
- Parent projects are automatically included with their child projects
- Default is `tags` for backward compatibility
- You can easily experiment with both approaches
