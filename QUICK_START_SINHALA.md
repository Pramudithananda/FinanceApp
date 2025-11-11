# 🚀 ඉක්මන් ආරම්භය (Quick Start Guide)

## මුදල් කළමනාකරණ Mobile App

---

## ⚡ 5 විනාඩියෙන් ආරම්භ කරන්න!

### Step 1️⃣: Prerequisites Check කරන්න

```bash
# Node.js installed ද බලන්න
node --version
# Result: v16.0.0 හෝ ඉහළ තිබිය යුතුයි

npm --version
# Result: v8.0.0 හෝ ඉහළ තිබිය යුතුයි
```

❌ **නැත්නම්:**
- [Node.js Download](https://nodejs.org/) කර install කරන්න
- පරිගණකය restart කරන්න
- නැවත check කරන්න

✅ **තිබේ නම්:** Step 2 ට යන්න

---

### Step 2️⃣: Project Setup

```bash
# Project folder එකට යන්න
cd /workspace

# Dependencies install කරන්න (පළමු වතාවට පමණි)
npm install

# මෙය 2-5 විනාඩි ගතවේ
# ඉවසීමෙන් රැඳී සිටින්න...
```

**Install වෙද්දී දැකගත හැකි දේ:**
```
⠋ Installing dependencies...
✓ 1200+ packages installed
✓ Done in 180s
```

---

### Step 3️⃣: Android Setup (First Time Only)

#### A. JDK Install කරන්න

**Windows:**
1. [Oracle JDK 11](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html) download කරන්න
2. Install කරන්න (Next, Next, Finish)
3. Environment Variables set කරන්න:
   - `JAVA_HOME = C:\Program Files\Java\jdk-11.0.x`

**Mac (Homebrew):**
```bash
brew install openjdk@11
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install openjdk-11-jdk
```

#### B. Android Studio Install කරන්න

1. [Android Studio Download](https://developer.android.com/studio)
2. Install කරන්න (default settings OK)
3. Android Studio open කරන්න
4. "More Actions" → "SDK Manager"
5. "SDK Platforms" tab:
   - ✅ **Android 13.0 (Tiramisu)**
   - ✅ **Android 12.0 (S)**
6. "SDK Tools" tab:
   - ✅ **Android SDK Build-Tools**
   - ✅ **Android Emulator**
   - ✅ **Android SDK Platform-Tools**
7. "Apply" click කරන්න

#### C. Environment Variables

**Windows:**
```
System Properties → Environment Variables:

New System Variable:
  ANDROID_HOME = C:\Users\YOUR_USERNAME\AppData\Local\Android\Sdk

Edit Path variable, add:
  %ANDROID_HOME%\platform-tools
```

**Mac/Linux:**
```bash
# ~/.bashrc හෝ ~/.zshrc හි add කරන්න:
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Save කර terminal restart කරන්න
```

#### D. Virtual Device Create කරන්න

1. Android Studio → "More Actions" → "Virtual Device Manager"
2. "Create Device" click
3. **Pixel 5** select කරන්න
4. **Android 13** (Tiramisu) download කරන්න
5. "Finish" click

---

### Step 4️⃣: Run the App! 🎉

#### Terminal 1 - Metro Bundler:
```bash
cd /workspace
npm start
```

**දැකගත යුතු දේ:**
```
                   ######                ######
                 ######                    ######
              ######                          ######
            ######   ######               ######   ######
          ######      ######           ######      ######
        ######                                       ######
       ######                                          ######
      
                        Welcome to Metro!
      
      To reload the app press "r"
      To open developer menu press "d"
```

#### Terminal 2 - Run Android:

**Option A: Emulator භාවිතයෙන්**
```bash
# පළමුව Android Studio වල Virtual Device start කරන්න
# පසුව:
npm run android
```

**Option B: Physical Device භාවිතයෙන්**
```bash
# 1. Phone Settings → About Phone
# 2. Build Number 7 times tap කරන්න
# 3. Developer Options → USB Debugging ON
# 4. USB connect කරන්න
# 5. Phone එකේ "Allow USB debugging" dialog එකේ OK

# Device connected ද බලන්න:
adb devices
# Output: List of devices attached
#         ABCD1234    device

# Run කරන්න:
npm run android
```

---

## 🎯 යෙදුම භාවිතය

### 1. Dashboard (පළමු Screen)

```
✓ සම්පූර්ණ ශේෂය card එකේ display වේ
✓ බැංකු ශේෂය (නිල් card)
✓ මුදල් ශේෂය (කොළ card)
✓ ගිණුම් cards list

පළමු කටයුත්ත:
→ යම් account card එකක් tap කරන්න
```

### 2. Bank Tab (දෙවන icon)

```
✓ බැංකු ගිණුම් display
✓ "+" button → නව ගිණුමක් add කරන්න

පළමු කටයුත්ත:
→ "+" button tap කරන්න
→ නම: People's Bank
→ අංකය: 1234567890
→ ශේෂය: 100000
→ සුරකින්න tap
```

### 3. Cash Tab (තුන්වන icon)

```
✓ මුදල් ගිණුම් display
✓ "+" button → නව ගිණුමක්
✓ "එකතු කරන්න" → මුදල් add
✓ "අඩු කරන්න" → මුදල් remove

පළමු කටයුත්ත:
→ "+" button tap
→ නම: මුදල්
→ ශේෂය: 50000
→ සුරකින්න tap
```

### 4. Categories Tab (හතරවන icon)

```
✓ ප්‍රවර්ග grid
✓ "+" button → නව ප්‍රවර්ගයක්

පළමු කටයුත්ත:
→ "+" button tap
→ නම: ආහාර
→ අයිකෝනය: food (🍔)
→ වර්ණය: කොළ
→ සුරකින්න tap
```

### 5. Settings Tab (පස්වන icon)

```
✓ යෙදුම් සැකසුම්
✓ දත්ත කළමනාකරණය
✓ පිළිබඳව

පළමු කටයුත්ත:
→ Explore කරන්න!
```

---

## ⌨️ Keyboard Shortcuts

### Metro Bundler Commands:
```
r  - Reload app
d  - Open developer menu
j  - Open debugger
```

### Android Device:
```
Shake device - Open developer menu
R key (දෙවතාවක්) - Reload
```

---

## 🐛 වහාම විසඳිය හැකි ගැටළු

### ගැටළුව 1: "Metro bundler error"
```bash
# Solution:
npx react-native start --reset-cache
```

### ගැටළුව 2: "Unable to load script"
```bash
# Solution:
npm start -- --reset-cache

# නව terminal එකක:
npm run android
```

### ගැටළුව 3: "Could not connect to development server"
```bash
# Solution:
adb reverse tcp:8081 tcp:8081
npm start
npm run android
```

### ගැටළුව 4: Build fails
```bash
# Solution:
cd android
./gradlew clean
cd ..
npm run android
```

### ගැටළුව 5: App crashes
```bash
# Solution:
# 1. Uninstall app from device
# 2. Clean build:
rm -rf android/app/build
npm run android
```

---

## 📱 First Time Checklist

ඔබ පළමු වතාවට run කරද්දී:

- [ ] Node.js installed (v16+)
- [ ] npm available
- [ ] Android Studio installed
- [ ] Android SDK installed
- [ ] ANDROID_HOME set
- [ ] Virtual Device created OR Physical device connected
- [ ] USB Debugging ON (physical device නම්)
- [ ] `npm install` completed successfully
- [ ] Metro bundler started (`npm start`)
- [ ] App launched (`npm run android`)
- [ ] Dashboard visible
- [ ] Can add accounts
- [ ] Navigation works

---

## 🎊 සාර්ථක! දැන් කරන්න:

### ඉදිරි පියවර:

1. **Explore the App**
   - සියලු tabs අතර navigate කරන්න
   - ගිණුම් add, edit, delete කරන්න
   - ප්‍රවර්ග customize කරන්න

2. **Customize**
   - වර්ණ වෙනස් කරන්න
   - Default data වෙනස් කරන්න
   - ඔබට අවශ්‍ය ආකාරයට හදන්න

3. **Test Everything**
   - සියලු features test කරන්න
   - Data save වේද බලන්න (app close කර open කරන්න)
   - Different scenarios try කරන්න

4. **Build APK** (සූදානම් නම්)
   ```bash
   cd android
   ./gradlew assembleRelease
   # APK: android/app/build/outputs/apk/release/app-release.apk
   ```

5. **Share & Deploy**
   - APK file device එකට send කරන්න
   - Install කර test කරන්න
   - අවශ්‍ය නම් Play Store එකට submit කරන්න

---

## 📚 වැඩි විස්තර සඳහා:

- 📖 **README.md** - මූලික තොරතුරු
- 📖 **SETUP.md** - සම්පූර්ණ setup (English)
- 📖 **INSTALL_GUIDE_SINHALA.md** - සම්පූර්ණ ස්ථාපන මාර්ගෝපදේශය
- 📖 **FEATURES.md** - සියලු විශේෂාංග
- 📖 **PROJECT_SUMMARY.md** - Project overview

---

## 💡 Pro Tips

1. **Development Mode:**
   - Shake device → "Enable Live Reload"
   - Code වෙනස් කළහම auto reload වේ

2. **Debugging:**
   - Shake device → "Debug"
   - Chrome DevTools open වේ

3. **Performance:**
   - Release build APK test කරන්න
   - Debug build slow විය හැක

4. **Data:**
   - AsyncStorage use වේ
   - App uninstall කළහම data අහිමි වේ
   - Settings → Export use කරන්න (future)

5. **Updates:**
   - Code වෙනස් කළහම reload කරන්න
   - Dependencies වෙනස් කළහම rebuild කරන්න

---

## 🆘 උදව් අවශ්‍යද?

1. **මෙම guides කියවන්න:**
   - QUICK_START_SINHALA.md (මෙම ගොනුව)
   - INSTALL_GUIDE_SINHALA.md
   - FEATURES.md

2. **Error messages:**
   - Google කරන්න
   - Stack Overflow බලන්න

3. **React Native Docs:**
   - [Official Documentation](https://reactnative.dev)

4. **Community:**
   - React Native Discord
   - Reddit r/reactnative
   - Sri Lankan Developer Groups

---

## 🎉 සාර්ථකව ආරම්භ කළහම:

**ඔබ දැන් React Native developer කෙනෙක්!** 🎊

```
✅ App running
✅ All features working
✅ Ready to customize
✅ Ready to build
✅ Ready to deploy
```

**සතුටින් code කරන්න!** 💻✨

---

## 📞 Remember:

- 🚀 `npm start` - Metro start කරන්න
- 📱 `npm run android` - Android හි run කරන්න
- 🔄 `r` key - Reload කරන්න
- 🛠️ Shake device - Dev menu open කරන්න
- 🧹 `./gradlew clean` - Clean build කරන්න

---

**යෙදුම භාවිතයෙන් සතුටක් විඳින්න!** 🎊

*Made with ❤️ for Sri Lanka* 🇱🇰
