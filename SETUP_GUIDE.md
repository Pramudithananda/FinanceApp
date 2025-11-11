# 🚀 Setup Guide - මුදල් කළමනාකරණ Mobile App

Complete step-by-step guide to set up and run the Finance Management mobile application.

## 📋 Table of Contents

1. [System Requirements](#system-requirements)
2. [Development Environment Setup](#development-environment-setup)
3. [Project Installation](#project-installation)
4. [Running the App](#running-the-app)
5. [Building APK](#building-apk)
6. [Troubleshooting](#troubleshooting)

---

## 1️⃣ System Requirements

### For Windows Users

- **Operating System**: Windows 10 or higher (64-bit)
- **RAM**: Minimum 8GB (16GB recommended)
- **Storage**: At least 10GB free space
- **Internet**: Stable connection for downloads

### For Mac Users

- **Operating System**: macOS 10.15 (Catalina) or higher
- **RAM**: Minimum 8GB (16GB recommended)
- **Storage**: At least 20GB free space (for iOS development)
- **Internet**: Stable connection for downloads

### For Linux Users

- **Operating System**: Ubuntu 18.04 LTS or higher
- **RAM**: Minimum 8GB
- **Storage**: At least 10GB free space
- **Internet**: Stable connection for downloads

---

## 2️⃣ Development Environment Setup

### Step 1: Install Node.js

#### Windows & Mac:
1. Visit https://nodejs.org/
2. Download the LTS version (v18.x or higher)
3. Run the installer
4. Verify installation:
```bash
node --version
npm --version
```

#### Linux:
```bash
# Using NodeSource
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Verify
node --version
npm --version
```

### Step 2: Install Java Development Kit (JDK)

#### Windows:
1. Download JDK 11 from: https://www.oracle.com/java/technologies/downloads/
2. Install and set JAVA_HOME environment variable:
   - Open "Environment Variables"
   - Add new System Variable:
     - Name: `JAVA_HOME`
     - Value: `C:\Program Files\Java\jdk-11.x.x`
   - Add to Path: `%JAVA_HOME%\bin`

#### Mac:
```bash
# Using Homebrew
brew install openjdk@11

# Set JAVA_HOME in ~/.zshrc or ~/.bash_profile
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v11)' >> ~/.zshrc
source ~/.zshrc
```

#### Linux:
```bash
sudo apt update
sudo apt install openjdk-11-jdk
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
source ~/.bashrc
```

### Step 3: Install Android Studio

#### All Platforms:

1. **Download Android Studio**
   - Visit: https://developer.android.com/studio
   - Download for your operating system
   - Install following the wizard

2. **Install Android SDK**
   - Open Android Studio
   - Go to: Tools → SDK Manager
   - Install:
     - Android SDK Platform 33 (Android 13)
     - Android SDK Build-Tools 33.x.x
     - Android SDK Command-line Tools
     - Android Emulator
     - Android SDK Platform-Tools

3. **Set Environment Variables**

   **Windows** (Add to System Environment Variables):
   ```
   ANDROID_HOME = C:\Users\YourUsername\AppData\Local\Android\Sdk
   
   Add to Path:
   %ANDROID_HOME%\platform-tools
   %ANDROID_HOME%\emulator
   %ANDROID_HOME%\tools
   %ANDROID_HOME%\tools\bin
   ```

   **Mac/Linux** (Add to ~/.zshrc or ~/.bashrc):
   ```bash
   export ANDROID_HOME=$HOME/Library/Android/sdk  # Mac
   # export ANDROID_HOME=$HOME/Android/Sdk  # Linux
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/tools/bin
   ```

4. **Create Android Virtual Device (AVD)**
   - Open Android Studio
   - Tools → Device Manager
   - Create Device
   - Select: Pixel 5 (or any modern device)
   - System Image: API 33 (Android 13)
   - Finish

### Step 4: Install React Native CLI

```bash
npm install -g react-native-cli
```

### Step 5: For iOS Development (Mac Only)

```bash
# Install Xcode from App Store (free)

# Install CocoaPods
sudo gem install cocoapods

# Install iOS Simulator
xcode-select --install
```

---

## 3️⃣ Project Installation

### Step 1: Navigate to Project

```bash
cd /path/to/workspace
# or
cd /path/to/FinanceManagementApp
```

### Step 2: Install Dependencies

```bash
# Using npm
npm install

# OR using yarn
yarn install
```

This will install:
- React Native framework
- AsyncStorage for data persistence
- All required development dependencies

### Step 3: iOS Setup (Mac Only)

```bash
cd ios
pod install
cd ..
```

---

## 4️⃣ Running the App

### Method 1: Using React Native CLI

#### Android:

**Option A: Using Emulator**
```bash
# Start Metro Bundler (Terminal 1)
npm start

# In a new terminal (Terminal 2)
npm run android
```

**Option B: Using Physical Device**
1. Enable USB Debugging on your Android phone:
   - Settings → About Phone
   - Tap "Build Number" 7 times
   - Go back → Developer Options
   - Enable "USB Debugging"
2. Connect phone via USB
3. Run:
```bash
npm run android
```

#### iOS (Mac Only):

```bash
# Start Metro Bundler (Terminal 1)
npm start

# In a new terminal (Terminal 2)
npm run ios
```

### Method 2: Manual Start

#### Terminal 1 - Start Metro Bundler:
```bash
npm start
# or
npx react-native start
```

#### Terminal 2 - Run on Device:
```bash
# Android
npx react-native run-android

# iOS
npx react-native run-ios
```

### Troubleshooting Quick Fixes

**If Metro won't start:**
```bash
npm start -- --reset-cache
```

**If app won't install:**
```bash
# Android
cd android && ./gradlew clean && cd ..
npm run android

# iOS
cd ios && pod install && cd ..
npm run ios
```

---

## 5️⃣ Building APK for Distribution

### Debug APK (For Testing)

```bash
cd android
./gradlew assembleDebug
cd ..
```

**Output Location**: `android/app/build/outputs/apk/debug/app-debug.apk`

### Release APK (For Production)

#### Step 1: Generate Signing Key

```bash
cd android/app
keytool -genkeypair -v -storetype PKCS12 -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

Enter details when prompted:
- Password: (create a strong password)
- Name, Organization, etc.

#### Step 2: Configure Gradle

Edit `android/gradle.properties`:
```properties
MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
MYAPP_RELEASE_KEY_ALIAS=my-key-alias
MYAPP_RELEASE_STORE_PASSWORD=your-password
MYAPP_RELEASE_KEY_PASSWORD=your-password
```

Edit `android/app/build.gradle`:
```gradle
android {
    ...
    signingConfigs {
        release {
            if (project.hasProperty('MYAPP_RELEASE_STORE_FILE')) {
                storeFile file(MYAPP_RELEASE_STORE_FILE)
                storePassword MYAPP_RELEASE_STORE_PASSWORD
                keyAlias MYAPP_RELEASE_KEY_ALIAS
                keyPassword MYAPP_RELEASE_KEY_PASSWORD
            }
        }
    }
    buildTypes {
        release {
            ...
            signingConfig signingConfigs.release
        }
    }
}
```

#### Step 3: Build Release APK

```bash
cd android
./gradlew assembleRelease
cd ..
```

**Output Location**: `android/app/build/outputs/apk/release/app-release.apk`

#### Step 4: Install on Device

```bash
# Connect Android device via USB
adb install android/app/build/outputs/apk/release/app-release.apk
```

---

## 6️⃣ Troubleshooting

### Common Issues & Solutions

#### Issue 1: "SDK location not found"
**Solution:**
```bash
# Create local.properties in android/
echo "sdk.dir=/path/to/Android/Sdk" > android/local.properties

# Windows example:
# sdk.dir=C:\\Users\\YourName\\AppData\\Local\\Android\\Sdk

# Mac/Linux example:
# sdk.dir=/Users/YourName/Library/Android/sdk
```

#### Issue 2: "Port 8081 already in use"
**Solution:**
```bash
# Windows
npx react-native start --port=8082

# Mac/Linux
lsof -ti:8081 | xargs kill -9
npm start
```

#### Issue 3: Metro Bundler cache issues
**Solution:**
```bash
npm start -- --reset-cache
# or
watchman watch-del-all
rm -rf node_modules/
npm install
npm start -- --reset-cache
```

#### Issue 4: Android build fails
**Solution:**
```bash
cd android
./gradlew clean
./gradlew --stop
cd ..
npm run android
```

#### Issue 5: "Unable to load script"
**Solution:**
```bash
# Make sure Metro is running
npm start

# In new terminal
npm run android
```

#### Issue 6: Emulator won't start
**Solution:**
```bash
# List available emulators
emulator -list-avds

# Start specific emulator
emulator -avd Pixel_5_API_33
```

### Getting Help

1. **Check Logs**:
   ```bash
   # Android
   adb logcat

   # React Native
   npx react-native log-android
   npx react-native log-ios
   ```

2. **Clear Everything** (Nuclear option):
   ```bash
   # Stop Metro
   # Close emulator
   watchman watch-del-all
   rm -rf node_modules/
   rm -rf android/build/
   rm -rf android/app/build/
   npm install
   cd android && ./gradlew clean && cd ..
   npm start -- --reset-cache
   ```

3. **React Native Doctor**:
   ```bash
   npx react-native doctor
   ```

---

## 📱 Testing on Real Device

### Android USB Debugging

1. **Enable Developer Options**:
   - Settings → About Phone
   - Tap "Build Number" 7 times
   
2. **Enable USB Debugging**:
   - Settings → Developer Options
   - Enable "USB Debugging"
   
3. **Connect & Verify**:
   ```bash
   adb devices
   # You should see your device listed
   ```

4. **Run App**:
   ```bash
   npm run android
   ```

### Android Wireless Debugging (Android 11+)

1. **Enable Wireless Debugging**:
   - Settings → Developer Options
   - Enable "Wireless Debugging"
   
2. **Pair Device**:
   ```bash
   adb pair <ip>:<port>
   # Enter pairing code shown on phone
   ```
   
3. **Connect**:
   ```bash
   adb connect <ip>:<port>
   ```

---

## 🎯 Quick Start Checklist

- [ ] Node.js installed (v16+)
- [ ] JDK 11 installed
- [ ] Android Studio installed
- [ ] Android SDK configured
- [ ] Environment variables set (ANDROID_HOME, JAVA_HOME)
- [ ] AVD created
- [ ] Project dependencies installed (`npm install`)
- [ ] Metro bundler starts successfully (`npm start`)
- [ ] App runs on emulator/device (`npm run android`)

---

## 🎉 Success!

If you've completed all steps, you should now see:
- Metro Bundler running on port 8081
- App installed on your emulator/device
- Finance Management app with Sinhala UI
- Bottom navigation working
- Account cards displaying properly

**Congratulations! ඔබට ස්තූතියි!** 🎊

---

## 📞 Additional Resources

- React Native Docs: https://reactnative.dev/
- Android Developer: https://developer.android.com/
- Stack Overflow: https://stackoverflow.com/questions/tagged/react-native
- React Native Community: https://github.com/react-native-community

**Version**: 1.0.0  
**Last Updated**: 2025-11-11
