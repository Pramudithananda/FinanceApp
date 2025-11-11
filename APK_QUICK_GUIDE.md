# ⚡ APK එක හදන්නේ කොහොමද? - ඉක්මන් මාර්ගෝපදේශය

## 3 ක්‍රම තියෙනවා! ඔබට පහසු එක තෝරන්න!

---

## 🎯 Method 1: Expo භාවිතයෙන් (⭐ RECOMMENDED - EASIEST!)

### ඇයි Expo?
✅ Setup කරන්න ඉතාම පහසුයි  
✅ Android Studio ඕන නෑ  
✅ Cloud හි build වෙයි (ඔබේ computer slow නම් best)  
✅ Download link එකක් ලැබේ  
✅ 15-20 minutes හි APK ready!  

### Commands:

```bash
# 1. Expo project එකක් සාදන්න
npx create-expo-app MudalKalamanakarna --template blank
cd MudalKalamanakarna

# 2. Dependencies install කරන්න
npm install @react-navigation/native @react-navigation/bottom-tabs
npx expo install react-native-screens react-native-safe-area-context
npx expo install @react-native-async-storage/async-storage
npx expo install @expo/vector-icons

# 3. ඔබේ code copy කරන්න
# /workspace/src/ folder එක copy කරන්න
# /workspace/App.js copy කරන්න (Expo version use කරන්න)

# 4. EAS setup කරන්න
npm install -g eas-cli
eas login
eas build:configure

# 5. APK build කරන්න
eas build --platform android --profile preview

# 6. Download link එකක් ලැබේ! ☕
# 15-20 minutes wait කරන්න
# Build complete වුණහම download කරගන්න!
```

### සවිස්තර උපදෙස්:
📖 **EXPO_BUILD_GUIDE.md** කියවන්න

---

## 🎯 Method 2: React Native CLI භාවිතයෙන් (Advanced)

### ඇයි React Native CLI?
✅ Full control  
✅ Native modules add කරන්න පුළුවන්  
✅ Local build (internet ඕන නෑ build time එකේ)  
✅ Faster rebuild times  

### අවශ්‍ය දේවල්:
- ✅ Node.js (v16+)
- ✅ JDK 11
- ✅ Android Studio
- ✅ Android SDK
- ✅ ANDROID_HOME environment variable

### Commands:

```bash
# 1. React Native project එකක් සාදන්න
npx react-native init MudalKalamanakarna --version 0.72.6
cd MudalKalamanakarna

# 2. Dependencies install කරන්න
npm install @react-navigation/native @react-navigation/bottom-tabs
npm install @react-native-async-storage/async-storage
npm install react-native-vector-icons
npm install react-native-safe-area-context react-native-screens

# 3. ඔබේ code copy කරන්න
# /workspace/src/ folder එක copy කරන්න
# /workspace/App.js copy කරන්න

# 4. Android link කරන්න
cd android
./gradlew clean
cd ..

# 5. Test කරන්න
npm start
# New terminal:
npm run android

# 6. APK build කරන්න
cd android
./gradlew assembleRelease

# 7. APK location:
# android/app/build/outputs/apk/release/app-release.apk

# 8. Copy කරන්න
cp app/build/outputs/apk/release/app-release.apk ~/Desktop/
```

### සවිස්තර උපදෙස්:
📖 **BUILD_APK_GUIDE_SINHALA.md** කියවන්න

---

## 🎯 Method 3: Automated Script භාවිතයෙන්

### ඇයි Script?
✅ Commands remember කරන්න ඕන නෑ  
✅ Automatic copy to Desktop/Downloads  
✅ Error handling  
✅ Build type select කරගන්න පුළුවන්  

### Commands:

```bash
# 1. Script run කරන්න
cd /workspace
chmod +x AUTOMATED_BUILD_SCRIPT.sh
./AUTOMATED_BUILD_SCRIPT.sh

# 2. Build type select කරන්න:
#    1) Debug APK (Fast, testing සඳහා)
#    2) Release APK (Optimized)
#    3) Clean Build (Problems නම්)

# 3. Copy location select කරන්න:
#    1) Desktop
#    2) Downloads
#    3) Both

# 4. Done! APK ready!
```

---

## 📊 Comparison (සැසදීම)

| Feature | Expo | React Native CLI | Script |
|---------|------|------------------|--------|
| Difficulty | ⭐ Easy | ⭐⭐⭐ Hard | ⭐⭐ Medium |
| Setup Time | 5 min | 30-60 min | 2 min |
| Build Time | 15-20 min | 5-10 min | 5-10 min |
| Requirements | Node.js only | Many tools | Android project |
| Internet | Build time only | Download only | No needed |
| APK Download | Cloud link | Local file | Local file |
| Best For | Beginners | Advanced | Automation |

---

## 🚀 තෝරන්න ඔබට පහසු එක!

### 🌟 Expo (Recommended for most)
```
👍 If you're new to React Native
👍 If you don't have Android Studio
👍 If setup is too complex
👍 If you want easiest method
```
📖 **Follow: EXPO_BUILD_GUIDE.md**

### 💪 React Native CLI
```
👍 If you're experienced
👍 If you have Android Studio setup
👍 If you need full control
👍 If you'll build many times
```
📖 **Follow: BUILD_APK_GUIDE_SINHALA.md**

### ⚡ Automated Script
```
👍 If React Native CLI already setup
👍 If you want quick builds
👍 If commands confuse you
👍 If you want automated copying
```
📖 **Run: ./AUTOMATED_BUILD_SCRIPT.sh**

---

## ⚠️ Important Note

දැනට `/workspace` හි **android folder එකක් නෑ** because මේක React Native code එකක් පමණයි.

APK build කරන්න පළමුව **Method 1 (Expo)** හෝ **Method 2 (React Native CLI)** භාවිතා කර project එකක් initialize කරන්න ඕනෑ.

---

## 🎯 Recommended Steps:

### For Beginners:

```bash
# 1. Use Expo (Easiest!)
npx create-expo-app MudalKalamanakarna --template blank

# 2. Copy your code
# (Copy src/ folder and App.js)

# 3. Install dependencies
npm install @react-navigation/native @react-navigation/bottom-tabs
npx expo install react-native-screens react-native-safe-area-context
npx expo install @react-native-async-storage/async-storage
npx expo install @expo/vector-icons

# 4. Build APK
npm install -g eas-cli
eas login
eas build:configure
eas build --platform android --profile preview

# 5. Download from link! ✅
```

### For Advanced Users:

```bash
# 1. Initialize React Native project
npx react-native init MudalKalamanakarna

# 2. Copy code & install dependencies

# 3. Build APK
cd android
./gradlew assembleRelease

# 4. APK ready! ✅
```

---

## 📚 සියලු Guides:

1. **APK_QUICK_GUIDE.md** (මෙම file) - Quick overview
2. **EXPO_BUILD_GUIDE.md** - Expo සම්පූර්ණ guide
3. **BUILD_APK_GUIDE_SINHALA.md** - React Native CLI සම්පූර්ණ guide
4. **AUTOMATED_BUILD_SCRIPT.sh** - Automated build script
5. **QUICK_START_SINHALA.md** - App run කරන්න
6. **INSTALL_GUIDE_SINHALA.md** - සම්පූර්ණ setup

---

## 💡 Pro Tips

1. **Expo පළමුව try කරන්න**
   - Setup simplest
   - No Android Studio needed
   - Works perfectly

2. **React Native CLI use කරන්න if:**
   - You need custom native modules
   - You'll build frequently
   - You have Android Studio setup already

3. **Test locally first:**
   ```bash
   npx expo start  # For Expo
   npm run android # For React Native CLI
   ```

4. **Issues නම්:**
   - Check error messages
   - Google the error
   - Read detailed guides
   - Clean build and retry

---

## 🎊 Ready to Build!

ඔබට පහසු method එක තෝරගෙන APK එක build කරන්න!

Questions නම්:
- **EXPO_BUILD_GUIDE.md** - Expo සඳහා
- **BUILD_APK_GUIDE_SINHALA.md** - React Native CLI සඳහා

**Good Luck!** 🚀📱

---

Made with ❤️ for Sri Lanka 🇱🇰
