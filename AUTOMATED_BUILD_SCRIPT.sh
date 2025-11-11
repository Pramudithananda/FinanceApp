#!/bin/bash

###############################################################################
# 📦 Automated APK Build Script
# මුදල් කළමනාකරණ Mobile App
# 
# This script automates the APK building process
# මේ script එක APK build කිරීමේ process එක automate කරයි
###############################################################################

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 මුදල් කළමනාකරණ App - APK Build Script"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Function to print colored messages
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    print_error "package.json not found! Are you in the project root directory?"
    print_info "Please cd to /workspace or your project directory"
    exit 1
fi

print_success "Found package.json"

# Check if android folder exists
if [ ! -d "android" ]; then
    print_error "Android folder not found!"
    print_warning "You need to initialize React Native project first."
    echo ""
    print_info "Run these commands:"
    echo "  npx react-native init YourProjectName"
    echo "  Then copy your src/ folder and other files"
    echo ""
    print_info "Or use the Expo method (easier):"
    echo "  npm install -g expo-cli"
    echo "  npx create-expo-app YourProjectName"
    echo ""
    exit 1
fi

print_success "Found android folder"

# Menu for build type
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Select Build Type (Build එකක් තෝරන්න):"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "1) Debug APK (Testing සඳහා - Fast build)"
echo "2) Release APK (Distribution සඳහා - Optimized)"
echo "3) Clean Build (Problems නම් - Slow but thorough)"
echo "4) Exit"
echo ""
read -p "Enter choice [1-4]: " choice

case $choice in
    1)
        BUILD_TYPE="Debug"
        GRADLE_COMMAND="assembleDebug"
        APK_PATH="app/build/outputs/apk/debug/app-debug.apk"
        ;;
    2)
        BUILD_TYPE="Release"
        GRADLE_COMMAND="assembleRelease"
        APK_PATH="app/build/outputs/apk/release/app-release.apk"
        ;;
    3)
        BUILD_TYPE="Clean + Release"
        GRADLE_COMMAND="clean assembleRelease"
        APK_PATH="app/build/outputs/apk/release/app-release.apk"
        ;;
    4)
        print_info "Exiting..."
        exit 0
        ;;
    *)
        print_error "Invalid choice!"
        exit 1
        ;;
esac

echo ""
print_info "Selected: $BUILD_TYPE Build"
echo ""

# Navigate to android directory
cd android || exit 1

# Check if gradlew exists
if [ ! -f "gradlew" ]; then
    print_error "gradlew not found!"
    print_warning "Android project may not be properly initialized"
    exit 1
fi

# Make gradlew executable
chmod +x gradlew

print_info "Starting build process..."
print_warning "This may take 5-10 minutes on first build..."
echo ""

# Run gradle build
print_info "Running: ./gradlew $GRADLE_COMMAND"
echo ""

./gradlew $GRADLE_COMMAND --stacktrace

# Check if build was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    print_success "Build Successful! (Build සාර්ථකයි!)"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    # Check if APK exists
    if [ -f "$APK_PATH" ]; then
        APK_SIZE=$(du -h "$APK_PATH" | cut -f1)
        print_success "APK Created: $APK_PATH"
        print_info "APK Size: $APK_SIZE"
        echo ""
        
        # Copy to easier location
        DESKTOP_PATH="$HOME/Desktop/MudalKalamanakarna-$(date +%Y%m%d-%H%M%S).apk"
        DOWNLOAD_PATH="$HOME/Downloads/MudalKalamanakarna-$(date +%Y%m%d-%H%M%S).apk"
        
        echo "Copy APK to (APK copy කරන්න):"
        echo "1) Desktop"
        echo "2) Downloads folder"
        echo "3) Both"
        echo "4) Don't copy (Keep in build folder only)"
        echo ""
        read -p "Enter choice [1-4]: " copy_choice
        
        case $copy_choice in
            1)
                cp "$APK_PATH" "$DESKTOP_PATH"
                print_success "APK copied to Desktop!"
                print_info "Location: $DESKTOP_PATH"
                ;;
            2)
                cp "$APK_PATH" "$DOWNLOAD_PATH"
                print_success "APK copied to Downloads!"
                print_info "Location: $DOWNLOAD_PATH"
                ;;
            3)
                cp "$APK_PATH" "$DESKTOP_PATH"
                cp "$APK_PATH" "$DOWNLOAD_PATH"
                print_success "APK copied to both locations!"
                print_info "Desktop: $DESKTOP_PATH"
                print_info "Downloads: $DOWNLOAD_PATH"
                ;;
            4)
                print_info "APK remains in build folder"
                ;;
            *)
                print_warning "Invalid choice, APK remains in build folder"
                ;;
        esac
        
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        print_success "Next Steps (ඊළඟ පියවර):"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "1. 📱 Install on Device:"
        echo "   adb install $APK_PATH"
        echo ""
        echo "2. 📤 Share the APK:"
        echo "   - Upload to Google Drive"
        echo "   - Send via Email/WhatsApp"
        echo "   - Transfer to phone via USB"
        echo ""
        echo "3. 🏪 Submit to Play Store:"
        echo "   - Build AAB: ./gradlew bundleRelease"
        echo "   - Upload to Play Console"
        echo ""
        
    else
        print_error "APK file not found at expected location!"
        print_info "Check: android/$APK_PATH"
    fi
    
else
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    print_error "Build Failed! (Build අසාර්ථකයි!)"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    print_warning "Common solutions (සාමාන්‍ය විසඳුම්):"
    echo ""
    echo "1. Clean build and try again:"
    echo "   ./gradlew clean"
    echo "   ./gradlew assembleRelease"
    echo ""
    echo "2. Check SDK location:"
    echo "   echo \"sdk.dir=\$HOME/Library/Android/sdk\" > local.properties"
    echo ""
    echo "3. Update dependencies:"
    echo "   ./gradlew --refresh-dependencies"
    echo ""
    echo "4. Check error messages above for specific issues"
    echo ""
    exit 1
fi

echo ""
print_success "Done! (හරි!)"
echo ""
