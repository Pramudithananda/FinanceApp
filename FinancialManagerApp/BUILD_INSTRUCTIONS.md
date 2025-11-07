# 🔨 Build Instructions - Financial Manager App

Complete guide for building and deploying the Financial Manager App.

## 📋 Prerequisites

### Required Software
1. **Node.js** (v14 or higher)
   - Download: https://nodejs.org/
   - Verify: `node --version`

2. **npm or Yarn**
   - npm comes with Node.js
   - Yarn (optional): `npm install -g yarn`

3. **React Native CLI**
   ```bash
   npm install -g react-native-cli
   ```

4. **JDK (Java Development Kit)**
   - Download JDK 11 or higher
   - Set JAVA_HOME environment variable

5. **Android Studio**
   - Download: https://developer.android.com/studio
   - Install Android SDK
   - Set ANDROID_HOME environment variable

### Environment Variables Setup

#### Windows
```cmd
setx ANDROID_HOME "C:\Users\YourUsername\AppData\Local\Android\Sdk"
setx JAVA_HOME "C:\Program Files\Java\jdk-11.0.x"
```

#### macOS/Linux
Add to `~/.bashrc` or `~/.zshrc`:
```bash
export ANDROID_HOME=$HOME/Android/Sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.x.jdk/Contents/Home
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

## 🚀 Installation Steps

### 1. Navigate to Project Directory
```bash
cd /workspace/FinancialManagerApp
```

### 2. Install Dependencies
```bash
npm install
```

Or with Yarn:
```bash
yarn install
```

### 3. Install Pods (iOS only)
```bash
cd ios
pod install
cd ..
```

## 📱 Running on Device/Emulator

### Android

#### Start Metro Bundler
```bash
npm start
```

#### Run on Android Device/Emulator
In a new terminal:
```bash
npx react-native run-android
```

Or with specific device:
```bash
adb devices  # List connected devices
npx react-native run-android --deviceId=DEVICE_ID
```

### iOS (macOS only)

#### Run on iOS Simulator
```bash
npx react-native run-ios
```

#### Run on specific iOS device
```bash
npx react-native run-ios --device "iPhone Name"
```

## 🔧 Building APK

### Debug APK (For Testing)

#### Method 1: Using Gradle
```bash
cd android
./gradlew assembleDebug
cd ..
```

Output location:
```
android/app/build/outputs/apk/debug/app-debug.apk
```

#### Method 2: Using React Native CLI
```bash
npx react-native build-android --mode=debug
```

### Release APK (For Distribution)

#### Step 1: Generate Signing Key
```bash
cd android/app
keytool -genkeypair -v -storetype PKCS12 -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
cd ../..
```

You'll be asked to enter:
- Keystore password (remember this!)
- Key password (remember this!)
- Name, Organization, etc.

#### Step 2: Configure Gradle
Create/edit `android/gradle.properties` and add:
```properties
MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
MYAPP_RELEASE_KEY_ALIAS=my-key-alias
MYAPP_RELEASE_STORE_PASSWORD=your_store_password
MYAPP_RELEASE_KEY_PASSWORD=your_key_password
```

Edit `android/app/build.gradle` and add signing config:
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

Output location:
```
android/app/build/outputs/apk/release/app-release.apk
```

#### Step 4: Install Release APK
```bash
adb install android/app/build/outputs/apk/release/app-release.apk
```

## 📦 Building AAB (Android App Bundle)

For Google Play Store submission:

```bash
cd android
./gradlew bundleRelease
cd ..
```

Output location:
```
android/app/build/outputs/bundle/release/app-release.aab
```

## 🧪 Testing

### Run Tests
```bash
npm test
```

### Run with Coverage
```bash
npm test -- --coverage
```

### Run ESLint
```bash
npm run lint
```

## 🐛 Troubleshooting

### Common Issues

#### 1. Metro Bundler Issues
```bash
# Clear cache and restart
npx react-native start --reset-cache
```

#### 2. Build Errors
```bash
# Clean Android build
cd android
./gradlew clean
cd ..

# Clean npm cache
npm cache clean --force
rm -rf node_modules
npm install
```

#### 3. Gradle Daemon Issues
```bash
cd android
./gradlew --stop
./gradlew clean
cd ..
```

#### 4. ADB Not Found
```bash
# Add to PATH (Windows)
setx PATH "%PATH%;%ANDROID_HOME%\platform-tools"

# Add to PATH (macOS/Linux)
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

#### 5. Unable to Load Script Error
```bash
# Start packager manually
npx react-native start

# In new terminal, run app
npx react-native run-android
```

#### 6. Execution failed for task ':app:installDebug'
```bash
# Uninstall existing app
adb uninstall com.financialmanager.app

# Rebuild
npx react-native run-android
```

## 🎨 Customizing the Build

### Change App Name
1. Edit `android/app/src/main/res/values/strings.xml`
```xml
<string name="app_name">Your App Name</string>
```

2. Edit `app.json`
```json
{
  "displayName": "Your App Name"
}
```

### Change Package Name
1. Rename package in:
   - `android/app/build.gradle` (applicationId)
   - `android/app/src/main/AndroidManifest.xml`
   - `android/app/src/main/java/com/.../` directory structure

### Change App Icon
1. Replace icons in:
   - `android/app/src/main/res/mipmap-*/ic_launcher.png`
   - Or use: https://romannurik.github.io/AndroidAssetStudio/

## 📊 Performance Optimization

### Enable Hermes (already enabled by default)
In `android/gradle.properties`:
```properties
hermesEnabled=true
```

### Enable ProGuard (minification)
In `android/app/build.gradle`:
```gradle
def enableProguardInReleaseBuilds = true
```

### Reduce APK Size
```bash
# Build separate APKs per architecture
cd android
./gradlew assembleRelease -PenableSeparateBuildPerCPUArchitecture=true
```

## 🔐 Security Best Practices

1. **Never commit keystore files** to git
2. **Store passwords securely** (use environment variables)
3. **Add to .gitignore:**
   ```
   *.keystore
   android/gradle.properties (if contains passwords)
   ```
4. **Use different keys** for different environments

## 📋 Checklist Before Release

- [ ] Update version number in `android/app/build.gradle`
- [ ] Update app name if needed
- [ ] Test on multiple devices/Android versions
- [ ] Enable ProGuard for release builds
- [ ] Test release APK on real device
- [ ] Verify app icon displays correctly
- [ ] Check all features work in release mode
- [ ] Review and update app permissions
- [ ] Test on low-end devices
- [ ] Verify data persistence works

## 🚀 Deployment

### Google Play Store

1. **Create Developer Account**
   - Sign up at https://play.google.com/console
   - Pay one-time $25 fee

2. **Prepare Assets**
   - App icon (512x512 PNG)
   - Feature graphic (1024x500 PNG)
   - Screenshots (multiple devices)
   - App description (Sinhala & English)

3. **Upload AAB**
   - Create new app in Play Console
   - Upload app-release.aab
   - Fill in app details
   - Submit for review

### Direct Distribution

1. **Build Release APK**
2. **Share APK file** directly with users
3. **Users must enable** "Install from Unknown Sources"
4. **Install APK** on device

## 📞 Support

For build issues:
- Check React Native documentation: https://reactnative.dev/
- Android Studio logs
- Metro bundler logs
- Gradle build logs in `android/` directory

## 🔄 Automated Build (CI/CD)

### GitHub Actions Example
Create `.github/workflows/android.yml`:
```yaml
name: Android Build

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    - name: Set up JDK 11
      uses: actions/setup-java@v2
      with:
        java-version: '11'
    - name: Install dependencies
      run: npm install
    - name: Build APK
      run: |
        cd android
        ./gradlew assembleRelease
    - name: Upload APK
      uses: actions/upload-artifact@v2
      with:
        name: app-release.apk
        path: android/app/build/outputs/apk/release/app-release.apk
```

---

**Last Updated:** 2025-11-07  
**Version:** 2.0.0  
**Platform:** Android (iOS support available)
