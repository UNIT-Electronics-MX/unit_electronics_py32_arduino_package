# PY32 Arduino Board Package

<div align="center">

![PY32 Logo](https://img.shields.io/badge/PY32-Arduino-blue?style=for-the-badge)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE.md)
[![Release](https://img.shields.io/github/v/release/UNIT-Electronics-MX/unit_electronics_py32_arduino_package?style=for-the-badge)](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/releases)

Arduino Core support for PY32F0xx series microcontrollers from Puya Semiconductor

[Installation Guide](INSTALLATION_GUIDE.md) | [Documentation](https://arduino.py32.halfsweet.cn/) | [Report Issue](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/issues)

</div>

---

## Overview

This project provides Arduino Core support for Puya PY32F0xx series microcontrollers, enabling you to program these Cortex-M0+ MCUs using the familiar Arduino IDE and framework.

### Supported Microcontrollers

| MCU Series | Status | Core | Max Frequency | Flash | RAM |
|:----------:|:------:|:----:|:-------------:|:-----:|:---:|
| PY32F002A  | Yes    | Cortex-M0+ | 24 MHz | 20KB | 3KB |
| PY32F003   | Yes    | Cortex-M0+ | 48 MHz | 32KB | 4KB |
| PY32F030   | Yes    | Cortex-M0+ | 48 MHz | 64KB | 8KB |

---

## Quick Start

### 1. Install Arduino IDE
Download from [arduino.cc](https://www.arduino.cc/en/software)

### 2. Add Board Manager URL
In Arduino IDE, go to **File** → **Preferences** and add this URL:
```
https://raw.githubusercontent.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/main/package_unit_electronics_py32_index.json
```

### 3. Install Board Package
**Tools** → **Board** → **Boards Manager** → Search "**PY32**" → **Install**

### 4. Install PyOCD (Required)

#### Linux (Recommended: using pipx)
```bash
sudo apt update && sudo apt install -y pipx
pipx ensurepath
# Close and reopen terminal, or run: source ~/.bashrc
pipx install pyocd
# Create symlink for Arduino IDE (requires version 0.1.5+)
sudo ln -sf ~/.local/bin/pyocd /usr/local/bin/pyocd
sudo usermod -a -G dialout $USER  # Log out and back in
```

#### Linux (Alternative: using pip)
```bash
sudo apt-get install python3 python3-pip
pip3 install --user pyocd
# Create symlink for Arduino IDE (requires version 0.1.5+)
sudo ln -sf ~/.local/bin/pyocd /usr/local/bin/pyocd
sudo usermod -a -G dialout $USER  # Log out and back in
```

#### macOS
```bash
brew install pipx
pipx ensurepath
# Close and reopen terminal
pipx install pyocd
```

#### Windows
```bash
# Install Python from python.org (check "Add to PATH")
pip install pipx
pipx ensurepath
# Restart terminal
pipx install pyocd
```

### 5. Start Programming!
- Connect your PY32 board
- Select board and port in Arduino IDE
- Upload your sketch!

**Full installation guide**: [INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md)

---

## Features

- Arduino IDE integration
- Arduino API compatibility
- Digital I/O (digitalWrite, digitalRead, pinMode)
- Analog Input (analogRead)
- PWM Output (analogWrite)
- Serial Communication (UART)
- SPI Communication
- I2C Communication (Wire)
- Hardware Timers
- Interrupts
- EEPROM Library
- Servo Library
- SoftwareSerial Library

---

## Board Manager Package Structure

```
UNIT_Electronics_PY32/
├── hardware/
│   └── py32/
│       └── 0.1.4/
│           ├── boards.txt           # Board definitions
│           ├── platform.txt         # Build configuration
│           ├── programmers.txt      # Programmer definitions
│           ├── cores/               # Arduino Core implementation
│           ├── variants/            # Pin mapping for each board
│           ├── libraries/           # PY32-specific libraries
│           └── system/              # HAL drivers and linker scripts
└── tools/
    ├── xpack-arm-none-eabi-gcc/    # ARM GCC toolchain
    ├── CMSIS/                       # CMSIS headers
    └── pyocd/                       # Programming tool
```

---

## Example Sketch

```cpp
void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(115200);
  Serial.println("PY32 Arduino Ready!");
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  Serial.println("LED ON");
  delay(1000);
  
  digitalWrite(LED_BUILTIN, LOW);
  Serial.println("LED OFF");
  delay(1000);
}
```

---

## Creating a New Release (For Maintainers)

### Quick Release Process

1. **Update version numbers** in relevant files
2. **Run release script**:
   ```bash
   ./create_release.sh 0.1.5
   ```
3. **Create git tag**:
   ```bash
   git tag -a v0.1.5 -m "Release v0.1.5"
   git push origin v0.1.5
   ```
4. **Create GitHub Release** and upload ZIP
5. **Update** `package_unit_electronics_py32_index.json` with new URL, checksum, and size
6. **Commit and push** changes

See [INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md#-for-maintainers-creating-a-new-release) for detailed instructions.

---

## Documentation & Resources

- [Full Installation Guide](INSTALLATION_GUIDE.md)
- [PY32Duino Documentation](https://arduino.py32.halfsweet.cn/)
- [Pin Mapping Reference](UNIT_Electronics_PY32/hardware/py32/0.1.4/variants/)
- [Issue Tracker](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/issues)
- [Discussions](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/discussions)

### External Resources
- [PyOCD Documentation](https://pyocd.io/)
- [PY32 Datasheet](https://www.puyasemi.com/) - Puya Semiconductor official site
- [Arduino Language Reference](https://www.arduino.cc/reference/en/)

---

## Contributing

Contributions are welcome! Here's how you can help:

1. **Report bugs** - Use the [Issue Tracker](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/issues)
2. **Suggest features** - Open a discussion
3. **Submit Pull Requests** - Help improve the code
4. **Improve documentation** - Better docs help everyone
5. **Star the repository** - Show your support!

### Development Setup
```bash
git clone https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package.git
cd unit_electronics_py32_arduino_package
# Make your changes
./create_release.sh test
```

---

## Acknowledgments

- **PY32Duino Community** - Original Arduino Core development
- **Puya Semiconductor** - PY32 microcontroller family
- **PyOCD Project** - Debugging and programming tool
- **ARM** - CMSIS and Cortex-M support
- **Arduino** - Framework and IDE

---

## License

This project is open source and available under the [MIT License](LICENSE.md).

---

## Support

Having trouble? Check these resources:

1. Read the [Installation Guide](INSTALLATION_GUIDE.md)
2. Search [existing issues](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/issues)
3. Ask in [Discussions](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/discussions)
4. [Report a new issue](https://github.com/UNIT-Electronics-MX/unit_electronics_py32_arduino_package/issues/new)

---

<div align="center">

**Made by UNIT Electronics**

[![Website](https://img.shields.io/badge/Website-uelectronics.com-blue?style=flat-square)](https://uelectronics.com/)
[![GitHub](https://img.shields.io/badge/GitHub-UNIT--Electronics--MX-black?style=flat-square&logo=github)](https://github.com/UNIT-Electronics-MX)

</div>
