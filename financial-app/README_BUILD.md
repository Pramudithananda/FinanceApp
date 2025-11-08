# Build Instructions - සිංහල

## 🔴 Problem:

APK modification කරලා create කරපු APK files install වෙන්නේ නැහැ.
- "App not installed as package appears to be invalid" error
- APK structure corrupted වෙලා තියෙනවා

## ✅ Solution:

Source code එකෙන් properly build කරන්න.

## 📱 Build කරන්නේ කොහොමද:

### Option 1: Android Studio (සරලම විදිහ)

1. **Android Studio Download කරන්න:**
   - https://developer.android.com/studio
   - Install කරන්න

2. **Project Open කරන්න:**
   - Android Studio open කරන්න
   - File > Open
   - `financial-app/android` folder එක select කරන්න

3. **Build කරන්න:**
   - Gradle sync වෙනවා (automatic)
   - Build > Build Bundle(s) / APK(s) > Build APK(s)
   - APK file එක: `app/build/outputs/apk/debug/app-debug.apk`

### Option 2: Command Line

```bash
cd financial-app
npm install
cd android
./gradlew assembleDebug
```

## 🎯 What's Ready:

- ✅ Package Name: `com.newfinancialapp` (වෙනස්!)
- ✅ නව Icons: Financial app icon
- ✅ All Components: React Native app ready
- ✅ Configuration: Android files ready

## 📁 Files:

Source code: `/workspace/financial-app/`

## ⚠️ Important:

මේ source code එකෙන් build කරන APK file එක:
- ✅ Properly signed
- ✅ Valid structure
- ✅ Install වෙනවා
- ✅ Package name different (no conflict)

---

**Source code download කරගෙන build කරන්න!**
