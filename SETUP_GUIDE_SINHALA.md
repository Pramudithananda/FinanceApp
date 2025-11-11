# 🇱🇰 ස්ථාපන මාර්ගෝපදේශය - Finance App Setup Guide

## 📱 මුදල් කළමනාකරණ යෙදුම ස්ථාපනය

මෙම මාර්ගෝපදේශය ඔබට යෙදුම සම්පූර්ණයෙන් ස්ථාපනය කර ධාවනය කිරීමට උදව් කරයි.

---

## 1️⃣ පළමු පියවර: අවශ්‍ය මෘදුකාංග ස්ථාපනය

### Node.js ස්ථාපනය

1. [nodejs.org](https://nodejs.org) වෙබ් අඩවියට යන්න
2. LTS (Long Term Support) version එක download කරන්න
3. ස්ථාපනය කරන්න
4. Terminal එක විවෘත කර පරීක්ෂා කරන්න:

```bash
node --version
# v16.0.0 හෝ වැඩි අංකයක් පෙන්විය යුතුයි
```

### React Native CLI ස්ථාපනය

```bash
npm install -g react-native-cli
```

### Android Development සඳහා (Android Studio)

1. [Android Studio](https://developer.android.com/studio) download කරන්න
2. Android Studio ස්ථාපනය කරන්න
3. Android SDK ස්ථාපනය කරන්න:
   - SDK Platforms: Android 13.0 (Tiramisu)
   - SDK Tools: Android SDK Build-Tools 33

4. Environment Variables සකසන්න:

**Windows:**
```
ANDROID_HOME = C:\Users\YourUsername\AppData\Local\Android\Sdk
Path = %ANDROID_HOME%\platform-tools
Path = %ANDROID_HOME%\tools
```

**Mac/Linux:**
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
```

### iOS Development සඳහා (Mac පමණක්)

1. Mac App Store එකෙන් Xcode ස්ථාපනය කරන්න
2. Command Line Tools ස්ථාපනය කරන්න:
```bash
xcode-select --install
```

3. CocoaPods ස්ථාපනය කරන්න:
```bash
sudo gem install cocoapods
```

---

## 2️⃣ දෙවන පියවර: Project එක Download කිරීම

### Option 1: Git භාවිතයෙන්

```bash
git clone https://github.com/yourusername/finance-app-mobile.git
cd finance-app-mobile
```

### Option 2: ZIP file එකක් ලෙස

1. GitHub repository එක වෙත යන්න
2. "Code" බොත්තම click කරන්න
3. "Download ZIP" තෝරන්න
4. ZIP එක extract කරන්න
5. Terminal එකෙන් folder එකට යන්න

---

## 3️⃣ තුන්වන පියවර: Dependencies ස්ථාපනය

### Node Modules ස්ථාපනය

```bash
# Project folder එකේ
npm install

# හෝ yarn භාවිතයෙන්
yarn install
```

මෙය කිහිප මිනිත්තුවක් ගතවනු ඇත. ඉවසන්න... ☕

### iOS සඳහා (Mac පමණක්)

```bash
cd ios
pod install
cd ..
```

---

## 4️⃣ සිව්වන පියවර: යෙදුම ධාවනය කිරීම

### Android හි ධාවනය

1. Android device එකක් USB හරහා සම්බන්ධ කරන්න හෝ emulator එකක් start කරන්න

2. USB Debugging සබල කරන්න:
   - Settings > About Phone > Build Number (7 වතාවක් tap කරන්න)
   - Settings > Developer Options > USB Debugging (සබල කරන්න)

3. Terminal එකෙන්:

```bash
# Metro bundler start කරන්න
npm start

# නව terminal එකක
npm run android
```

### iOS හි ධාවනය (Mac පමණක්)

```bash
# Metro bundler start කරන්න
npm start

# නව terminal එකක
npm run ios
```

---

## 5️⃣ පස්වන පියවර: යෙදුම භාවිතය

### Dashboard

- **සම්පූර්ණ ශේෂය** - ඔබේ සියලුම ගිණුම්වල මුළු මුදල
- **බැංකු ශේෂය** - බැංකු ගිණුම්වල ඇති මුදල
- **මුදල් ශේෂය** - අතේ ඇති මුදල

### ගිණුමක් එකතු කිරීම

1. Dashboard එකේ "+" බොත්තම click කරන්න
2. ගිණුම් විස්තර ඇතුළත් කරන්න:
   - ගිණුම් නම (උදා: People's Bank)
   - ගිණුම් අංකය
   - ආරම්භක ශේෂය
3. "සුරකින්න" click කරන්න

### ගනුදෙනුවක් එකතු කිරීම

1. බැංකු තැන්පතක් / මුදල් ලබාගැනීමක් / වියදමක් තෝරන්න
2. මුදල ඇතුළත් කරන්න
3. විස්තරය ඇතුළත් කරන්න (අත්‍යවශ්‍ය නොවේ)
4. "සුරකින්න" click කරන්න

---

## 🔧 ගැටළු විසඳීම

### ගැටළුව 1: Metro bundler start නොවේ

```bash
npm start -- --reset-cache
```

### ගැටළුව 2: Android build fail වේ

```bash
cd android
./gradlew clean
cd ..
npm run android
```

### ගැටළුව 3: "Command not found" error

Node.js සහ npm නිවැරදිව ස්ථාපනය වී ඇත්දැයි පරීක්ෂා කරන්න:
```bash
node --version
npm --version
```

### ගැටළුව 4: Icons පෙන්වන්නේ නැත

```bash
# App එක rebuild කරන්න
npm run android  # හෝ npm run ios
```

### ගැටළුව 5: iOS pods ගැටළුව

```bash
cd ios
rm -rf Pods
pod deintegrate
pod install
cd ..
```

---

## 📱 APK එකක් හැදීම (Android)

ඔබේ මිතුරන් සමඟ share කිරීමට APK එකක් හැදීමට:

```bash
cd android
./gradlew assembleRelease
```

APK එක මෙම ස්ථානයේ ඇත:
```
android/app/build/outputs/apk/release/app-release.apk
```

---

## 🎨 යෙදුම Customize කිරීම

### 1. යෙදුම් නම වෙනස් කිරීම

`app.json` file එක edit කරන්න:
```json
{
  "displayName": "මගේ මුදල් යෙදුම"
}
```

### 2. වර්ණ වෙනස් කිරීම

`utils/constants.js` file එක edit කරන්න:
```javascript
export const COLORS = {
  primary: '#4F46E5',  // ඔබේ ප්‍රධාන වර්ණය
  // ...
};
```

### 3. ආරම්භක දත්ත වෙනස් කිරීම

`App.js` file එකේ `useState` values වෙනස් කරන්න:
```javascript
const [accounts, setAccounts] = useState([
  { id: 1, name: "ඔබේ බැංකුව", balance: 0 },
  // ...
]);
```

---

## 💡 උපදෙස්

1. **දත්ත සුරක්ෂිතව ඇත** - ඔබේ දත්ත device එකේ පමණක් save වේ
2. **Internet අවශ්‍ය නැත** - App එක offline වැඩ කරයි
3. **නිතර backup ගන්න** - දත්ත නැතිවීම වැළැක්වීමට
4. **Regular updates** - නව features සඳහා යාවත්කාලීන කරන්න

---

## 📞 උදව් අවශ්‍යද?

- 📧 Email: support@financeapp.com
- 🐛 GitHub Issues හරහා ගැටළු වාර්තා කරන්න
- 💬 සාකච්ඡා සඳහා GitHub Discussions

---

## ✅ සාර්ථකව ස්ථාපනය වුණාද?

යෙදුම සාර්ථකව ධාවනය වන්නේ නම්:
- ✅ Dashboard එක පෙනේ
- ✅ ගිණුම් එකතු කළ හැකියි
- ✅ දත්ත save වේ
- ✅ Navigation වැඩ කරයි

සියල්ල හරි නම්, ඔබ සාර්ථකයි! 🎉

---

<div align="center">

**සුභ පැතුම්!**

**ඔබේ මුදල් කළමනාකරණ ගමන ආරම්භ කරන්න! 💰**

</div>
