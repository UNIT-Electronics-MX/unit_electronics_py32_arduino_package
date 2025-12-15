# PY32 Arduino Board Package - Installation & Release Guide

## Quick Installation for Users

### Step 1: Install Arduino IDE
Download and install Arduino IDE 1.8.x or 2.x from [arduino.cc](https://www.arduino.cc/en/software)

### Step 2: Add Board Manager URL
1. Open Arduino IDE
2. Go to **File** → **Preferences** (or **Arduino IDE** → **Settings** on macOS)
3. In "Additional Boards Manager URLs", add:
   ```
   https://raw.githubusercontent.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/main/package_unit_electronics_py32_index.json
   ```
4. Click **OK**

### Step 3: Install PY32 Board Package
1. Go to **Tools** → **Board** → **Boards Manager**
2. Search for "**PY32**"
3. Click **Install** on "UNIT Electronics PY32"
4. Wait for installation to complete

### Step 4: Install PyOCD (Required for Programming)

#### Linux
```bash
# Update package list
sudo apt-get update

# Install Python 3 and pip (if not already installed)
sudo apt-get install python3 python3-pip

# Install PyOCD
pip3 install pyocd

# Add user to dialout group for USB device access
sudo usermod -a -G dialout $USER

# Log out and log back in for group changes to take effect
```

#### macOS
```bash
# Install Python 3 (using Homebrew)
brew install python3

# Install PyOCD
pip3 install pyocd
```

#### Windows
1. Download and install Python from [python.org](https://www.python.org/downloads/)
   - **Important**: Check "Add Python to PATH" during installation
2. Open **Command Prompt** or **PowerShell**
3. Run:
   ```bash
   pip install pyocd
   ```

#### Verify PyOCD Installation
```bash
pyocd --version
```

Expected output: `0.36.0` or higher

#### Install PY32 Target Support
```bash
# Install support pack for PY32F0 series
pyocd pack install py32f0

# List installed packs
pyocd pack show
```

### Step 5: Select Your Board
1. Connect your PY32 board to your computer
2. In Arduino IDE:
   - **Tools** → **Board** → **UNIT Electronics PY32** → Select your board (e.g., "PY32F003 Mini Dev")
   - **Tools** → **Port** → Select the appropriate COM/serial port

### Step 6: Upload Your First Sketch
1. Open **File** → **Examples** → **01.Basics** → **Blink**
2. Click the **Upload** button (→)
3. Wait for compilation and upload to complete

---

## For Maintainers: Creating a New Release

### Prerequisites
- Git installed and configured
- GitHub account with repository access
- Bash shell (Linux/macOS) or Git Bash (Windows)

### Step 1: Update Version Number
Edit the following files with the new version (e.g., `0.1.5`):

1. **package_unit_electronics_py32_index.json**:
   - Update `platforms[0].version`
   
2. **UNIT_Electronics_PY32/hardware/py32/[VERSION]/platform.txt**:
   - Update version if present

### Step 2: Create Release Package
Run the release script:
```bash
cd /path/to/unit_electronics_py32_arduino_package
./create_release.sh 0.1.5
```

This will:
- Create a ZIP file with the package
- Calculate SHA-256 checksum
- Display size and checksum information
- Clean up temporary files

### Step 3: Create Git Tag and Push
```bash
# Create annotated tag
git tag -a v0.1.5 -m "Release version 0.1.5 - PY32F003 support"

# Push tag to GitHub
git push origin v0.1.5
```

### Step 4: Create GitHub Release
1. Go to your repository on GitHub
2. Click **Releases** → **Create a new release**
3. Select the tag you just created (v0.1.5)
4. Set release title: `PY32 Arduino v0.1.5`
5. Add release notes describing changes
6. Upload the ZIP file created by the script
7. Click **Publish release**

### Step 5: Update Board Manager JSON
1. Copy the release ZIP URL from GitHub (right-click the file → Copy link address)
2. Edit **package_unit_electronics_py32_index.json**:
   ```json
   {
     "name": "UNIT Electronics PY32",
     "architecture": "py32",
     "version": "0.1.5",
     "url": "https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/releases/download/v0.1.5/UNIT_Electronics_PY32_0.1.5.zip",
     "archiveFileName": "UNIT_Electronics_PY32_0.1.5.zip",
     "checksum": "SHA-256:YOUR_CHECKSUM_HERE",
     "size": "YOUR_SIZE_HERE"
   }
   ```
3. Use the checksum and size from the script output

### Step 6: Commit and Push JSON Update
```bash
git add package_unit_electronics_py32_index.json
git commit -m "Update board manager index for v0.1.5"
git push origin main
```

### Step 7: Test Installation
1. Open Arduino IDE
2. Go to **Tools** → **Board** → **Boards Manager**
3. Uninstall old version (if installed)
4. Install new version
5. Verify boards appear correctly

---

## Troubleshooting

### PyOCD Not Found
**Problem**: `pyocd: command not found`

**Solution**:
```bash
# Linux/macOS
pip3 install --user pyocd
export PATH=$PATH:~/.local/bin

# Windows
pip install --user pyocd
# Add %APPDATA%\Python\Python3x\Scripts to PATH
```

### USB Device Permission Denied (Linux)
**Problem**: Cannot access USB device

**Solution**:
```bash
sudo usermod -a -G dialout $USER
sudo usermod -a -G plugdev $USER
# Log out and log back in
```

### Board Not Detected
**Problem**: No port appears in Arduino IDE

**Solution**:
1. Check USB cable (must be data cable, not charge-only)
2. Install CH340/CP2102 USB-Serial drivers if needed
3. Check if debugger firmware is up to date

### Upload Failed
**Problem**: Upload fails with timeout or connection error

**Solution**:
1. Verify PyOCD is installed: `pyocd --version`
2. Check debugger connection
3. Try resetting the board before upload
4. Check if another program is using the debugger

---

## Additional Resources

- **GitHub Repository**: [unit_electronics_py32_arduino_package](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package)
- **PyOCD Documentation**: [pyocd.io](https://pyocd.io/)
- **PY32 Datasheet**: Available from Puya Semiconductor
- **Arduino Core API**: [arduino.cc/reference](https://www.arduino.cc/reference/en/)

---

## License

This project is open source. See LICENSE file for details.

## 🤝 Contributing

Contributions welcome! Please submit Pull Requests on GitHub.
