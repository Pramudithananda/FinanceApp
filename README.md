# 💰 මුදල් කළමනාකරණ (React Native / Expo)

Sinhala-first personal finance tracker for managing bank balances, cash in hand, and budget categories on Android or iOS. The repository now ships as an Expo-managed React Native project so you can inspect, modify, and rebuild an APK without reverse-engineering the original binary.

## 🌟 Feature Highlights
- Track separate bank and cash balances with automatic transfers
- Quick Sinhala UI flows for deposits, income transfers, and expenses
- Budget categories with progress bars, remaining totals, and unit price hints
- AsyncStorage-powered offline persistence (`budgetTrackerWorkingV23` key)
- Transaction history with Sinhala copy and emoji indicators

## 🗂️ Repository Layout

```
.
├── App.js                  # Expo entry point
├── app.json                # Expo project configuration (rename android.package as needed)
├── babel.config.js         # Uses babel-preset-expo
├── eas.json                # EAS Build profiles (apk + aab)
├── package.json            # Dependencies (Expo 51, RN 0.74, AsyncStorage)
├── src/
│   ├── App.js              # Main app container
│   ├── components/         # UI components + modals
│   ├── styles.js           # Single StyleSheet for the app
│   └── utils/              # AsyncStorage + formatting helpers
└── මුදල් කළමනාකරණ_1.0.apk   # Original release for reference
```

## 🚀 Getting Started

1. **Install prerequisites**
   - Node.js ≥ 18 (LTS recommended)
   - `npm install --global expo-cli` (optional but convenient)

2. **Install project dependencies**
   ```bash
   npm install
   ```

3. **Run in development mode**
   ```bash
   npm start        # launches Expo Dev Tools
   ```
   - Press **a** in the terminal to open the Android emulator
   - Or scan the QR code with Expo Go on a physical device

4. **Reset cached storage during testing (optional)**
   ```javascript
   import AsyncStorage from '@react-native-async-storage/async-storage';
   await AsyncStorage.removeItem('budgetTrackerWorkingV23');
   ```

## 🧪 Local Release Build (without cloud services)

You can generate a signed APK locally with the Android SDK:

1. Install Android Studio + command-line tools and accept required licenses.
2. Run a native prebuild so Gradle projects are generated:
   ```bash
   npx expo prebuild --platform android
   ```
3. Place your keystore under `android/app/` and add the credentials block to `android/app/build.gradle` (or let Gradle prompt for it at build time).
4. Build the release APK:
   ```bash
   cd android
   ./gradlew assembleRelease    # outputs app-release.apk in android/app/build/outputs/apk/release
   ```
5. Copy the generated APK back up to the repo (e.g., `dist/app-release.apk`) for distribution.

> 🔁 If you prebuild locally, remember to re-run `npx expo prebuild --clean` whenever `app.json` or native modules change.

## ☁️ Cloud Build with EAS (recommended)

Expo Application Services dramatically simplifies release management. A starter `eas.json` is already included.

1. Install the CLI and log in:
   ```bash
   npm install --global eas-cli
   eas login
   ```
2. Configure your Android package name in `app.json` (`expo.android.package`). It must be unique across the Play Store.
3. Trigger an internal testing APK build:
   ```bash
   eas build --platform android --profile preview
   ```
4. Watch progress:
   ```bash
   eas build:status
   ```
5. Download the artifact from the Expo dashboard (or via the link printed in the terminal). The `preview` profile in `eas.json` is already set to produce an APK. Use the `production` profile for Play Store AABs.

## 🔍 Notes from the Original APK Audit
- APK extracted to `apk_extracted/` for reference (`assets/index.android.bundle`, native libs, manifest, etc.).
- String analysis shows the UI copy is Sinhala + emoji, matching the rebuilt components.
- AsyncStorage usage was inferred from embedded bundle heuristics and preserved via the same `budgetTrackerWorkingV23` storage key, so existing installs can migrate seamlessly if the package name remains unchanged.
- The new Expo layout keeps the logic modular (components, utils, styles) making it easier to extend before issuing another release.

## 🧭 Next Steps & Customisation Ideas
- Extend `CategoryDetailsModal` with charts or export options
- Connect to a remote backend instead of AsyncStorage if multi-device sync is required
- Localise the copy further by introducing an i18n layer (`react-intl` / `expo-localization`)
- Automate builds via CI (`eas build --non-interactive` + GitHub Actions)

---

**Made with ❤️ for the Sri Lankan community** – feel free to open issues or improvements in Sinhala or English.
