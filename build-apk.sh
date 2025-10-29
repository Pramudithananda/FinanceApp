#!/bin/bash

# Budget Tracker App - APK Build Script
# This script builds the React Native app and generates an APK file

echo "🚀 Starting APK build process for Budget Tracker App..."

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

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Install React Native CLI if not already installed
if ! command -v npx &> /dev/null; then
    echo "❌ npx is not available. Please install npm first."
    exit 1
fi

# Check if Android SDK is available
if [ -z "$ANDROID_HOME" ]; then
    echo "⚠️  ANDROID_HOME is not set. Please set up Android SDK."
    echo "   You can download Android Studio and set ANDROID_HOME environment variable."
    echo "   Or use an online build service like EAS Build or GitHub Actions."
fi

# Create Android project structure if it doesn't exist
if [ ! -d "android" ]; then
    echo "📱 Creating Android project structure..."
    npx react-native init TempProject --template react-native-template-typescript
    cp -r TempProject/android ./
    rm -rf TempProject
fi

# Build the APK
echo "🔨 Building APK..."
cd android

# Clean previous builds
./gradlew clean

# Build release APK
./gradlew assembleRelease

# Check if APK was created successfully
if [ -f "app/build/outputs/apk/release/app-release.apk" ]; then
    echo "✅ APK built successfully!"
    echo "📱 APK location: android/app/build/outputs/apk/release/app-release.apk"
    
    # Copy APK to root directory for easy access
    cp app/build/outputs/apk/release/app-release.apk ../BudgetTrackerApp.apk
    echo "📁 APK copied to: BudgetTrackerApp.apk"
    
    # Get file size
    APK_SIZE=$(du -h ../BudgetTrackerApp.apk | cut -f1)
    echo "📊 APK size: $APK_SIZE"
    
else
    echo "❌ APK build failed. Please check the error messages above."
    exit 1
fi

cd ..

echo "🎉 Build process completed!"
echo ""
echo "📋 Next steps:"
echo "1. Install the APK on your Android device"
echo "2. Enable 'Install from unknown sources' in your device settings"
echo "3. Transfer the APK file to your device and install it"
echo ""
echo "🔗 For online APK generation, you can use:"
echo "   - EAS Build (expo.dev)"
echo "   - GitHub Actions"
echo "   - Codemagic"
echo "   - Bitrise"