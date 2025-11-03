# 💰 මුදල් කළමනාකරණ (Expo React Native)

මූලික React වෙබ් සංස්කරණයක් වෙනුවට දැනටමත් ඉදිරිපත් කර ඇති සිංහල මුදල් කළමනාකරණ අත්දැකීම Expo/React Native මත නැවත නිර්මාණය කර ඇත. මෙහි අරමුණ සජීවී Android ජංගම යෙදුමක් ලෙස පවත්වාගෙන යාම සහ `.apk` ගොනුවක් නැවත ගොඩනඟා බාගත කිරීමට අවශ්‍ය සියලු පියවර repository එක තුළින්ම සපයීමයි.

## 🔍 Repo & APK විශ්ලේෂණ සාරාංශය
- මුල් APK එක Hermes bundle භාවිතයෙන් React Native CLI new architecture මත ගොඩනංවා තිබුණා (arm64/armeabi-v7a/x86/x86_64 libs සහ `assets/index.android.bundle`).
- AsyncStorage මඟින් offline state persistence ක්‍රියාත්මක වී ඇති බව bundle එකෙන් දැක්කා.
- Repo එක තුළ තිබුණේ DeepSeek generated `.jsx` snippet ගොනු කිහිපයයි. Expo project structure, build scripts, package.json වැනි මූලික ගොනු නොමැති නිසා නිවැරදි build එකක් කල නොහැකියි.
- මේ commit තුළ Expo SDK 51 (React Native 0.74) පදනම්ව සම්පූර්ණ `src/` tree, styles, AsyncStorage utility, Sinhala UI copy සියල්ල නැවත සකස් කර අවශ්‍ය npm scripts එකතු කලා.

## 📁 Project Structure
```
.
├── App.js                 # Expo entry (re-export)
├── app.json               # Expo app config (Android package id, version)
├── babel.config.js        # babel-preset-expo
├── package.json           # dependencies + build scripts
└── src/
    ├── App.js             # main application container
    ├── styles.js          # centralized StyleSheet definitions
    ├── components/
    │   ├── ActionButton.js
    │   ├── BalanceCard.js
    │   ├── CategoryCard.js
    │   ├── Header.js
    │   ├── TransactionItem.js
    │   └── Modals/
    │       ├── CategoryDetailsModal.js
    │       ├── CategoryModal.js
    │       └── TransactionModal.js
    └── utils/
        ├── formatters.js  # Intl currency helpers (LKR → රු)
        └── storage.js     # AsyncStorage persistence layer
```

## 🌟 විශේෂාංග
- **සිංහල UI**: මුළු copy එකම Sinhala/emoji blend එකක් ලෙස Expo app එකේ hard-coded.
- **දත්ත ඉතිරි කිරීම**: `@react-native-async-storage/async-storage` මඟින් bank/cash balances, categories, transactions local device එකේ cache කරයි.
- **කාණ්ඩ කළමනාකරණය**: Create/Edit/Delete + detail modal (target, spent, unit price, remaining) සහ filtered transaction list.
- **ගනුදෙනු modal තුළ validations**: Bank → Cash transfers, expenses ඉවත් කිරීමට ප්‍රමාණ සීමා, සිංහල Alert copy.
- **Responsive styling**: Pure React Native StyleSheet (no tailwind/3rd party) නිසා Expo Bare/managed දෙකම සමඟ වැඩ.

## ✅ අවශ්‍යතා
- Node.js 18.x හෝ ඊට ඉහළ (Expo SDK 51 requirement).
- npm (v9+) හෝ yarn.
- Android Studio + SDK / device driver (APK build එක localව generate করන්නේ නම්).
- Expo CLI commands (`npx expo ...`) internet access.

## 🚀 Development Mode ක්‍රියාත්මක කිරීම
- `npm install`
- `npx expo start` → Metro bundler UI එකේ Android Emulator හෝ Physical Device connect කර `a` / QR scan.
- Offline persistence test කරන්න නම් Expo Go මඟින් run කර බලන්න (AsyncStorage නව installation Expo managed workflow එකේ auto-configured).

## 🏗️ APK Build Options
- **Scripts (package.json)**
  - `npm run android` → `expo run:android` (debug build, requires Android SDK)
  - `npm run android:release` → `expo run:android --variant release` (installs release build to connected device/emulator)
  - `npm run build:android-apk` → `expo prebuild --platform android --clean && cd android && ./gradlew assembleRelease`
- **Local Gradle build (unsigned universal APK produced at `android/app/build/outputs/apk/release/app-release.apk`)**
  1. `npm run build:android-apk`
  2. output APK sign/align manually (debug keystore auto applied; for production keystore update `android/app/build.gradle`).
- **EAS Build (Remote signed binaries)**
  - `npm install -g eas-cli`
  - `eas login`
  - add `extra.eas.projectId` to `app.json` (Expo project dashboard → Project ID)
  - `eas build --platform android --profile preview --output ./dist/app-preview.apk`
  - optional: `--profile production` for Google Play ready AAB.

> 🔐 Production signing: `expo prebuild` generates bare Android project. Update `android/app/build.gradle` signingConfigs + `gradle.properties` පසුදා Play Console signing certs එකට.

## 🧪 Smoke Tests / QA Checklist
- `npm run lint` (eslint-config-expo) – optional but included for CI.
- Expo Go device smoke test: add income/expense, close/open app → AsyncStorage data persistsද බලන්න.
- Release APK install (`adb install app-release.apk`) verify Sinhala copy renders without glyph fallback.

## 🔄 Customization Hints
- `DEFAULT_CATEGORIES` array (`src/App.js`) සකස් කර තමන්ගේ කාණ්ඩ set එක preload කරන්න.
- Balance starting values (`bankBalance`, `cashBalance`) change කර Cashflow simulation customize කරන්න.
- Currency formatter `src/utils/formatters.js` → change to multi-currency (Intl.NumberFormat) if රු නොවන ගනුදෙනු අවශ්‍ය නම්.
- Styles file එකේ gradient colors / spacing update කිරීමෙන් Corporate branding එක සඳහා UI match කරන්න.

## 🗺️ Roadmap Ideas
- Firebase/SQLite sync to backup data across devices.
- Charts (Victory Native / Reanimated) for expense breakdown.
- User authentication to share wallets within family.
- Push notifications (Expo Notifications) for payment reminders.

## 🙌 ස්තුතියි
- මුල් APK එකේ logic එක ගොඩනගා ඇති නිසා async-storage schema එක සහ Sinhala wording එකක් තබාගෙන Expo managed workflow එකට නැවත ගොඩනඟන ලදි.
- ඔබට විශේෂ feature අවශ්‍ය නම් Issues/PRs welcome.
