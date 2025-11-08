# 🚀 Easy APK Build Guide - මුදල් කළමනාකරණය v2.1

## Option 1: Android Studio (Easiest) ⭐

### Step 1: Install Android Studio
- Download: https://developer.android.com/studio
- Install කරන්න (takes 10-15 min)

### Step 2: Open Project
```bash
1. Android Studio open කරන්න
2. "Open an Existing Project" click කරන්න
3. FinancialManagerApp folder එක select කරන්න
4. Wait for Gradle sync to complete
```

### Step 3: Build APK
```bash
1. Top menu: Build > Build Bundle(s) / APK(s) > Build APK(s)
2. Wait 5-10 minutes
3. APK ready! Click "locate" to find it
4. File location: android/app/build/outputs/apk/debug/app-debug.apk
```

Done! 🎉

---

## Option 2: Command Line (Fast)

### Windows:
```cmd
cd FinancialManagerApp
npm install
cd android
gradlew assembleDebug
```

### Mac/Linux:
```bash
cd FinancialManagerApp
npm install
cd android
./gradlew assembleDebug
```

APK location: `android/app/build/outputs/apk/debug/app-debug.apk`

---

## Option 3: Online Build (Free)

### EAS Build (Expo):
```bash
# Install EAS CLI
npm install -g eas-cli

# Go to project
cd FinancialManagerApp

# Create free Expo account at expo.dev
# Login
eas login

# Build
eas build --platform android --profile preview

# Wait 10-15 min, get download link!
```

---

## 🐛 Troubleshooting

### Error: "SDK location not found"
**Solution:** Install Android Studio, එය automatically SDK install කරයි

### Error: "npm not found"
**Solution:** Install Node.js from https://nodejs.org

### Error: "Java version"
**Solution:** Install JDK 17 හෝ JDK 11

---

## ✨ Features in v2.1

- ✏️ Edit transactions (amount, date, description, category)
- 🗑️ Delete transactions (auto-updates balances)
- 💚 Bank deposits in green color
- 🎨 Bold amounts for better visibility
- 💾 Full data persistence
- 🇱🇰 Complete Sinhala interface

---

Need help? මට කියන්න! 🙏
