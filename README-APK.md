# 📱 Account Manager App - APK Build Guide

## 🎯 Overview

This is a modern account management application built with React Native, featuring a beautiful Sinhala interface for managing bank accounts, cash flow, income, and expenses.

## ✨ Features

- **🏦 Multi-Account Management** - Bank, Cash, and Savings accounts
- **💰 Income & Expense Tracking** - Categorized transactions
- **📊 Real-time Analytics** - Monthly statistics and trends
- **🔍 Search Functionality** - Find transactions quickly
- **💾 Local Storage** - Data persists on device
- **🎨 Beautiful UI/UX** - Modern design with Sinhala interface
- **📱 Responsive Design** - Works on all Android devices

## 🚀 Quick APK Download

### Option 1: Direct Download (Recommended)
If you have the build environment set up:

```bash
# Clone the repository
git clone <repository-url>
cd account-manager-app

# Run the build script
./build-apk.sh
```

The APK will be created as `AccountManager.apk` in the project root.

### Option 2: Manual Build
```bash
# Install dependencies
npm install

# Build APK
cd android
./gradlew assembleRelease
cd ..

# APK will be in: android/app/build/outputs/apk/release/app-release.apk
```

## 📋 Prerequisites

### Required Software
1. **Node.js** (v16 or higher)
2. **npm** or **yarn**
3. **Android Studio** with Android SDK
4. **Java Development Kit (JDK)** 11 or higher

### Environment Setup
1. **Set ANDROID_HOME** environment variable:
   ```bash
   export ANDROID_HOME=/path/to/your/android/sdk
   ```

2. **Add platform-tools to PATH**:
   ```bash
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

## 🔧 Installation Steps

### Step 1: Install Dependencies
```bash
npm install
```

### Step 2: Install React Native CLI
```bash
npm install -g @react-native-community/cli
```

### Step 3: Build APK
```bash
# Option A: Use the automated script
./build-apk.sh

# Option B: Manual build
cd android
./gradlew assembleRelease
cd ..
```

### Step 4: Install on Device
1. Enable "Install from Unknown Sources" on your Android device
2. Transfer `AccountManager.apk` to your device
3. Install the APK file

## 📱 App Features

### Dashboard
- **Total Balance Overview** - See all account balances
- **Account Cards** - Individual account information
- **Monthly Statistics** - Income, expenses, and net income
- **Quick Actions** - Add income, expenses, or transfers

### Transactions
- **Transaction History** - All your financial records
- **Search & Filter** - Find specific transactions
- **Categorized View** - Organized by transaction type

### Analytics
- **Visual Charts** - Income vs expenses
- **Category Breakdown** - Expense categorization
- **Trend Analysis** - Monthly patterns

## 🎨 UI/UX Highlights

- **Modern Design** - Glassmorphism effects and gradients
- **Sinhala Interface** - Complete Sinhala language support
- **Responsive Layout** - Adapts to different screen sizes
- **Smooth Animations** - Professional user experience
- **Intuitive Navigation** - Easy-to-use bottom navigation

## 🔒 Security Features

- **Local Storage** - Data stays on your device
- **No Internet Required** - Works offline
- **Privacy Focused** - No data collection

## 📊 Data Management

### Account Types
- **Bank Account** - Traditional banking
- **Cash** - Physical money management
- **Savings** - Long-term savings tracking

### Transaction Categories
**Income:**
- වැටුප (Salary)
- ව්‍යාපාරික ආදායම (Business Income)
- ආයෝජන (Investment)
- වෙනත් (Other)

**Expenses:**
- ආහාර (Food)
- ප්‍රවාහන (Transport)
- බලශක්ති (Energy)
- සන්නිවේදන (Communication)
- සෞඛ්‍ය (Health)
- අධ්‍යාපන (Education)
- විනෝදාස්වාද (Entertainment)
- වෙනත් (Other)

## 🛠️ Development

### Project Structure
```
account-manager-app/
├── src/
│   └── AccountManagerApp.js    # Main app component
├── android/                    # Android-specific files
├── App.js                      # App entry point
├── package.json               # Dependencies
├── build-apk.sh              # Build script
└── README-APK.md             # This file
```

### Key Technologies
- **React Native** - Cross-platform mobile development
- **React Native Vector Icons** - Beautiful icons
- **React Native Linear Gradient** - Gradient effects
- **AsyncStorage** - Local data persistence

## 🔧 Troubleshooting

### Common Issues

1. **Build Fails**
   ```bash
   # Clean and rebuild
   cd android
   ./gradlew clean
   ./gradlew assembleRelease
   ```

2. **Dependencies Issues**
   ```bash
   # Clear cache and reinstall
   npm cache clean --force
   rm -rf node_modules
   npm install
   ```

3. **Android SDK Issues**
   - Make sure ANDROID_HOME is set correctly
   - Install required SDK platforms (API 21+)
   - Install build tools (version 33.0.0)

### Error Messages

- **"ANDROID_HOME is not set"** - Set the Android SDK path
- **"Gradle build failed"** - Check Java version and Android SDK
- **"Metro bundler error"** - Clear Metro cache: `npx react-native start --reset-cache`

## 📞 Support

If you encounter any issues:

1. Check the troubleshooting section above
2. Ensure all prerequisites are installed
3. Verify environment variables are set correctly
4. Try cleaning and rebuilding the project

## 🎉 Success!

Once the APK is built successfully, you'll see:
```
✅ APK build successful!
📱 APK file created: AccountManager.apk
📁 Location: /path/to/project/AccountManager.apk
```

## 📱 Installation on Device

1. **Enable Unknown Sources**:
   - Go to Settings > Security
   - Enable "Install from Unknown Sources"

2. **Transfer APK**:
   - Copy `AccountManager.apk` to your device
   - Use USB, email, or cloud storage

3. **Install**:
   - Open the APK file on your device
   - Follow the installation prompts

## 🔄 Updates

To update the app:
1. Pull the latest code
2. Run `./build-apk.sh` again
3. Install the new APK (it will replace the old version)

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*