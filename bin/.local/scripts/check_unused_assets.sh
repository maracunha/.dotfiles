#!/bin/bash

# Script to find and optionally delete unused assets in an Angular application
# Supports multiple asset directory names and excluding specific folders
# Usage: check-unused-assets [--help] [--dry-run] [--delete] [--exclude folder1,folder2]

# Define variables
CURRENT_DIR=$(pwd)
DRY_RUN=true
FOUND_ASSETS_DIR=""
TOTAL_ASSETS=0
UNUSED_ASSETS=0
EXCLUDE_FOLDERS=""

# Possible asset directories to check
POSSIBLE_ASSETS_DIRS=(
  "$CURRENT_DIR/src/assets"
  "$CURRENT_DIR/src/ngassets"
  "$CURRENT_DIR/src/app/assets"
  "$CURRENT_DIR/assets"
)

# Function to display help
show_help() {
  echo "Usage: check-unused-assets [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  --help               Show this help message and exit"
  echo "  --dry-run            Perform a dry run (default), no files will be deleted"
  echo "  --delete             Delete unused assets"
  echo "  --exclude=FOLDERS    Comma-separated list of folders to exclude from scanning"
  exit 0
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --help)
      show_help
      ;;
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --delete)
      DRY_RUN=false
      shift
      ;;
    --exclude)
      EXCLUDE_FOLDERS="$2"
      shift 2
      ;;
    --exclude=*)
      EXCLUDE_FOLDERS="${1#*=}"
      shift
      ;;
    *)
      echo "Unknown parameter: $1"
      show_help
      ;;
  esac
done

# Convert exclude folders to array
IFS=',' read -ra EXCLUDE_ARRAY <<< "$EXCLUDE_FOLDERS"

# Check if this appears to be an Angular project
if [ ! -f "$CURRENT_DIR/angular.json" ] && [ ! -f "$CURRENT_DIR/angular-cli.json" ]; then
  echo "Error: This does not appear to be an Angular project directory."
  echo "Make sure you run this command from the root of an Angular project."
  exit 1
fi

# Find the assets directory
for dir in "${POSSIBLE_ASSETS_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    FOUND_ASSETS_DIR="$dir"
    echo "Found assets directory: $FOUND_ASSETS_DIR"
    break
  fi
done

if [ -z "$FOUND_ASSETS_DIR" ]; then
  echo "Error: Could not find assets directory."
  exit 1
fi

# Announce the current mode
if [ "$DRY_RUN" = true ]; then
  echo "Running in DRY RUN mode. No files will be deleted."
else
  echo "Running in DELETE mode. Unused assets will be permanently deleted."
  echo "Press Ctrl+C within 5 seconds to cancel..."
  sleep 5
fi

# Print excluded folders
if [ -n "$EXCLUDE_FOLDERS" ]; then
  echo "Excluding the following folders from scan/deletion:"
  for folder in "${EXCLUDE_ARRAY[@]}"; do
    echo "  - $folder"
  done
fi

# Create temporary file
TEMP_ASSETS_FILE=$(mktemp)
find "$FOUND_ASSETS_DIR" -type f > "$TEMP_ASSETS_FILE"
TOTAL_ASSETS=$(wc -l < "$TEMP_ASSETS_FILE")

if [ "$TOTAL_ASSETS" -eq 0 ]; then
  echo "No asset files found in $FOUND_ASSETS_DIR"
  rm "$TEMP_ASSETS_FILE"
  exit 0
fi

# Function to check if an asset is used
check_asset_usage() {
  local asset="$1"
  local basename=$(basename "$asset")
  local relative_path="${asset#$FOUND_ASSETS_DIR/}"
  local patterns=(
    "$basename"
    "$ASSETS_DIR_BASENAME/$relative_path"
  )
  for pattern in "${patterns[@]}"; do
    if grep -r --include="*.ts" --include="*.html" --include="*.scss" --include="*.css" --include="*.json" \
       --exclude-dir="node_modules" --exclude-dir="dist" --exclude-dir=".git" \
       -l "$pattern" "$CURRENT_DIR" 2>/dev/null | grep -v "$asset" > /dev/null; then
      return 0  # Asset is used
    fi
  done
  return 1  # Asset is not used
}

# Function to check if an asset is in excluded folder
is_excluded() {
  local asset="$1"
  if [ -z "$EXCLUDE_FOLDERS" ]; then return 1; fi
  local relative_path="${asset#$FOUND_ASSETS_DIR/}"
  for folder in "${EXCLUDE_ARRAY[@]}"; do
    if [[ "$relative_path" == "$folder"/* ]] || [[ "$relative_path" == "$folder" ]]; then
      return 0
    fi
  done
  return 1
}

UNUSED_ASSETS=0
EXCLUDED_COUNT=0
while IFS= read -r asset; do
  if is_excluded "$asset"; then
    EXCLUDED_COUNT=$((EXCLUDED_COUNT + 1))
    echo "EXCLUDED: $asset"
    continue
  fi
  if ! check_asset_usage "$asset"; then
    UNUSED_ASSETS=$((UNUSED_ASSETS + 1))
    echo "UNUSED: $asset"
    if [ "$DRY_RUN" = false ]; then
      rm "$asset"
      echo "  -> DELETED"
    fi
  fi
done < "$TEMP_ASSETS_FILE"

rm "$TEMP_ASSETS_FILE"

echo "===== SUMMARY ====="
echo "Total assets: $TOTAL_ASSETS"
echo "Excluded assets: $EXCLUDED_COUNT"
echo "Unused assets: $UNUSED_ASSETS"

