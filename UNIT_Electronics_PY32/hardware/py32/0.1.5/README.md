# PY32Duino Arduino Package

Arduino Core support for PY32F0xx series microcontrollers from Puya Semiconductor.

## Installation

### Arduino IDE Setup

1. Open Arduino IDE
2. Go to **File** > **Preferences**
3. Add the following URL to "Additional Boards Manager URLs":
   ```
   https://raw.githubusercontent.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/main/package_unit_electronics_py32_index.json
   ```
4. Go to **Tools** > **Board** > **Boards Manager**
5. Search for "PY32"
6. Click **Install** on "UNIT Electronics PY32"

### PyOCD Installation

PyOCD is required for programming and debugging PY32 boards. Install it using pip:

#### Linux / macOS
```bash
# Install Python pip if not already installed
sudo apt-get install python3-pip  # Debian/Ubuntu
# or
brew install python3  # macOS

# Install PyOCD
pip3 install pyocd

# Add user to dialout group for USB access (Linux only)
sudo usermod -a -G dialout $USER
# Log out and log back in for changes to take effect
```

#### Windows
```bash
# Install Python from https://www.python.org/downloads/
# Make sure to check "Add Python to PATH" during installation

# Open Command Prompt or PowerShell and run:
pip install pyocd
```

#### Verify Installation
```bash
pyocd --version
```

### Install PY32 Target Support
```bash
pyocd pack install py32f0
```

## Supported Boards

| MCU Series | Status | Features |
|:----------:|:------:|:---------|
| PY32F002A  | ✅     | Cortex-M0+ up to 24MHz |
| PY32F003   | ✅     | Cortex-M0+ up to 48MHz |
| PY32F030   | ✅     | Cortex-M0+ up to 48MHz |

## Quick Start

1. Connect your PY32 board via USB (using a compatible debugger like DAPLink, ST-Link, or CMSIS-DAP)
2. Select your board from **Tools** > **Board** > **UNIT Electronics PY32**
3. Select the correct port from **Tools** > **Port**
4. Upload your sketch

## Resources

- [Official Documentation](https://arduino.py32.halfsweet.cn/)
- [GitHub Repository](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package)
- [Issue Tracker](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/issues)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the terms specified in the LICENSE file.
