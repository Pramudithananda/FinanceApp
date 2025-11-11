# 📱 මුදල් කළමනාකරණ යෙදුම - ස්ථාපන මාර්ගෝපදේශය

## සම්පූර්ණ React Native Mobile App

---

## 📋 අවශ්‍ය දේවල් (Prerequisites)

### 1. මෘදුකාංග ස්ථාපනය

#### Windows/Mac/Linux හි:

**Node.js සහ npm:**
- [Node.js website](https://nodejs.org/) වෙතින් download කරන්න
- Version 16 හෝ ඉහළ අවශ්‍යයි
- Install කිරීමෙන් පසු verify කරන්න:

```bash
node --version
# v16.0.0 හෝ ඉහළ පෙන්විය යුතුයි

npm --version
# 8.0.0 හෝ ඉහළ පෙන්විය යුතුයි
```

---

## 🤖 Android සඳහා Setup

### 1. Java Development Kit (JDK)

```bash
# JDK 11 install කරන්න
# Ubuntu/Debian:
sudo apt-get install openjdk-11-jdk

# Mac (Homebrew):
brew install openjdk@11

# Windows:
# Oracle JDK 11 download කර install කරන්න
```

### 2. Android Studio Install කරන්න

1. [Android Studio](https://developer.android.com/studio) download කරන්න
2. Install කරන්න (default settings OK)
3. Android Studio open කරන්න
4. "More Actions" → "SDK Manager"
5. "SDK Platforms" tab එකේ:
   - ✅ Android 13.0 (Tiramisu)
   - ✅ Android 12.0 (S)
   - ✅ Android 11.0 (R)
6. "SDK Tools" tab එකේ:
   - ✅ Android SDK Build-Tools
   - ✅ Android Emulator
   - ✅ Android SDK Platform-Tools
   - ✅ Intel x86 Emulator Accelerator (HAXM)

### 3. Environment Variables Setup

#### Windows:
```
ANDROID_HOME = C:\Users\YOUR_USERNAME\AppData\Local\Android\Sdk
Path += C:\Users\YOUR_USERNAME\AppData\Local\Android\Sdk\platform-tools
```

#### Mac/Linux:
```bash
# ~/.bashrc හෝ ~/.zshrc හි add කරන්න:
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### 4. Virtual Device Create කරන්න

1. Android Studio → "More Actions" → "Virtual Device Manager"
2. "Create Device" click කරන්න
3. Phone category එකෙන් device එකක් select කරන්න (උදා: Pixel 5)
4. System image එකක් download කරන්න (උදා: Android 13)
5. "Finish" click කරන්න

---

## 🍎 iOS සඳහා Setup (Mac පමණි)

### 1. Xcode Install කරන්න

```bash
# App Store එකෙන් Xcode install කරන්න
# හෝ terminal භාවිතයෙන්:
xcode-select --install
```

### 2. CocoaPods Install කරන්න

```bash
sudo gem install cocoapods
```

### 3. iOS Simulator Setup

1. Xcode open කරන්න
2. Xcode → Preferences → Components
3. iOS Simulators download කරන්න

---

## 🚀 යෙදුම ස්ථාපනය (App Installation)

### Step 1: Project Setup

```bash
# Project folder එකට navigate කරන්න
cd /workspace

# Dependencies install කරන්න
npm install

# මෙය 2-5 විනාඩි ගතවිය හැක
```

### Step 2: Android Setup (එකවර පමණක්)

```bash
# React Native CLI install කරන්න (global)
npm install -g react-native-cli

# Verify installation
react-native --version
```

### Step 3: iOS Setup (Mac පමණි)

```bash
cd ios
pod install
cd ..
```

---

## 🎯 යෙදුම Run කිරීම

### Android හි Run කිරීම

#### Option 1: Emulator භාවිතයෙන්

```bash
# Emulator start කරන්න
# Android Studio → Virtual Device Manager → Play button

# නව terminal window එකක්:
npm start

# තවත් terminal window එකක්:
npm run android
```

#### Option 2: Physical Device භාවිතයෙන්

1. USB Debugging enable කරන්න:
   - Settings → About Phone
   - Build Number 7 වතාවක් tap කරන්න
   - Settings → Developer Options
   - USB Debugging enable කරන්න

2. USB cable එකෙන් connect කරන්න

3. Device authorize කරන්න:
```bash
adb devices
# ඔබගේ device එක list වේ
```

4. Run කරන්න:
```bash
npm start
npm run android
```

### iOS හි Run කිරීම (Mac පමණි)

```bash
# Simulator start කරන්න
npm start

# තවත් terminal window එකක්:
npm run ios

# හෝ specific device එකක් සඳහා:
npm run ios -- --simulator="iPhone 14"
```

---

## 🎨 යෙදුම භාවිතය

### 1. Dashboard
- මුල් පිටුව open වන විට සියලු ගිණුම් දැකගත හැක
- සම්පූර්ණ ශේෂය ඉහළින් පෙන්වයි
- බැංකු සහ මුදල් summary cards
- ගිණුම් cards tap කළහම විස්තර

### 2. බැංකු ගිණුම්
- "+" button ඔබා නව ගිණුමක් add කරන්න
- ගිණුම් නම, අංකය, ශේෂය ඇතුළත් කරන්න
- Edit button ඔබා වෙනස් කරන්න
- Delete button ඔබා මකන්න

### 3. මුදල් ගිණුම්
- "+" button ඔබා මුදල් ගිණුමක් add කරන්න
- "එකතු කරන්න" button ඔබා මුදල් add කරන්න
- "අඩු කරන්න" button ඔබා මුදල් remove කරන්න

### 4. ප්‍රවර්ග
- "+" button ඔබා නව ප්‍රවර්ගයක් create කරන්න
- අයිකෝනයක් සහ වර්ණයක් තෝරන්න
- නම type කරන්න
- පෙරදසුන බලා "සුරකින්න" click කරන්න

### 5. සැකසුම්
- දත්ත backup options
- යෙදුම් තොරතුරු
- Clear data option (ප්‍රවේශමෙන්!)

---

## 🐛 ගැටළු විසඳීම (Troubleshooting)

### ගැටළුව 1: Metro Bundler Start නොවේ

```bash
# Solution 1: Port clear කරන්න
npx react-native start --reset-cache

# Solution 2: Node modules නැවත install කරන්න
rm -rf node_modules
npm install
```

### ගැටළුව 2: Android Build අසාර්ථකයි

```bash
# Clean build කරන්න
cd android
./gradlew clean
cd ..

# Build folder delete කරන්න
rm -rf android/app/build

# නැවත build කරන්න
npm run android
```

### ගැටළුව 3: "Unable to resolve module"

```bash
# Cache clear කරන්න
npm start -- --reset-cache

# හෝ
watchman watch-del-all
rm -rf $TMPDIR/react-*
```

### ගැටළුව 4: AsyncStorage Error

```bash
# Dependency නැවත install කරන්න
npm install @react-native-async-storage/async-storage

# iOS සඳහා:
cd ios
pod install
cd ..
```

### ගැටළුව 5: Vector Icons නොපෙන්වේ

```bash
# Android සඳහා:
# android/app/build.gradle හි verify කරන්න:
# apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"

# iOS සඳහා:
cd ios
pod install
cd ..
```

### ගැටළුව 6: App Crashes on Launch

```bash
# 1. Debug mode වලින් run කරන්න
npx react-native log-android  # Android සඳහා
npx react-native log-ios      # iOS සඳහා

# 2. App data clear කරන්න
# Device Settings → Apps → මුදල් කළමනාකරණ → Clear Data

# 3. Reinstall කරන්න
npm run android -- --reset-cache
```

---

## 📦 Production Build

### Android APK Build කිරීම

```bash
cd android

# Debug APK (Testing සඳහා)
./gradlew assembleDebug
# Output: android/app/build/outputs/apk/debug/app-debug.apk

# Release APK (Distribution සඳහා)
./gradlew assembleRelease
# Output: android/app/build/outputs/apk/release/app-release.apk
```

### APK Install කිරීම

```bash
# USB හරහා install කරන්න
adb install android/app/build/outputs/apk/debug/app-debug.apk

# හෝ APK file device එකට send කර tap කරන්න
```

### iOS Build කිරීම (Mac පමණි)

```bash
# Xcode open කරන්න
open ios/MudalKalamanakarna.xcworkspace

# Xcode හි:
# 1. Product → Scheme → Edit Scheme
# 2. Run → Build Configuration → Release
# 3. Product → Archive
# 4. Distribute App
```

---

## 🔧 Customization

### වර්ණ වෙනස් කිරීම

`src/screens/DashboardScreen.js` open කර styles වෙනස් කරන්න:

```javascript
const styles = StyleSheet.create({
  totalBalanceAmount: {
    fontSize: 36,
    fontWeight: 'bold',
    color: '#4F46E5', // ← මෙම වර්ණය වෙනස් කරන්න
  },
});
```

### Default Accounts වෙනස් කිරීම

`src/context/AppContext.js` open කරන්න:

```javascript
const [accounts, setAccounts] = useState([
  { 
    id: 1, 
    name: "ඔබගේ බැංකුව", // ← වෙනස් කරන්න
    number: '1234567890', 
    balance: 0, 
    type: 'bank' 
  },
]);
```

### නව Screen එකක් එකතු කිරීම

1. `src/screens/` හි නව file එකක් create කරන්න
2. `App.js` හි import කරන්න
3. `Tab.Screen` එකක් add කරන්න

---

## 📚 තවත් උපකාර

### ලේඛන (Documentation):
- 📄 `README.md` - මූලික තොරතුරු
- 📄 `SETUP.md` - Setup guide (English)
- 📄 `FEATURES.md` - සියලු විශේෂාංග
- 📄 `INSTALL_GUIDE_SINHALA.md` - මෙම ගොනුව

### Online Resources:
- [React Native Docs](https://reactnative.dev/docs/getting-started)
- [React Navigation](https://reactnavigation.org/)
- [AsyncStorage](https://react-native-async-storage.github.io/async-storage/)

---

## ✅ Installation Checklist

පද්ධති requirements:
- [ ] Node.js (v16+) installed
- [ ] npm (v8+) installed
- [ ] JDK 11 installed
- [ ] Android Studio installed
- [ ] Android SDK installed
- [ ] ANDROID_HOME set
- [ ] Virtual Device created

Project setup:
- [ ] `npm install` completed
- [ ] `react-native-cli` installed
- [ ] iOS pods installed (Mac only)

Run test:
- [ ] `npm start` works
- [ ] `npm run android` works
- [ ] App opens successfully
- [ ] Dashboard loads
- [ ] Navigation works

---

## 🎉 සාර්ථකව Install කළහම

ඔබ දැන් මුදල් කළමනාකරණ යෙදුම භාවිතා කිරීමට සූදානම්!

**පළමු පියවර:**
1. Dashboard එකේ සිටින විට "+" button tap කරන්න
2. ඔබගේ පළමු බැංකු ගිණුම add කරන්න
3. මුදල් ගිණුමක් create කරන්න
4. ප්‍රවර්ග customize කරන්න
5. ඔබගේ මුදල් track කිරීම ආරම්භ කරන්න!

**සියලුම විශේෂාංග explore කරන්න:**
- 🏦 බැංකු ගිණුම් කළමනාකරණය
- 💰 මුදල් ගිණුම් tracking
- 🏷️ Custom ප්‍රවර්ග
- ⚙️ Settings customization

---

## 💡 Tips

1. **Regular Testing**: Development අතරතුර device හෝ emulator හි නිතර test කරන්න
2. **Debug Mode**: Issues තිබේ නම් `npx react-native log-android` run කරන්න
3. **Clean Builds**: Problems නම් clean build කරන්න
4. **Reload App**: Code වෙනස් කළහම `R` key (Android) හෝ `Cmd+R` (iOS) ඔබන්න

---

## 📞 උපකාර අවශ්‍ය නම්

Issues හෝ questions නම්:
1. `FEATURES.md` file එක කියවන්න
2. Error messages Google කරන්න
3. React Native documentation බලන්න
4. GitHub Issues හරහා අසන්න

---

**සාර්ථක ස්ථාපනයක් වේවා!** 🎊

*දේශීය තාක්ෂණය - Sri Lankan Mobile App Development* 🇱🇰
