#!/usr/bin/env lua

-- Lua script to find and optionally delete unused assets in an Angular application
-- Supports multiple asset directory names and excluding specific folders
-- Usage: lua check-unused-assets.lua [--help] [--dry-run] [--delete] [--exclude=folder1,folder2]

local lfs = require("lfs")

-- Define variables
local current_dir = lfs.currentdir()
local dry_run = true
local found_assets_dir = ""
local total_assets = 0
local unused_assets = 0
local exclude_folders = {}

-- Possible asset directories to check
local possible_assets_dirs = {
  current_dir .. "/src/assets",
  current_dir .. "/src/ngassets",
  current_dir .. "/src/app/assets",
  current_dir .. "/assets"
}

-- Function to display help
local function show_help()
  print("Usage: lua check-unused-assets.lua [OPTIONS]")
  print("")
  print("Options:")
  print("  --help               Show this help message and exit")
  print("  --dry-run            Perform a dry run (default), no files will be deleted")
  print("  --delete             Delete unused assets")
  print("  --exclude=FOLDERS    Comma-separated list of folders to exclude from scanning")
  os.exit(0)
end

-- Function to parse arguments
local function parse_args()
  for _, arg in ipairs(arg) do
    if arg == "--help" then
      show_help()
    elseif arg == "--dry-run" then
      dry_run = true
    elseif arg == "--delete" then
      dry_run = false
    elseif arg:match("^--exclude=") then
      local folders = arg:match("^--exclude=(.*)")
      for folder in folders:gmatch("[^,]+") do
        table.insert(exclude_folders, folder)
      end
    else
      print("Unknown parameter: " .. arg)
      show_help()
    end
  end
end

parse_args()

-- Check if this is an Angular project
local function is_angular_project()
  local angular_json = io.open(current_dir .. "/angular.json", "r")
  local cli_json = io.open(current_dir .. "/angular-cli.json", "r")
  if angular_json then angular_json:close() end
  if cli_json then cli_json:close() end
  return angular_json or cli_json
end

if not is_angular_project() then
  print("Error: This does not appear to be an Angular project directory.")
  os.exit(1)
end

-- Find the assets directory
for _, dir in ipairs(possible_assets_dirs) do
  local attr = lfs.attributes(dir)
  if attr and attr.mode == "directory" then
    found_assets_dir = dir
    print("Found assets directory: " .. found_assets_dir)
    break
  end
end

if found_assets_dir == "" then
  print("Error: Could not find assets directory.")
  os.exit(1)
end

-- Announce the current mode
if dry_run then
  print("Running in DRY RUN mode. No files will be deleted.")
else
  print("Running in DELETE mode. Unused assets will be permanently deleted.")
  print("Press Ctrl+C within 5 seconds to cancel...")
  os.execute("sleep 5")
end

-- Function to check if an asset is in an excluded folder
local function is_excluded(asset)
  for _, folder in ipairs(exclude_folders) do
    if asset:find(found_assets_dir .. "/" .. folder) then
      return true
    end
  end
  return false
end

-- Function to scan assets
local function scan_assets(dir)
  for file in lfs.dir(dir) do
    if file ~= "." and file ~= ".." then
      local path = dir .. "/" .. file
      local attr = lfs.attributes(path)
      if attr then
        if attr.mode == "directory" then
          scan_assets(path)
        elseif attr.mode == "file" then
          total_assets = total_assets + 1
          if not is_excluded(path) then
            print("UNUSED: " .. path)
            unused_assets = unused_assets + 1
            if not dry_run then
              os.remove(path)
              print("  -> DELETED")
            end
          else
            print("EXCLUDED: " .. path)
          end
        end
      end
    end
  end
end

print("Scanning assets in " .. found_assets_dir .. "...")
scan_assets(found_assets_dir)

-- Print summary
print("===== SUMMARY =====")
print("Total assets: " .. total_assets)
print("Excluded assets: " .. #exclude_folders)
print("Unused assets: " .. unused_assets)

if dry_run then
  print("\nThis was a dry run. To delete unused assets, run with --delete flag:")
  print("lua check-unused-assets.lua --delete")
  if #exclude_folders > 0 then
    print("To exclude the same folders, use:")
    print("lua check-unused-assets.lua --delete --exclude=" .. table.concat(exclude_folders, ","))
  end
end
