# FVM Setup Guide - calms_parent_latest Project

## Current Configuration
- **Flutter Version Locked:** 3.7.12
- **Configuration File:** `.fvmrc` (already configured)

## Quick Start Commands

### For Existing Team Members
```bash
# Install Flutter 3.7.12 for this project (one-time setup)
fvm install

# Use the project's Flutter version
fvm use

# Run commands using FVM's Flutter
fvm flutter pub get
fvm flutter run
```

### Setup on New Machine
1. **Install FVM** (if not already installed):
   ```bash
   dart pub global activate fvm
   ```

2. **Navigate to project directory:**
   ```bash
   cd calms_parent_latest
   ```

3. **Install Flutter 3.7.12:**
   ```bash
   fvm install
   ```

4. **Use FVM version for this project:**
   ```bash
   fvm use
   ```

5. **Get dependencies:**
   ```bash
   fvm flutter pub get
   ```

## Benefits of FVM
- ✅ **Version Consistency:** All team members use the same Flutter version (3.7.12)
- ✅ **Multiple Versions:** Switch between versions for different projects without conflicts
- ✅ **Reproducible Builds:** Same version = consistent behavior across teams
- ✅ **CI/CD Friendly:** Automated tests use the exact version specified

## IDE Configuration (VS Code)

### Set VS Code to use FVM's Flutter
1. Open VS Code settings (`Ctrl + ,`)
2. Search for "dart: Sdk Path"
3. Set to: `.fvm/flutter_sdk`
4. Reload VS Code

### Alternative: Update PATH
Add FVM's flutter to your PATH:
```powershell
$env:PATH = "$(pwd)/.fvm/flutter_sdk/bin;$env:PATH"
```

## Creating a New Project with Latest Flutter

### Option 1: Parallel Installation
```bash
# Install latest Flutter (outside project)
fvm install latest

# Create new project with latest version
fvm flutter create --template app my_new_project_name

# Inside the new project, set your desired version in .fvmrc
```

### Option 2: Global Flutter (Latest)
```bash
# Check what's the latest stable
fvm releases stable

# Install latest
fvm install <latest-version>

# Create new project
flutter create --template app my_new_project_name
```

## Useful FVM Commands
```bash
# List all installed Flutter versions
fvm list

# List all available versions to download
fvm releases

# Remove a specific version
fvm remove 3.7.12

# Check current Flutter version in use
fvm flutter --version
```

## Project Structure with FVM
```
calms_parent_latest/
├── .fvmrc                    # FVM configuration (locked to 3.7.12)
├── .fvm/
│   └── flutter_sdk/          # Cached Flutter 3.7.12 (git-ignored)
├── lib/
├── android/
├── ios/
└── ... (rest of project)
```

## .gitignore Configuration
The `.fvm/flutter_sdk/` folder is automatically ignored in git. Only commit `.fvmrc`.

---

## For Creating New Projects with Latest Flutter

When you're ready to create a fresh project with the latest Flutter:

1. **Install latest Flutter:**
   ```bash
   fvm install latest
   ```

2. **Create new project:**
   ```bash
   fvm flutter create --org com.example --template app my_new_app
   ```

3. **The new project will use latest Flutter version** (specified in its `.fvmrc`)

---

**Last Updated:** January 8, 2026
**Flutter Version:** 3.7.12 (locked via FVM)
