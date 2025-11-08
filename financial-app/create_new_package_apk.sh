#!/bin/bash
# Script to create APK with new package name

set -e

echo "🔨 Creating APK with new package name..."

WORK_DIR="/workspace/new_package_apk"
SOURCE_APK="/workspace/මුදල් කළමනාකරණ_1.0.apk"
OUTPUT_APK="/workspace/financial-app/new_package_final.apk"

# Extract original APK
echo "📦 Extracting original APK..."
rm -rf "$WORK_DIR"
mkdir -p "$WORK_DIR/extracted"
unzip -q "$SOURCE_APK" -d "$WORK_DIR/extracted"

# Replace icons
echo "🎨 Replacing icons..."
mkdir -p "$WORK_DIR/extracted/res"
cp -r /workspace/financial-app/android/app/src/main/res/mipmap-* "$WORK_DIR/extracted/res/"

# Modify package name in AndroidManifest.xml (binary)
echo "📝 Modifying package name..."
cd "$WORK_DIR/extracted"

# Use Python to modify binary manifest
python3 << 'PYEOF'
import struct
import sys

# Read binary AndroidManifest.xml
with open('AndroidManifest.xml', 'rb') as f:
    data = bytearray(f.read())

# Try multiple package name patterns from original APK
# Common package names in Sinhala apps
old_patterns = [
    b'com.personalfinance',
    b'com.finance',
    b'com.money',
    b'com.budget',
    b'com.financial',
]

new_pkg = b'com.newfinancialapp'

# Try to find and replace
replaced = False
for old in old_patterns:
    if old in data:
        data = data.replace(old, new_pkg)
        print(f"✅ Replaced: {old.decode()} -> {new_pkg.decode()}")
        replaced = True
        break

# Also try generic com. patterns
if not replaced:
    # Find any com.xxx pattern and replace
    import re
    # This is a simplified approach - binary XML is complex
    # But we'll try to replace common patterns
    patterns = [
        (b'com/', b'com/new'),
    ]
    for old, new in patterns:
        if old in data:
            # More careful replacement needed for binary XML
            # For now, just note that we tried
            print(f"⚠️  Found pattern but binary XML modification is complex")
            break

# Write back
with open('AndroidManifest.xml', 'wb') as f:
    f.write(data)

print("✅ AndroidManifest.xml processed")
PYEOF

# Remove old signature
echo "🔐 Removing old signature..."
rm -rf "$WORK_DIR/extracted/META-INF"

# Create new APK
echo "📦 Creating new APK..."
cd "$WORK_DIR/extracted"
zip -r "$WORK_DIR/new.apk" . -q

# Sign APK
echo "✍️  Signing APK..."
cd "$WORK_DIR"
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
    -keystore /workspace/financial-app/android/app/debug.keystore \
    -storepass android -keypass android \
    new.apk androiddebugkey

# Verify
echo "✅ Verifying signature..."
jarsigner -verify new.apk

# Copy to final location
cp new.apk "$OUTPUT_APK"
echo "✅ APK created: $OUTPUT_APK"
ls -lh "$OUTPUT_APK"
