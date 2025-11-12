#!/bin/bash

# tmpfiles.org වලට APK Upload කිරීමේ Script
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
echo -e "${CYAN}   tmpfiles.org වලට APK Upload කරනවා${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo -e "${RED}❌ curl command හොයාගන්න බැහැ${NC}"
    echo "curl install කරන්න:"
    echo "  Ubuntu/Debian: sudo apt-get install curl"
    echo "  Mac: brew install curl"
    echo "  Windows: Download from https://curl.se/"
    exit 1
fi

# APK file එක හොයන්න
echo -e "${BLUE}📋 Step 1: APK file එක හොයනවා...${NC}"

# Check for built APK
if [ -f "මුදල්-කළමනාකරණ-v1.0.apk" ]; then
    APK_FILE="මුදල්-කළමනාකරණ-v1.0.apk"
    echo -e "${GREEN}   ✅ හොයාගත්තා: $APK_FILE${NC}"
elif [ -f "මුදල් කළමනාකරණ_1.0.apk" ]; then
    APK_FILE="මුදල් කළමනාකරණ_1.0.apk"
    echo -e "${GREEN}   ✅ හොයාගත්තා: $APK_FILE${NC}"
elif [ -f "android/app/build/outputs/apk/release/app-release.apk" ]; then
    APK_FILE="android/app/build/outputs/apk/release/app-release.apk"
    echo -e "${GREEN}   ✅ හොයාගත්තා: $APK_FILE${NC}"
else
    echo -e "${RED}❌ APK file එක හොයාගන්න බැහැ${NC}"
    echo ""
    echo "පළමුව APK build කරන්න:"
    echo "  ./COMPLETE_SETUP.sh"
    echo ""
    echo "හෝ APK file එක මෙම folder එකට copy කරන්න"
    exit 1
fi

# File size පෙන්වන්න
FILE_SIZE=$(du -h "$APK_FILE" | cut -f1)
echo -e "${BLUE}   📏 File size: $FILE_SIZE${NC}"

# Upload කරන්න
echo ""
echo -e "${BLUE}📋 Step 2: tmpfiles.org වලට upload කරනවා...${NC}"
echo -e "${YELLOW}   ⏳ මෙය මිනිත්තු කීපයක් ගත වනු ඇත...${NC}"
echo ""

# Upload to tmpfiles.org
RESPONSE=$(curl -F "file=@$APK_FILE" https://tmpfiles.org/api/v1/upload 2>/dev/null)

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Upload එක අසාර්ථකයි${NC}"
    echo ""
    echo "හේතු:"
    echo "  • Internet connection එක check කරන්න"
    echo "  • tmpfiles.org site එක down ද බලන්න"
    echo "  • File size වැඩිද (limit 100MB)"
    exit 1
fi

# Parse response
if echo "$RESPONSE" | grep -q "url"; then
    # Extract URL from JSON response
    TEMP_URL=$(echo "$RESPONSE" | grep -o '"url":"[^"]*' | cut -d'"' -f4)
    
    # Convert tmpfiles.org URL to direct download URL
    # tmpfiles.org/xxxxx -> tmpfiles.org/dl/xxxxx
    DOWNLOAD_URL=$(echo "$TEMP_URL" | sed 's/tmpfiles.org\//tmpfiles.org\/dl\//')
    
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}🎉 සාර්ථකයි! Upload සම්පූර්ණයි!${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo -e "${CYAN}📥 Download Link:${NC}"
    echo -e "${GREEN}$DOWNLOAD_URL${NC}"
    echo ""
    echo -e "${BLUE}📋 Additional Info:${NC}"
    echo "   • View Page: $TEMP_URL"
    echo "   • Direct Download: $DOWNLOAD_URL"
    echo "   • File Size: $FILE_SIZE"
    echo "   • Expires: Never (permanent)"
    echo ""
    echo -e "${CYAN}📤 Share කරන්න:${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "WhatsApp/Telegram Message:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🎉 මුදල් කළමනාකරණ යෙදුම Download කරගන්න!"
    echo ""
    echo "💰 සම්පූර්ණයෙන්ම සිංහල interface!"
    echo ""
    echo "Features:"
    echo "✅ බැංකු ගිණුම් tracking"
    echo "✅ මුදල් ශේෂ කළමනාකරණය"
    echo "✅ Dashboard with balance"
    echo ""
    echo "📥 Download:"
    echo "$DOWNLOAD_URL"
    echo ""
    echo "📦 Version: 1.0 | Size: $FILE_SIZE"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    # Save link to file
    echo "$DOWNLOAD_URL" > download-link.txt
    echo "$TEMP_URL" >> download-link.txt
    echo -e "${GREEN}✅ Links saved to: download-link.txt${NC}"
    echo ""
    
    # Create QR code link
    QR_URL="https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=$DOWNLOAD_URL"
    echo -e "${BLUE}📱 QR Code:${NC}"
    echo "   $QR_URL"
    echo ""
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}සාර්ථකයි! Link එක ready! 🚀${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
else
    echo -e "${RED}❌ Upload response එක parse කරන්න බැහැ${NC}"
    echo ""
    echo "Response:"
    echo "$RESPONSE"
    echo ""
    echo "Manual upload කරන්න:"
    echo "  curl -F \"file=@$APK_FILE\" https://tmpfiles.org/api/v1/upload"
    exit 1
fi
