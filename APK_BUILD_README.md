# 📱 Account Management App - APK Build Guide

මෙම ගයිඩ් එක භාවිතා කරලා ඔබට සම්පූර්ණ වැඩ කරන APK file එකක් හදන්න පුළුවන් වෙයි.

## 🚀 Quick Start - APK Build

### Prerequisites (අවශ්‍ය මූලික කරුණු)

1. **Node.js** (version 16 or higher)
2. **Java Development Kit (JDK)** (version 11 or higher)
3. **Android Studio** with Android SDK
4. **Android SDK Build Tools** (version 33.0.0 or higher)
5. **Android SDK Platform** (API level 33 or higher)

### 📋 Installation Steps

#### 1. Install Node.js and npm
```bash
# Download and install Node.js from https://nodejs.org/
# Verify installation
node --version
npm --version
```

#### 2. Install React Native CLI
```bash
npm install -g @react-native-community/cli
```

#### 3. Install Android Studio
- Download Android Studio from https://developer.android.com/studio
- Install Android SDK Platform 33
- Install Android SDK Build-Tools 33.0.0
- Set up Android SDK environment variables

#### 4. Set Environment Variables
Add these to your system environment variables:

**Windows:**
```bash
ANDROID_HOME=C:\Users\YourUsername\AppData\Local\Android\Sdk
PATH=%PATH%;%ANDROID_HOME%\platform-tools
PATH=%PATH%;%ANDROID_HOME%\tools
```

**macOS/Linux:**
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### 🔧 Project Setup

#### 1. Install Dependencies
```bash
npm install
```

#### 2. Install React Native Vector Icons
```bash
npm install react-native-vector-icons
```

#### 3. Link Vector Icons (Android)
Add this to `android/app/build.gradle`:
```gradle
apply from: file("../../node_modules/react-native-vector-icons/fonts.gradle")
```

#### 4. Clean and Build
```bash
cd android
./gradlew clean
cd ..
```

### 📱 Building the APK

#### Method 1: Debug APK (Quick Build)
```bash
# Start Metro bundler
npx react-native start

# In a new terminal, build debug APK
npx react-native run-android --variant=debug
```

#### Method 2: Release APK (Production Ready)
```bash
# Generate release APK
cd android
./gradlew assembleRelease
```

The APK will be generated at:
`android/app/build/outputs/apk/release/app-release.apk`

#### Method 3: Using npm scripts
```bash
# Build release APK
npm run build:android

# Build release bundle (for Play Store)
npm run build:android-bundle
```

### 🔐 Signing the APK (Optional)

For production release, you should sign your APK:

#### 1. Generate Keystore
```bash
keytool -genkeypair -v -storetype PKCS12 -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

#### 2. Configure Signing
Add to `android/gradle.properties`:
```properties
MYAPP_UPLOAD_STORE_FILE=my-release-key.keystore
MYAPP_UPLOAD_KEY_ALIAS=my-key-alias
MYAPP_UPLOAD_STORE_PASSWORD=*****
MYAPP_UPLOAD_KEY_PASSWORD=*****
```

#### 3. Build Signed APK
```bash
cd android
./gradlew assembleRelease
```

### 📱 Installing the APK

#### Method 1: ADB (Android Debug Bridge)
```bash
# Enable USB debugging on your Android device
# Connect device via USB
adb install android/app/build/outputs/apk/release/app-release.apk
```

#### Method 2: Direct Installation
- Copy the APK file to your Android device
- Enable "Install from Unknown Sources" in settings
- Tap the APK file to install

### 🎯 App Features

#### ✅ Complete Features
- **Dashboard** - Total balance, account overview, quick actions
- **Account Management** - Multiple bank accounts and cash wallets
- **Transaction Tracking** - Income and expense management
- **Beautiful UI** - Modern design with Sinhala interface
- **Responsive Design** - Works on all screen sizes
- **Offline Support** - Works without internet connection

#### 📊 Dashboard Features
- Total balance display
- Account count and statistics
- Monthly income/expense summaries
- Quick action buttons
- Recent transaction history

#### 💰 Account Features
- Add multiple bank accounts
- Cash wallet management
- Account balance tracking
- Account search and filtering
- Account details and editing

#### 💸 Transaction Features
- Add income and expenses
- Transaction categorization
- Date and description tracking
- Transaction history
- Export functionality

### 🎨 UI/UX Features

#### Design Elements
- **Glassmorphism Effects** - Modern frosted glass design
- **Gradient Backgrounds** - Beautiful color schemes
- **Smooth Animations** - Hover effects and transitions
- **Responsive Layout** - Adapts to different screen sizes
- **Sinhala Typography** - Proper Sinhala font support

#### Navigation
- **Top Navigation** - App title and action buttons
- **Bottom Navigation** - Easy tab switching
- **Modal Forms** - Clean transaction forms
- **Search & Filter** - Easy data discovery

### 🔧 Troubleshooting

#### Common Issues and Solutions

**1. Build Errors**
```bash
# Clean project
cd android
./gradlew clean
cd ..
npx react-native start --reset-cache
```

**2. Metro Bundler Issues**
```bash
# Clear Metro cache
npx react-native start --reset-cache
```

**3. Android SDK Issues**
```bash
# Verify Android SDK installation
sdkmanager --list
```

**4. Permission Issues**
```bash
# Make gradlew executable (Linux/macOS)
chmod +x android/gradlew
```

**5. Vector Icons Not Showing**
- Ensure fonts.gradle is applied in build.gradle
- Clean and rebuild project
- Check if fonts are copied to assets

### 📱 Testing the APK

#### Test on Different Devices
- **Phone** - Test on various screen sizes
- **Tablet** - Verify responsive design
- **Different Android versions** - Test compatibility

#### Test Features
- [ ] Dashboard loads correctly
- [ ] Account management works
- [ ] Transactions can be added
- [ ] Search functionality works
- [ ] UI is responsive
- [ ] Sinhala text displays properly

### 🚀 Deployment

#### Google Play Store
1. Create developer account
2. Build signed APK or AAB
3. Upload to Play Console
4. Fill app details and screenshots
5. Submit for review

#### Direct Distribution
1. Share APK file directly
2. Upload to file sharing services
3. Distribute via email or messaging

### 📊 Performance Optimization

#### APK Size Optimization
- Enable ProGuard for release builds
- Use vector icons instead of PNG
- Optimize images and assets
- Remove unused dependencies

#### Runtime Performance
- Use React Native's performance tools
- Optimize re-renders with React.memo
- Use FlatList for large lists
- Implement proper state management

### 🔄 Updates and Maintenance

#### Version Management
```json
{
  "version": "1.0.0",
  "versionCode": 1
}
```

#### Update Process
1. Update version numbers
2. Build new APK
3. Test thoroughly
4. Deploy to users

### 📞 Support

#### Getting Help
- Check React Native documentation
- Review Android development guides
- Search for similar issues online
- Contact development team

#### Useful Resources
- [React Native Documentation](https://reactnative.dev/)
- [Android Developer Guide](https://developer.android.com/)
- [React Native Vector Icons](https://github.com/oblador/react-native-vector-icons)

---

## 🎉 Success!

ඔබේ APK file එක සාර්ථකව build වෙලා තියෙනවා! මෙම app එකෙන් ඔබට:

✅ **ගිණුම් කළමනාකරණය** කරන්න පුළුවන්  
✅ **ආදායම් සහ වියදම්** track කරන්න පුළුවන්  
✅ **සුන්දර UI/UX** එකක් භාවිතා කරන්න පුළුවන්  
✅ **Offline** වැඩ කරන්න පුළුවන්  
✅ **Sinhala interface** එකක් භාවිතා කරන්න පුළුවන්  

**Happy Coding! 🚀**