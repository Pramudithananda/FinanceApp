#!/bin/bash

# සම්පූර්ණ React Native Setup සහ APK Build Script
# මුදල් කළමනාකරණ යෙදුම

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${CYAN}   මුදල් කළමනාකරණ යෙදුම${NC}"
echo -e "${CYAN}   Complete Setup & Build Script${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

PROJECT_NAME="FinanceApp"
WORKSPACE_DIR=$(pwd)

# පියවර 1: Prerequisites පරීක්ෂා කරන්න
echo -e "${BLUE}📋 පියවර 1/7: Prerequisites පරීක්ෂා කරනවා...${NC}"

# Node.js check
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js හොයාගන්න බැහැ${NC}"
    echo "Node.js install කරන්න: https://nodejs.org/"
    exit 1
fi
NODE_VERSION=$(node --version)
echo -e "${GREEN}   ✅ Node.js: $NODE_VERSION${NC}"

# npm check
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm හොයාගන්න බැහැ${NC}"
    exit 1
fi
NPM_VERSION=$(npm --version)
echo -e "${GREEN}   ✅ npm: $NPM_VERSION${NC}"

# Java check
if ! command -v java &> /dev/null; then
    echo -e "${YELLOW}⚠️  Java හොයාගන්න බැහැ${NC}"
    echo "   JDK install කරන්න: https://www.oracle.com/java/technologies/downloads/"
else
    JAVA_VERSION=$(java -version 2>&1 | head -n 1)
    echo -e "${GREEN}   ✅ Java: $JAVA_VERSION${NC}"
fi

# ANDROID_HOME check
if [ -z "$ANDROID_HOME" ]; then
    echo -e "${YELLOW}⚠️  ANDROID_HOME environment variable set කරලා නැහැ${NC}"
    echo "   Android Studio install කරලා ANDROID_HOME set කරන්න"
    echo "   විස්තර: SETUP_GUIDE.md බලන්න"
else
    echo -e "${GREEN}   ✅ ANDROID_HOME: $ANDROID_HOME${NC}"
fi

echo ""
read -p "Continue කරන්නද? (y/n): " CONTINUE
if [ "$CONTINUE" != "y" ] && [ "$CONTINUE" != "Y" ]; then
    echo "Setup එක cancel කළා"
    exit 0
fi

# පියවර 2: React Native CLI Install කරන්න
echo ""
echo -e "${BLUE}📋 පියවර 2/7: React Native CLI පරීක්ෂා කරනවා...${NC}"
if ! command -v react-native &> /dev/null; then
    echo -e "${YELLOW}⚠️  React Native CLI හොයාගන්න බැහැ. Install කරනවා...${NC}"
    npm install -g react-native-cli
    echo -e "${GREEN}   ✅ React Native CLI install කළා${NC}"
else
    echo -e "${GREEN}   ✅ React Native CLI තියෙනවා${NC}"
fi

# පියවර 3: React Native Project Create කරන්න
echo ""
echo -e "${BLUE}📋 පියවර 3/7: React Native Project create කරනවා...${NC}"
echo "   ⏳ මෙය කිහිපයක් මිනිත්තු ගත වනු ඇත..."

cd ..
npx react-native@0.73.0 init $PROJECT_NAME --version 0.73.0

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Project creation අසාර්ථකයි${NC}"
    exit 1
fi

echo -e "${GREEN}   ✅ React Native project create කළා${NC}"

# පියවර 4: අපේ Code Copy කරන්න
echo ""
echo -e "${BLUE}📋 පියවර 4/7: Source code copy කරනවා...${NC}"

cd $PROJECT_NAME

# Copy main source files
cp "$WORKSPACE_DIR/src/App.js" ./src/App.js
cp "$WORKSPACE_DIR/index.js" ./index.js
cp "$WORKSPACE_DIR/app.json" ./app.json

echo -e "${GREEN}   ✅ Source files copy කළා${NC}"

# පියවර 5: Dependencies Install කරන්න
echo ""
echo -e "${BLUE}📋 පියවර 5/7: Dependencies install කරනවා...${NC}"

npm install react-native-vector-icons@^10.0.3

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Dependencies install අසාර්ථකයි${NC}"
    exit 1
fi

echo -e "${GREEN}   ✅ Dependencies install කළා${NC}"

# පියවර 6: Vector Icons Setup කරන්න
echo ""
echo -e "${BLUE}📋 පියවර 6/7: Vector Icons configure කරනවා...${NC}"

# Android build.gradle update කරන්න
BUILD_GRADLE="android/app/build.gradle"
if ! grep -q "react-native-vector-icons" "$BUILD_GRADLE"; then
    echo "" >> "$BUILD_GRADLE"
    echo 'apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"' >> "$BUILD_GRADLE"
    echo -e "${GREEN}   ✅ Vector Icons configured${NC}"
else
    echo -e "${GREEN}   ✅ Vector Icons දැනටමත් configured${NC}"
fi

# පියවර 7: APK Build කරන්න
echo ""
echo -e "${BLUE}📋 පියවර 7/7: Release APK build කරනවා...${NC}"
echo "   ⏳ මෙය කිහිපයක් මිනිත්තු ගත වනු ඇත..."

cd android
./gradlew clean
./gradlew assembleRelease

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ APK build අසාර්ථකයි${NC}"
    cd ../..
    exit 1
fi

cd ..

# APK Copy කරන්න
APK_SOURCE="android/app/build/outputs/apk/release/app-release.apk"
APK_DEST="මුදල්-කළමනාකරණ-v1.0.apk"

if [ -f "$APK_SOURCE" ]; then
    cp "$APK_SOURCE" "$APK_DEST"
    
    # Original workspace එකටත් copy කරන්න
    cp "$APK_SOURCE" "$WORKSPACE_DIR/$APK_DEST"
    
    APK_SIZE=$(du -h "$APK_DEST" | cut -f1)
    
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}🎉 සාර්ථකයි! සියලු steps සම්පූර්ණයි!${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo -e "${CYAN}📱 ඔබේ Finance App APK Ready!${NC}"
    echo ""
    echo -e "${BLUE}📂 APK Locations:${NC}"
    echo "   1. $(pwd)/$APK_DEST"
    echo "   2. $WORKSPACE_DIR/$APK_DEST"
    echo ""
    echo -e "${BLUE}📏 APK Size:${NC} $APK_SIZE"
    echo ""
    echo -e "${BLUE}📥 ඊළඟ පියවර:${NC}"
    echo "   1. APK file එක phone එකට transfer කරන්න"
    echo "   2. Phone එකේ 'Unknown Sources' enable කරන්න"
    echo "   3. APK file එක tap කරලා install කරන්න"
    echo "   4. App එක open කරලා enjoy කරන්න!"
    echo ""
    echo -e "${BLUE}🚀 Development Commands:${NC}"
    echo "   cd $(pwd)"
    echo "   npm start              # Metro bundler start කරන්න"
    echo "   npm run android        # Android එකේ run කරන්න"
    echo "   npm run ios            # iOS එකේ run කරන්න (Mac only)"
    echo ""
    echo -e "${YELLOW}⚠️  සටහන:${NC}"
    echo "   • Phone එකේ 'Install from Unknown Sources' enable කරන්න ඕන විය හැක"
    echo "   • Security warning එකක් ආවොත් 'Install Anyway' click කරන්න"
    echo "   • APK signed නැහැ (development only)"
    echo "   • Play Store එකට upload කරන්න නම් sign කරන්න ඕන"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}සාර්ථක APK build කිරීමක් වේවා! 🎉${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
else
    echo -e "${RED}❌ APK file එක හොයාගන්න බැහැ${NC}"
    cd ..
    exit 1
fi
