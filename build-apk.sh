#!/bin/bash

# APK Build කිරීමේ Automated Script
# මුදල් කළමනාකරණ යෙදුම

echo "🚀 APK Build Process ආරම්භ වෙනවා..."
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo -e "${RED}❌ Error: package.json file එක හොයාගන්න බැහැ${NC}"
    echo "කරුණාකර project root directory එකේ සිටින්න"
    exit 1
fi

echo -e "${BLUE}📋 Step 1: Dependencies පරීක්ෂා කරනවා...${NC}"
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}⚠️  node_modules නැහැ. Dependencies install කරනවා...${NC}"
    npm install
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ Dependencies install කිරීම අසාර්ථකයි${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ Dependencies install කළා${NC}"
else
    echo -e "${GREEN}✅ node_modules තියෙනවා${NC}"
fi

echo ""
echo -e "${BLUE}📋 Step 2: Android project එක පරීක්ෂා කරනවා...${NC}"
if [ ! -d "android" ]; then
    echo -e "${RED}❌ Error: android/ folder එක නැහැ${NC}"
    echo ""
    echo "React Native project එකක් initialize කරන්න ඕන:"
    echo "  npx react-native init FinanceApp --version 0.73.0"
    echo ""
    echo "විස්තර සඳහා BUILD_APK_GUIDE.md බලන්න"
    exit 1
fi
echo -e "${GREEN}✅ Android project තියෙනවා${NC}"

echo ""
echo -e "${BLUE}📋 Step 3: Android build folder එක clean කරනවා...${NC}"
cd android
./gradlew clean
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Clean අසාර්ථකයි${NC}"
    cd ..
    exit 1
fi
echo -e "${GREEN}✅ Clean කළා${NC}"

echo ""
echo -e "${BLUE}📋 Step 4: Release APK build කරනවා...${NC}"
echo "⏳ මෙය කිහිපයක් මිනිත්තු ගත වනු ඇත..."
./gradlew assembleRelease
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ APK build අසාර්ථකයි${NC}"
    cd ..
    exit 1
fi

cd ..
echo -e "${GREEN}✅ APK build කළා!${NC}"

echo ""
echo -e "${BLUE}📋 Step 5: APK file එක copy කරනවා...${NC}"
APK_SOURCE="android/app/build/outputs/apk/release/app-release.apk"
APK_DEST="මුදල්-කළමනාකරණ-v1.0.apk"

if [ -f "$APK_SOURCE" ]; then
    cp "$APK_SOURCE" "$APK_DEST"
    APK_SIZE=$(du -h "$APK_DEST" | cut -f1)
    echo -e "${GREEN}✅ APK file එක copy කළා${NC}"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}🎉 සාර්ථකයි! APK Build සම්පූර්ණයි!${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo -e "${BLUE}📱 APK File Details:${NC}"
    echo "   📂 ස්ථානය: $(pwd)/$APK_DEST"
    echo "   📏 ප්‍රමාණය: $APK_SIZE"
    echo ""
    echo -e "${BLUE}📥 ඊළඟ පියවර:${NC}"
    echo "   1. APK file එක phone එකට transfer කරන්න"
    echo "   2. Phone එකේ APK එක open කරන්න"
    echo "   3. Install කරන්න"
    echo ""
    echo -e "${YELLOW}⚠️  සටහන:${NC}"
    echo "   • 'Install from Unknown Sources' enable කරන්න ඕන විය හැක"
    echo "   • Security warning එකක් ආවොත් 'Install Anyway' click කරන්න"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
    echo -e "${RED}❌ APK file එක හොයාගන්න බැහැ${NC}"
    exit 1
fi
