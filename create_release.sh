#!/bin/bash

# Script to create release package for PY32 Arduino Board Package
# Usage: ./create_release.sh <version>
# Example: ./create_release.sh 0.1.4

VERSION=${1:-0.1.4}
PACKAGE_NAME="UNIT_Electronics_PY32_${VERSION}"
OUTPUT_ZIP="${PACKAGE_NAME}.zip"

echo "=========================================="
echo "Creating PY32 Arduino Package Release"
echo "Version: ${VERSION}"
echo "=========================================="

# Create temporary directory
TEMP_DIR="temp_package_${VERSION}"
mkdir -p "${TEMP_DIR}"

echo "[1/5] Copying package files..."
# Create a directory with the version name as Arduino expects
mkdir -p "${TEMP_DIR}/${VERSION}"
# Copy all the content from the version directory
cp -r UNIT_Electronics_PY32/hardware/py32/${VERSION}/* "${TEMP_DIR}/${VERSION}/"
# Copy Misc directory (contains pyocd.yaml)
if [ -d "UNIT_Electronics_PY32/hardware/py32/Misc" ]; then
    mkdir -p "${TEMP_DIR}/Misc"
    cp -r UNIT_Electronics_PY32/hardware/py32/Misc/* "${TEMP_DIR}/Misc/"
fi

echo "[2/5] Cleaning temporary files..."
# Remove backup and temporary files
find "${TEMP_DIR}" -name "*.backup" -delete
find "${TEMP_DIR}" -name "*.old" -delete
find "${TEMP_DIR}" -name ".DS_Store" -delete
find "${TEMP_DIR}" -name "*.pyc" -delete
find "${TEMP_DIR}" -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null

echo "[3/5] Creating ZIP archive..."
# Create the ZIP file - the root of the ZIP should contain the version directory and Misc
cd "${TEMP_DIR}"
zip -r "../${OUTPUT_ZIP}" * -q
cd ..

echo "[4/5] Calculating SHA-256 checksum..."
# Calculate checksum
CHECKSUM=$(sha256sum "${OUTPUT_ZIP}" | awk '{print $1}')
# Get file size (works on both Linux and macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    SIZE=$(stat -f%z "${OUTPUT_ZIP}")
else
    SIZE=$(stat -c%s "${OUTPUT_ZIP}")
fi

echo ""
echo "=========================================="
echo "Release package created successfully!"
echo "=========================================="
echo "File: ${OUTPUT_ZIP}"
echo "Size: ${SIZE} bytes"
echo "SHA-256: ${CHECKSUM}"
echo ""
echo "Next steps:"
echo "1. Create a new release on GitHub:"
echo "   git tag -a v${VERSION} -m 'Release version ${VERSION}'"
echo "   git push origin v${VERSION}"
echo ""
echo "2. Upload ${OUTPUT_ZIP} to GitHub release"
echo ""
echo "3. Update package_unit_electronics_py32_index.json with:"
echo "   - URL: https://github.com/YOUR_USERNAME/YOUR_REPO/releases/download/v${VERSION}/${OUTPUT_ZIP}"
echo "   - archiveFileName: ${OUTPUT_ZIP}"
echo "   - checksum: SHA-256:${CHECKSUM}"
echo "   - size: ${SIZE}"
echo ""

# Cleanup
echo "[5/5] Cleaning up temporary files..."
rm -rf "${TEMP_DIR}"

echo "Done!"
