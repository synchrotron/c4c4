#!/usr/bin/env python3
"""
generate_dsl.py - Complete workflow for generating enhanced Structurizr DSL

This script:
1. Runs pystructurizr to generate the base DSL
2. Post-processes it to add Channel 4 customizations
3. Outputs the final enhanced DSL file
"""

import subprocess
import sys
from pathlib import Path
from post_process_dsl import DSLPostProcessor


def run_pystructurizr(view_file, temp_output):
    """
    Run pystructurizr dump command to generate base DSL.
    
    Args:
        view_file: Path to the Python view file (e.g., 'main.py')
        temp_output: Path to save the temporary raw DSL output
    
    Returns:
        bool: True if successful, False otherwise
    """
    print(f"Running pystructurizr dump on {view_file}...")
    
    try:
        # Remove .py extension if present for the module name
        module_name = view_file.replace('.py', '')
        
        # Run pystructurizr dump command
        result = subprocess.run(
            ['pystructurizr', 'dump', '--view', module_name],
            capture_output=True,
            text=True,
            check=True
        )
        
        # Save the output
        with open(temp_output, 'w', encoding='utf-8') as f:
            f.write(result.stdout)
        
        print(f"✓ Base DSL generated: {temp_output}")
        return True
        
    except subprocess.CalledProcessError as e:
        print(f"✗ Error running pystructurizr:")
        print(e.stderr)
        return False
    except FileNotFoundError:
        print("✗ Error: pystructurizr command not found!")
        print("Make sure pystructurizr is installed: pip install pystructurizr")
        return False


def main():
    """Main execution function."""
    
    # Configuration
    view_file = "main.py"
    temp_output = "temp_raw.dsl"
    output_dir = "dsl"
    final_output = f"{output_dir}/c4-core-workspace.dsl"
    
    # Create output directory if it doesn't exist
    Path(output_dir).mkdir(exist_ok=True)
    
    # Check if view file exists
    if not Path(view_file).exists():
        print(f"Error: View file '{view_file}' not found!")
        print("Make sure main.py exists in the current directory.")
        sys.exit(1)
    
    print("=" * 70)
    print("Channel 4 Core - Complete DSL Generation")
    print("=" * 70)
    print()
    
    # Step 1: Generate base DSL with pystructurizr
    print("Step 1: Generating base DSL with pystructurizr")
    print("-" * 70)
    if not run_pystructurizr(view_file, temp_output):
        sys.exit(1)
    print()
    
    # Step 2: Post-process to add enhancements
    print("Step 2: Post-processing DSL with Channel 4 customizations")
    print("-" * 70)
    processor = DSLPostProcessor()
    processor.process(temp_output, final_output)
    print()
    
    # Step 3: Clean up temporary file
    print("Step 3: Cleaning up")
    print("-" * 70)
    try:
        Path(temp_output).unlink()
        print(f"✓ Removed temporary file: {temp_output}")
    except Exception as e:
        print(f"⚠ Could not remove temporary file: {e}")
    print()
    
    # Summary
    print("=" * 70)
    print("✓ DSL Generation Complete!")
    print("=" * 70)
    print()
    print(f"Final output: {final_output}")
    print()
    print("Next steps:")
    print("  1. Review the generated DSL file")
    print("  2. Upload to Structurizr (structurizr.com)")
    print("  3. Or run locally with Structurizr Lite")
    print()
    print("To preview changes before uploading:")
    print(f"  cat {final_output}")
    print()
    print("=" * 70)


if __name__ == "__main__":
    main()