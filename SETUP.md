# 📱 මුදල් කළමනාකරණ Mobile App - Setup Guide

## සම්පූර්ණ React Native මුදල් කළමනාකරණ යෙදුම

මෙය සම්පූර්ණයෙන්ම සිංහල භාෂාවෙන් ක්‍රියාත්මක වන, ඔබගේ පෞද්ගලික මුදල් කළමනාකරණය සඳහා නිර්මාණය කරන ලද React Native mobile application එකකි.

---

## 🎯 විශේෂාංග

### 💼 ගිණුම් කළමනාකරණය
- ✅ බැංකු ගිණුම් එකතු කිරීම, සංස්කරණය, මකා දැමීම
- ✅ මුදල් ගිණුම් කළමනාකරණය
- ✅ තත්‍ය කාලීන ශේෂ update
- ✅ බහු ගිණුම් සහාය

### 📊 Dashboard
- ✅ සම්පූර්ණ ශේෂය පෙන්වීම
- ✅ බැංකු ශේෂය සහ මුදල් ශේෂය වෙන වෙනම
- ✅ ගිණුම් කාඩ් වර්ණවත් interface
- ✅ ඉක්මන් navigation

### 🏷️ ප්‍රවර්ග කළමනාකරණය
- ✅ Custom වියදම් ප්‍රවර්ග නිර්මාණය
- ✅ අයිකෝන සහ වර්ණ customization
- ✅ ප්‍රවර්ග සංස්කරණය සහ මකා දැමීම
- ✅ Grid layout සහිත පෙන්වීම

### ⚙️ සැකසුම්
- ✅ දත්ත නිර්යාත සහ උපස්ථය
- ✅ යෙදුම් තොරතුරු
- ✅ සියලු දත්ත මකා දැමීමේ විකල්පය
- ✅ භාෂා සහ මුදල් සැකසුම්

### 💾 දත්ත ස්ථිරතාව
- ✅ AsyncStorage භාවිතා කරමින් දත්ත ගබඩා කිරීම
- ✅ ස්වයංක්‍රීය save සහ load
- ✅ දත්ත අහිමි නොවීම

---

## 📋 පූර්ව අවශ්‍යතා

ඔබගේ පද්ධතියේ පහත දේවල් install කර තිබිය යුතුය:

### 1. Node.js සහ npm
```bash
# Node.js version 16 හෝ ඉහළ
node --version
npm --version
```

### 2. React Native Development Environment

#### Android සඳහා:
- Java Development Kit (JDK 11)
- Android Studio
- Android SDK
- Android Virtual Device (AVD) හෝ physical device

#### iOS සඳහා (Mac පමණි):
- Xcode 12 හෝ ඉහළ
- CocoaPods
- iOS Simulator හෝ physical device

---

## 🚀 Installation Instructions

### Step 1: Dependencies Install කිරීම

```bash
# Project directory එකට යන්න
cd /workspace

# Dependencies install කරන්න
npm install

# iOS සඳහා (Mac පමණි)
cd ios && pod install && cd ..
```

### Step 2: Metro Bundler Start කිරීම

```bash
npm start
```

### Step 3: යෙදුම Run කිරීම

#### Android සඳහා:
```bash
# Terminal එකක නව window එකක
npm run android
```

#### iOS සඳහා (Mac පමණි):
```bash
npm run ios
```

---

## 🏗️ Project Structure

```
/workspace/
├── App.js                          # Main App component with navigation
├── index.js                        # App entry point
├── app.json                        # App configuration
├── package.json                    # Dependencies
├── babel.config.js                 # Babel configuration
├── metro.config.js                 # Metro bundler config
│
├── src/
│   ├── context/
│   │   └── AppContext.js          # Global state management
│   │
│   ├── screens/
│   │   ├── DashboardScreen.js     # මුල් පිටුව
│   │   ├── BankScreen.js          # බැංකු ගිණුම්
│   │   ├── CashScreen.js          # මුදල් ගිණුම්
│   │   ├── CategoriesScreen.js    # ප්‍රවර්ග
│   │   └── SettingsScreen.js      # සැකසුම්
│   │
│   └── utils/
│       └── formatters.js          # Currency & date formatters
│
└── android/                        # Android project files
└── ios/                           # iOS project files (Mac only)
```

---

## 🎨 UI Components හා Features

### 1. Dashboard Screen
- සම්පූර්ණ ශේෂය display කරන විශාල කාඩ්පතක්
- බැංකු හා මුදල් summary cards
- ගිණුම් list කිරීම වර්ණවත් cards වලින්
- ඉක්මන් navigation buttons

### 2. Bank Screen
- සියලුම බැංකු ගිණුම් පෙන්වීම
- නව ගිණුම් එකතු කිරීම
- ගිණුම් සංස්කරණය කිරීම
- ගිණුම් මකා දැමීම
- Modal-based forms

### 3. Cash Screen
- මුදල් ගිණුම් කළමනාකරණය
- මුදල් එකතු කිරීම/අඩු කිරීම
- ඉක්මන් ගනුදෙනු interface
- Real-time balance updates

### 4. Categories Screen
- ප්‍රවර්ග grid view
- Custom අයිකෝන තෝරා ගැනීම
- වර්ණ customization
- Live preview
- Edit/Delete options

### 5. Settings Screen
- දත්ත කළමනාකරණ options
- යෙදුම් තොරතුරු
- Links සහ resources
- Version info

---

## 🔧 Customization

### වර්ණ වෙනස් කිරීම

Colors `StyleSheet` objects වල හමුවේ:

```javascript
// උදාහරණයක්: DashboardScreen.js හි
const styles = StyleSheet.create({
  totalBalanceAmount: {
    color: '#4F46E5', // මෙය වෙනස් කරන්න
  },
});
```

### නව විශේෂාංග එකතු කිරීම

1. නව screen component එකක් create කරන්න `/src/screens/` හි
2. `App.js` හි Tab.Screen එකක් එකතු කරන්න
3. Context හි අවශ්‍ය state logic එකතු කරන්න

### දත්ත Structure වෙනස් කිරීම

`AppContext.js` හි initial state වෙනස් කරන්න:

```javascript
const [accounts, setAccounts] = useState([
  // ඔබගේ custom accounts මෙතැන
]);
```

---

## 📱 Building for Production

### Android APK Build කිරීම

```bash
cd android
./gradlew assembleRelease

# APK file location:
# android/app/build/outputs/apk/release/app-release.apk
```

### Android AAB (Play Store) Build කිරීම

```bash
cd android
./gradlew bundleRelease

# AAB file location:
# android/app/build/outputs/bundle/release/app-release.aab
```

### iOS Build කිරීම (Mac only)

```bash
# Xcode open කරන්න
open ios/MudalKalamanakarna.xcworkspace

# Xcode භාවිතයෙන් build & archive කරන්න
```

---

## 🐛 Common Issues & Solutions

### Issue 1: Metro Bundler Port Already in Use
```bash
# Port kill කරන්න
npx react-native start --reset-cache
```

### Issue 2: Android Build Fails
```bash
# Clean build
cd android
./gradlew clean
cd ..
npm run android
```

### Issue 3: iOS Pods Error (Mac)
```bash
cd ios
pod deintegrate
pod install
cd ..
```

### Issue 4: AsyncStorage Error
```bash
npm install @react-native-async-storage/async-storage
# iOS සඳහා
cd ios && pod install && cd ..
```

---

## 📚 Dependencies

### Main Dependencies:
- `react-native`: ^0.72.6
- `@react-navigation/native`: ^6.1.9
- `@react-navigation/bottom-tabs`: ^6.5.11
- `@react-native-async-storage/async-storage`: ^1.19.5
- `react-native-vector-icons`: ^10.0.2
- `react-native-safe-area-context`: ^4.7.4
- `react-native-screens`: ^3.27.0

### Dev Dependencies:
- `@babel/core`: ^7.20.0
- `metro-react-native-babel-preset`: 0.76.8
- `eslint`: ^8.19.0
- `prettier`: ^2.4.1

---

## 🤝 Contributing

යෝජනා හා දායකත්වය සාදරයෙන් පිළිගනිමු!

1. Fork කරන්න
2. Feature branch එකක් සාදන්න (`git checkout -b feature/AmazingFeature`)
3. Changes commit කරන්න (`git commit -m 'Add some AmazingFeature'`)
4. Branch එක push කරන්න (`git push origin feature/AmazingFeature`)
5. Pull Request එකක් open කරන්න

---

## 📄 License

MIT License - නිදහස් භාවිතය සඳහා

---

## 💡 Tips & Best Practices

1. **Regular Backups**: දත්ත export feature එක නිතර භාවිතා කරන්න
2. **Account Names**: පැහැදිලි ගිණුම් නම් භාවිතා කරන්න
3. **Categories**: ව්‍යාපෘති අනුව ප්‍රවර්ග customize කරන්න
4. **Data Management**: Settings හි clear data option ප්‍රවේශමෙන් භාවිතා කරන්න

---

## 📞 Support

Issue තිබේ නම් GitHub Issues හරහා දන්වන්න.

---

## 🎉 Acknowledgments

- React Native Team
- React Navigation
- Material Community Icons
- Sri Lankan Developer Community

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*
