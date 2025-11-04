#!/bin/bash

# Account Management App - APK Build Script
# මෙම script එක භාවිතා කරලා APK file එකක් build කරන්න පුළුවන් වෙයි

echo "🚀 Starting APK Build Process..."
echo "📱 Account Management App - APK Builder"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ Node.js and npm are installed"
echo "📦 Installing dependencies..."

# Install dependencies
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo "✅ Dependencies installed successfully"

# Check if Android SDK is available
if [ -z "$ANDROID_HOME" ]; then
    echo "⚠️  ANDROID_HOME is not set. Please set it to your Android SDK path."
    echo "   Example: export ANDROID_HOME=\$HOME/Library/Android/sdk"
    exit 1
fi

echo "✅ Android SDK found at: $ANDROID_HOME"

# Clean previous builds
echo "🧹 Cleaning previous builds..."
cd android
./gradlew clean
cd ..

if [ $? -ne 0 ]; then
    echo "❌ Failed to clean project"
    exit 1
fi

echo "✅ Project cleaned successfully"

# Build release APK
echo "🔨 Building release APK..."
cd android
./gradlew assembleRelease

if [ $? -ne 0 ]; then
    echo "❌ Failed to build APK"
    exit 1
fi

cd ..

echo "✅ APK built successfully!"

# Check if APK exists
APK_PATH="android/app/build/outputs/apk/release/app-release.apk"
if [ -f "$APK_PATH" ]; then
    echo "📱 APK file created at: $APK_PATH"
    echo "📊 APK size: $(du -h "$APK_PATH" | cut -f1)"
    echo ""
    echo "🎉 Build completed successfully!"
    echo ""
    echo "📋 Next steps:"
    echo "1. Copy the APK to your Android device"
    echo "2. Enable 'Install from Unknown Sources' in settings"
    echo "3. Tap the APK file to install"
    echo ""
    echo "🔧 To install via ADB:"
    echo "   adb install $APK_PATH"
else
    echo "❌ APK file not found at expected location"
    exit 1
fi

echo ""
echo "🚀 Happy coding! Your app is ready to use!"