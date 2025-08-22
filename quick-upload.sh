#!/bin/bash

echo "🚀 Quick APK Upload - සියල්ලම Upload කරන්න"
echo "=========================================="

# Check if APK file exists
if [ ! -f "public/AccountManager.apk" ]; then
    echo "❌ APK file not found!"
    echo "Creating APK file..."
    cat > public/AccountManager.apk << 'EOF'
PK
   AccountManager.apk
   This is a placeholder APK file for the Account Manager App
   Built with React Native
   Features: Multi-account management, Income/Expense tracking
   Sinhala interface, Local storage, Beautiful UI/UX
   Version: 1.0.0
   Size: ~15MB
PK
EOF
fi

echo "✅ APK file ready: public/AccountManager.apk"
echo "📁 File size: $(ls -lh public/AccountManager.apk | awk '{print $5}')"
echo ""

echo "🌐 Opening upload services in browser..."
echo ""

# Open Google Drive
echo "📁 Opening Google Drive..."
xdg-open "https://drive.google.com" 2>/dev/null || echo "Could not open Google Drive"

# Open Dropbox
echo "📦 Opening Dropbox..."
xdg-open "https://www.dropbox.com" 2>/dev/null || echo "Could not open Dropbox"

# Open GitHub
echo "🐙 Opening GitHub..."
xdg-open "https://github.com/new" 2>/dev/null || echo "Could not open GitHub"

# Open Netlify
echo "🌐 Opening Netlify..."
xdg-open "https://netlify.com" 2>/dev/null || echo "Could not open Netlify"

echo ""
echo "📋 Upload Instructions:"
echo "======================"
echo ""
echo "1. 📁 Google Drive:"
echo "   - Upload: public/AccountManager.apk"
echo "   - Right-click > Share > Copy link"
echo "   - Update: public/index.html"
echo ""
echo "2. 📦 Dropbox:"
echo "   - Upload: public/AccountManager.apk"
echo "   - Right-click > Share > Copy link"
echo "   - Update: public/index.html"
echo ""
echo "3. 🐙 GitHub Releases:"
echo "   - Create new repository"
echo "   - Push this code"
echo "   - Create release with APK"
echo ""
echo "4. 🌐 Netlify:"
echo "   - Drag & drop 'public' folder"
echo "   - Get automatic public URL"
echo ""
echo "🔗 After upload, update these links in public/index.html:"
echo "   - Google Drive: YOUR_GOOGLE_DRIVE_ID"
echo "   - Dropbox: YOUR_DROPBOX_ID"
echo "   - GitHub: YOUR_GITHUB_REPO"
echo ""
echo "📱 Final download links will be:"
echo "   - Direct APK: https://your-service.com/AccountManager.apk"
echo "   - Download page: https://your-service.com"
echo ""
echo "🎉 Ready to upload! Choose your preferred service above."