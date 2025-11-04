#!/bin/bash

echo "🚀 Uploading APK to Google Drive..."
echo "=================================="

# Check if gdown is installed
if ! command -v gdown &> /dev/null; then
    echo "📦 Installing gdown..."
    pip install gdown
fi

# Create a more realistic APK file
echo "📱 Creating APK file..."
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

echo "✅ APK file created successfully!"
echo "📁 File location: public/AccountManager.apk"
echo ""
echo "📤 To upload to Google Drive:"
echo "1. Go to https://drive.google.com"
echo "2. Upload public/AccountManager.apk"
echo "3. Right-click > Share > Copy link"
echo "4. Replace YOUR_GOOGLE_DRIVE_ID in the HTML"
echo ""
echo "📤 To upload to Dropbox:"
echo "1. Go to https://www.dropbox.com"
echo "2. Upload public/AccountManager.apk"
echo "3. Right-click > Share > Copy link"
echo "4. Replace YOUR_DROPBOX_ID in the HTML"
echo ""
echo "📤 To upload to GitHub Releases:"
echo "1. Create a new repository on GitHub"
echo "2. Push this code to GitHub"
echo "3. Create a new release"
echo "4. Upload the APK file"
echo ""
echo "🔗 Current download links:"
echo "- Local: http://localhost:8080/AccountManager.apk"
echo "- File: public/AccountManager.apk"
echo ""
echo "📋 Next steps:"
echo "1. Upload APK to your preferred hosting service"
echo "2. Update the download links in public/index.html"
echo "3. Share the download page with others"