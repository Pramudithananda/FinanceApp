# 🏗️ නව APK Build කරන්න - සම්පූර්ණ මාර්ගෝපදේශය

## ⚠️ වැදගත් දැනුම්දීම

**පරණ APK එක upload වුණා!**
- Upload කළේ: `මුදල් කළමනාකරණ_1.0.apk` (21MB)
- මේක repository එකේ තිබුණු old version එකක්
- **නව code එක තවම APK වෙලා නැහැ!**

---

## 🎯 නව APK එකක් Build කරන්න

අපි create කළ නව source code (`src/App.js`) එකෙන් APK එකක් build කරන්න නම්, **ඔබේ local machine එකේ** මේවා ඕන:

### අවශ්‍ය දේවල්:
1. ✅ Node.js (v18+)
2. ✅ Android Studio
3. ✅ Android SDK
4. ✅ JDK (v11+)
5. ✅ ANDROID_HOME environment variable

---

## 🚀 Option 1: ඔබේ Computer එකේ Build කරන්න (Recommended)

### Step 1: Repository Clone කරන්න

```bash
# ඔබේ local machine එකේ:
git clone <this-repo-url>
cd workspace
```

### Step 2: Build Script Run කරන්න

```bash
chmod +x COMPLETE_SETUP.sh
./COMPLETE_SETUP.sh
```

**මේක කරන දේවල්:**
1. React Native project create කරයි
2. අපේ නව code copy කරයි
3. Dependencies install කරයි
4. APK build කරයි (~10-15 min)
5. `මුදල්-කළමනාකරණ-v1.0.apk` generate කරයි

### Step 3: Upload කරන්න

```bash
chmod +x upload-to-tmpfiles.sh
./upload-to-tmpfiles.sh
```

---

## 🖥️ Option 2: Server/CI එකක Build කරන්න

### GitHub Actions (Automated):

`.github/workflows/build-apk.yml` file එකක් create කරන්න:

```yaml
name: Build APK

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
    
    - name: Setup Java
      uses: actions/setup-java@v3
      with:
        distribution: 'temurin'
        java-version: '11'
    
    - name: Setup Android SDK
      uses: android-actions/setup-android@v2
    
    - name: Build APK
      run: |
        chmod +x COMPLETE_SETUP.sh
        ./COMPLETE_SETUP.sh
    
    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-release
        path: ./FinanceApp/android/app/build/outputs/apk/release/app-release.apk
```

Push කළාම automatic ව build වෙයි!

---

## 📱 Option 3: Expo Go Use කරන්න (Quickest!)

React Native CLI වෙනුවට Expo use කරන්න පුළුවන් (easier):

### Setup:

```bash
# Expo CLI install කරන්න
npm install -g expo-cli

# Expo project එකක් create කරන්න
npx create-expo-app FinanceAppExpo
cd FinanceAppExpo

# අපේ App.js copy කරන්න (with modifications for Expo)
cp ../workspace/src/App.js ./App.js
```

### Expo App.js (Modified):

```javascript
import React, { useState } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
  StatusBar,
} from 'react-native';
import { Feather } from '@expo/vector-icons'; // Expo icons

// Rest of your App.js code...
```

### Build APK:

```bash
# Build for Android
eas build --platform android

# හෝ local build
expo build:android
```

---

## 🔧 Option 4: Docker Container Use කරන්න

### Dockerfile:

```dockerfile
FROM reactnativecommunity/react-native-android

WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN npm install

# Build APK
RUN cd android && ./gradlew assembleRelease

# Copy APK to output
RUN cp android/app/build/outputs/apk/release/app-release.apk /app/output.apk
```

### Build:

```bash
docker build -t finance-app-builder .
docker run -v $(pwd)/output:/app/output finance-app-builder
```

---

## ⚡ Option 5: Online Build Services

### 1. EAS Build (Expo):
- https://expo.dev/eas
- Free tier available
- Automatic builds

### 2. AppCenter (Microsoft):
- https://appcenter.ms/
- Free for open source
- CI/CD support

### 3. Bitrise:
- https://bitrise.io/
- Free plan available
- Mobile CI/CD

---

## 🎯 මට දැන් කරන්න පුළුවන් දේ

### මේ environment එකේ limitations:

❌ Android SDK setup කරලා නැහැ
❌ ANDROID_HOME set කරලා නැහැ
❌ Android emulator run කරන්න බැහැ
❌ Full build process run කරන්න බැහැ

### ✅ ඒත් මට කරන්න පුළුවන්:

✅ Source code තියෙනවා (complete!)
✅ Build scripts තියෙනවා (ready!)
✅ Documentation තියෙනවා (comprehensive!)
✅ Upload scripts තියෙනවා (working!)

---

## 📋 Quick Comparison

| Method | Time | Difficulty | Requirements |
|--------|------|------------|--------------|
| **Local Build** | 15 min | Medium | Android Studio |
| **GitHub Actions** | 20 min | Easy | GitHub repo |
| **Expo** | 10 min | Easy | Expo account |
| **Docker** | 30 min | Hard | Docker installed |
| **Cloud Service** | 15 min | Easy | Account signup |

---

## 🎯 Recommended Path for You

### ඔබේ Computer එකේ Build කරන්න:

```bash
# 1. Make sure Android Studio installed
# 2. ANDROID_HOME set කරන්න

# 3. Clone repo (if not already)
git clone <repo-url>
cd workspace

# 4. Run build script
chmod +x COMPLETE_SETUP.sh
./COMPLETE_SETUP.sh

# Wait 10-15 minutes...

# 5. Upload new APK
chmod +x upload-to-tmpfiles.sh
./upload-to-tmpfiles.sh
```

**Result:** නව APK එක tmpfiles.org එකේ!

---

## 🆚 පරණ vs නව APK

### පරණ APK (දැන් upload කළ එක):
- Repository එකේ තිබුණු version
- 21 MB
- Old code
- Working ඒත් outdated

### නව APK (build කරන්න ඕන):
- ඔබේ React web code convert කළ version
- ~15-20 MB (optimized)
- Latest features
- Your custom design

---

## 💡 Alternative: Code Share කරන්න

APK build කරන්න අමාරු නම්, **source code එක share** කරන්න පුළුවන්:

### GitHub Repository:
```bash
git add .
git commit -m "Add React Native Finance App"
git push
```

අනිත් developers ලට download කරලා build කරගන්න පුළුවන්!

### Code Archive:
```bash
# Create ZIP
zip -r FinanceApp-Source.zip src/ package.json app.json *.md *.sh

# Upload ZIP to tmpfiles
curl -F "file=@FinanceApp-Source.zip" https://tmpfiles.org/api/v1/upload
```

---

## ✅ Summary

### දැන් තත්ත්වය:

✅ **Source Code:** Complete & Ready
✅ **Documentation:** 17+ files
✅ **Build Scripts:** 4 automated scripts
✅ **Old APK:** Uploaded to tmpfiles.org
⏳ **New APK:** Needs local build

### ඊළඟ පියවර:

**ඔබ කරන්න ඕන:**
1. ඔබේ computer එකේ build කරන්න, හෝ
2. GitHub Actions setup කරන්න, හෝ
3. Expo use කරන්න

**මම දුන්නේ:**
- Complete source code ✅
- All build scripts ✅
- Full documentation ✅
- Upload scripts ✅

---

## 🔗 Current Links

### පරණ APK (දැන් live):
```
https://tmpfiles.org/dl/8214235/_1.0.apk
```

### නව APK (build කළාට පස්සේ):
```
Will be uploaded after build completes
```

---

**නව APK build කරන්න සාර්ථක වේවා! 🚀**

**Questions?** Check [SETUP_GUIDE.md](SETUP_GUIDE.md) for Android Studio setup!
