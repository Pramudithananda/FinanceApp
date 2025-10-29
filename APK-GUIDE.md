# 📱 APK Generation Guide - මුදල් කළමනාකරණ App

## 🎯 Overview

This guide provides multiple methods to generate a downloadable APK for your Sinhala Personal Finance Management App. Choose the method that best fits your technical setup and requirements.

## 🚀 Quick Start (Recommended)

### Option 1: Online Build Services (Easiest)

1. **EAS Build (Expo)**
   - Go to [expo.dev](https://expo.dev)
   - Create account and new project
   - Upload your React Native code
   - Configure Android build settings
   - Build APK in the cloud
   - Download APK directly

2. **Codemagic**
   - Visit [codemagic.io](https://codemagic.io)
   - Connect your GitHub repository
   - Configure React Native build
   - Build and download APK

3. **Bitrise**
   - Go to [bitrise.io](https://bitrise.io)
   - Connect repository
   - Use React Native template
   - Build APK

### Option 2: GitHub Actions (Free & Automated)

1. **Create GitHub Repository**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/budget-tracker-app.git
   git push -u origin main
   ```

2. **Create Workflow File**
   Create `.github/workflows/build-apk.yml`:
   ```yaml
   name: Build APK
   on: [push]
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v2
         - name: Setup Node.js
           uses: actions/setup-node@v2
           with:
             node-version: '16'
         - name: Install dependencies
           run: npm install
         - name: Setup Java
           uses: actions/setup-java@v2
           with:
             java-version: '11'
         - name: Setup Android SDK
           uses: android-actions/setup-android@v2
         - name: Build APK
           run: |
             cd android
             ./gradlew assembleRelease
         - name: Upload APK
           uses: actions/upload-artifact@v2
           with:
             name: app-release
             path: android/app/build/outputs/apk/release/app-release.apk
   ```

3. **Push to GitHub**
   ```bash
   git add .github/workflows/build-apk.yml
   git commit -m "Add APK build workflow"
   git push
   ```

4. **Download APK**
   - Go to Actions tab in your GitHub repository
   - Click on the latest workflow run
   - Download the APK from artifacts

### Option 3: Local Build (Advanced)

1. **Prerequisites**
   ```bash
   # Install Node.js (16+)
   # Install Android Studio
   # Set ANDROID_HOME environment variable
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

2. **Build APK**
   ```bash
   # Install dependencies
   npm install
   
   # Make build script executable
   chmod +x build-apk.sh
   
   # Run build script
   ./build-apk.sh
   ```

3. **APK Location**
   - `BudgetTrackerApp.apk` (in project root)
   - `android/app/build/outputs/apk/release/app-release.apk`

## 🌐 Web-Based APK Builder

### Using the Built-in Server

1. **Start the Server**
   ```bash
   # Install server dependencies
   npm install express cors multer
   
   # Start the server
   node server.js
   ```

2. **Access the Builder**
   - Open http://localhost:3000 in your browser
   - Use the web interface to generate APK download links
   - Upload your code or connect to GitHub

3. **Download APK**
   - Generate download link
   - Scan QR code with your phone
   - Download APK directly

## 📱 APK Features

- **App Name:** මුදල් කළමනාකරණ (Budget Tracker)
- **Package ID:** com.budgettrackerapp
- **Version:** 1.0.0
- **Target SDK:** Android 12+ (API 31+)
- **Min SDK:** Android 5.0 (API 21)
- **Size:** ~25 MB
- **Language:** Sinhala (සිංහල)

## 🔧 Troubleshooting

### Common Issues

1. **"ANDROID_HOME not set"**
   ```bash
   # Add to ~/.bashrc or ~/.zshrc
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   
   # Reload shell
   source ~/.bashrc
   ```

2. **"Gradle build failed"**
   ```bash
   # Clean project
   cd android
   ./gradlew clean
   
   # Try again
   ./gradlew assembleRelease
   ```

3. **"SDK not found"**
   - Install Android Studio
   - Open SDK Manager
   - Install Android SDK Platform 31
   - Install Android SDK Build-Tools 31.0.0

4. **"Java version error"**
   ```bash
   # Check Java version
   java -version
   
   # Should be Java 11 or 17
   # If not, install correct version
   ```

## 📥 APK Distribution

### Hosting Options

1. **GitHub Releases**
   - Create release with APK
   - Get permanent download link
   - Version control

2. **Google Drive**
   - Upload APK
   - Share public link
   - Easy access

3. **Firebase Hosting**
   - Host APK for download
   - Custom domain
   - Analytics

4. **Dropbox**
   - Upload APK
   - Create public link
   - Direct download

### Installation Instructions

1. **Enable Unknown Sources**
   - Go to Settings > Security
   - Enable "Install from unknown sources"
   - Or "Allow from this source" for specific apps

2. **Install APK**
   - Download APK to device
   - Tap on APK file
   - Follow installation prompts
   - Grant permissions if requested

3. **Launch App**
   - Find "මුදල් කළමනාකරණ" in app drawer
   - Tap to launch
   - Start managing your finances!

## 🎯 Next Steps

After generating your APK:

1. **Test on Multiple Devices**
   - Test on different Android versions
   - Check various screen sizes
   - Verify all features work

2. **App Signing (Production)**
   - Generate keystore for production
   - Sign APK with release key
   - Upload to Google Play Store

3. **Distribution**
   - Share APK with friends/family
   - Upload to app stores
   - Set up automatic updates

4. **Monitoring**
   - Track app usage
   - Monitor crashes
   - Collect user feedback

## 🆘 Support

If you encounter issues:

1. Check the troubleshooting section above
2. Verify all prerequisites are installed
3. Try different build methods
4. Check React Native documentation
5. Search for similar issues online

## 📊 Build Status

- ✅ React Native project structure
- ✅ Android configuration
- ✅ Build scripts
- ✅ Web-based builder
- ✅ Download server
- ✅ Documentation

## 🎉 Success!

Your APK is now ready! The app includes:

- 🏦 Bank balance tracking
- 💵 Cash management
- 📊 Expense categorization
- 📈 Budget planning
- 📱 Beautiful Sinhala interface
- 💾 Local data storage

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*