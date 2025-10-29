# ⚡ ඉක්මන් ආරම්භය - APK හදන්න 5 Minutes වලින්!

## 🚀 ඉක්මනින්ම APK එකක් ඕනේ? මේ විදිහට කරන්න!

### විකල්පය 1: EAS Build (Recommended - ලේසිම!)

```bash
# 1. EAS CLI install කරන්න
npm install -g eas-cli

# 2. ඔබේ project folder එකට යන්න
cd /workspace

# 3. Login වෙන්න (account එකක් නැතිනම් free account එකක් හදාගන්න)
eas login

# 4. Project එක configure කරන්න
eas build:configure

# 5. Android APK build කරන්න (cloud එකේ build වෙනවා!)
eas build --platform android --profile preview
```

**ඔබේ computer එකේ Android Studio නැතිව මේක වැඩ කරනවා! ☁️**

Build එක complete වෙද්දී (5-10 minutes):
- ✅ Download link එකක් terminal එකේ show වෙනවා
- ✅ QR code එකක් එනවා - phone එකෙන් scan කරලා download කරගන්න!
- ✅ Link එක කාටත් share කරන්න පුළුවන්

```
🎉 Build complete!

📱 Download: https://expo.dev/artifacts/eas/xxx.apk
📊 Details: https://expo.dev/accounts/yourname/projects/yourapp/builds/xxx
```

---

### විකල්පය 2: Expo Go App (APK එකක් නැතිව Test කරන්න)

APK එකක් build කරන්න කලින් app එක test කරන්න ඕනේනම්:

```bash
# 1. Expo install කරන්න
npm install -g expo-cli

# 2. Metro bundler start කරන්න
npx expo start

# 3. Phone එකෙන් Expo Go app එක download කරන්න
# Google Play: https://play.google.com/store/apps/details?id=host.exp.exponent

# 4. QR code එක scan කරන්න සහ app එක run කරන්න!
```

---

### විකල්පය 3: GitHub Actions (Automatic Build)

ඔබේ code එක GitHub එකට push කරන ඔන්න වෙලාවට automatic build එකක්!

```bash
# 1. මේ file එක create කරන්න: .github/workflows/build.yml
mkdir -p .github/workflows
```

මේක `.github/workflows/build.yml` file එකට paste කරන්න:

```yaml
name: Build APK

on:
  push:
    branches: [ main, master ]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: 18
      
      - name: Setup Java
        uses: actions/setup-java@v3
        with:
          distribution: 'zulu'
          java-version: 11
      
      - name: Install dependencies
        run: npm install
      
      - name: Build APK
        run: |
          cd android
          chmod +x gradlew
          ./gradlew assembleRelease
      
      - name: Upload APK to Releases
        uses: softprops/action-gh-release@v1
        if: startsWith(github.ref, 'refs/tags/')
        with:
          files: android/app/build/outputs/apk/release/app-release.apk
```

```bash
# 2. GitHub එකට push කරන්න
git add .
git commit -m "Add GitHub Actions workflow"
git push

# 3. Tag එකක් create කරලා release එකක් trigger කරන්න
git tag v1.0.0
git push origin v1.0.0

# 4. GitHub එකේ "Actions" tab එකෙන් build එක බලන්න
# Build එක complete වෙද්දී "Releases" එකෙන් APK download කරන්න!
```

---

## 📤 APK Upload කරලා Link Share කරන්න

### ඉක්මනින්ම - Transfer.sh (14 days)

```bash
# APK path එක copy කරන්න
cd android/app/build/outputs/apk/release

# Upload කරන්න (1 command)
curl --upload-file app-release.apk https://transfer.sh/BudgetTracker.apk

# Link එක instantly එනවා:
# https://transfer.sh/xxxxx/BudgetTracker.apk
```

### GitHub Releases (Permanent)

```bash
# GitHub CLI install කරලා තියෙනවනම්:
gh release create v1.0.0 \
  android/app/build/outputs/apk/release/app-release.apk \
  --title "Budget Tracker v1.0.0" \
  --notes "මුල්ම release"

# Link:
# https://github.com/yourusername/yourrepo/releases/download/v1.0.0/app-release.apk
```

### Google Drive (Easy for everyone)

1. [drive.google.com](https://drive.google.com) යන්න
2. APK upload කරන්න
3. Right-click → Share → Anyone with the link
4. Link copy කරන්න share කරන්න!

---

## 📱 Phone එකේ Install කරන්න

### ක්‍රමය 1: Link එකෙන්
1. Phone browser එකෙන් download link එක open කරන්න
2. APK download වෙනවා
3. File එක tap කරන්න
4. "Install from unknown source" enable කරන්න (Settings එකෙන් prompt එකක් එනවා)
5. Install button එක click කරන්න
6. Done! 🎉

### ක්‍රමය 2: USB Cable එකෙන්
```bash
# Phone එක USB debug mode එකේ connect කරන්න
adb install android/app/build/outputs/apk/release/app-release.apk
```

---

## 🎯 Troubleshooting (ගැටළු ඇති වුනොත්)

### "Command not found: eas"
```bash
# NPM global path check කරන්න
npm config get prefix

# Path එක environment එකට add කරන්න
# Mac/Linux: ~/.bashrc හෝ ~/.zshrc එකට add කරන්න
export PATH=$PATH:$(npm config get prefix)/bin
```

### "Login failed"
```bash
# Browser එකෙන් account එකක් හදාගන්න:
# https://expo.dev/signup

# පස්සේ login කරන්න:
eas login
```

### "Build failed"
```bash
# Logs බලන්න:
eas build:list

# Specific build එකක logs:
eas build:view BUILD_ID
```

---

## 📊 APK Size Optimize කරන්න

APK එක විශාල නම් (>50MB), මේවා try කරන්න:

### 1. Split APKs (Different ABIs)
`android/app/build.gradle`:
```gradle
android {
    splits {
        abi {
            enable true
            reset()
            include "armeabi-v7a", "arm64-v8a", "x86", "x86_64"
            universalApk false
        }
    }
}
```

### 2. Enable Proguard
```gradle
buildTypes {
    release {
        minifyEnabled true
        shrinkResources true
    }
}
```

### 3. Use App Bundle (Play Store සඳහා)
```bash
cd android && ./gradlew bundleRelease
# Output: android/app/build/outputs/bundle/release/app-release.aab
```

---

## ✅ Checklist

ඔබ build කරන්න කලින්:
- [ ] `package.json` තියෙනවා
- [ ] `android/` folder තියෙනවා
- [ ] `npm install` run කරලා
- [ ] Internet connection active

Build කරලා ඉවර වෙද්දී:
- [ ] APK file එක තියෙනවා
- [ ] APK size reasonable (< 100MB)
- [ ] Phone එකේ test කරලා
- [ ] Upload කරලා link share කරලා

---

## 🎓 ඊළඟට...

APK එක හැදුවාට පස්සේ:

1. **Google Play Store එකට දාන්න:**
   - Google Play Console account එකක් ඕනේ ($25 one-time fee)
   - App bundle upload කරන්න (`.aab` file)
   - Store listing create කරන්න
   - Review submit කරන්න

2. **Updates දාන්න:**
   ```bash
   # Version number update කරන්න android/app/build.gradle එකේ
   # versionCode 2, versionName "1.1.0"
   
   # New APK build කරන්න
   cd android && ./gradlew assembleRelease
   
   # New release create කරන්න
   gh release create v1.1.0 path/to/new-apk.apk
   ```

3. **Analytics add කරන්න:**
   - Firebase Analytics
   - Google Analytics
   - Custom tracking

---

**🎉 සුභ පැතුම්! ඔබේ app එක දැන් Android phone එකේ run වෙනවා!**

ප්‍රශ්න ඇතිනම් හෝ help ඕනේනම්, විස්තරාත්මක guide එක බලන්න:
- `android-setup-guide.md` - Full Android setup
- `BUILD-APK-SINHALA.md` - සම්පූර්ණ විස්තර සිංහලෙන්
