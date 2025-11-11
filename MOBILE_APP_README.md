# 💰 මුදල් කළමනාකරණ - Finance Management Mobile App

A beautiful and modern React Native mobile application for personal finance management with full Sinhala language support.

## 📱 Features

### 🎯 Dashboard View
- **සම්පූර්ණ ශේෂය (Total Balance)** - View your complete financial overview
- **බැංකු ශේෂය (Bank Balance)** - Track all your bank accounts
- **මුදල් ශේෂය (Cash Balance)** - Monitor your cash holdings
- **Real-time Balance Updates** - Instant calculations and updates

### 🏦 Account Management
- **බැංකු ගිණුම් (Bank Accounts)**
  - People's Bank account
  - Commercial Bank account
  - පිබිදී account
  - Add new bank accounts
  
- **මුදල් ගිණුම් (Cash Accounts)**
  - Track cash in hand
  - Multiple cash account support

### 🎨 Modern UI/UX
- Beautiful gradient cards with shadow effects
- Smooth navigation with bottom tab bar
- Color-coded account cards (Indigo, Green, Orange, Purple)
- Responsive design optimized for mobile devices
- Complete Sinhala (සිංහල) language interface

### 📊 Navigation Tabs
1. **Dashboard** 🏠 - Main overview screen
2. **Bank** 🏦 - Bank account details
3. **Cash** 💰 - Cash management
4. **Categories** 📁 - Expense categories
5. **Settings** ⚙️ - App settings

## 🚀 Installation & Setup

### Prerequisites
- Node.js (v16 or higher)
- React Native development environment
- Android Studio (for Android) or Xcode (for iOS)
- Java Development Kit (JDK 11 or higher)

### For Android Development

1. **Install Android Studio**
   - Download from: https://developer.android.com/studio
   - Install Android SDK
   - Set up Android Virtual Device (AVD)

2. **Set Environment Variables**
   ```bash
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/tools/bin
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

### Quick Start

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd <project-folder>
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Start Metro Bundler**
   ```bash
   npm start
   # or
   yarn start
   ```

4. **Run on Android**
   ```bash
   # In a new terminal window
   npm run android
   # or
   yarn android
   ```

5. **Run on iOS** (Mac only)
   ```bash
   cd ios && pod install && cd ..
   npm run ios
   # or
   yarn ios
   ```

## 📦 Building APK for Android

### Debug APK
```bash
cd android
./gradlew assembleDebug
```
APK location: `android/app/build/outputs/apk/debug/app-debug.apk`

### Release APK
```bash
cd android
./gradlew assembleRelease
```
APK location: `android/app/build/outputs/apk/release/app-release.apk`

### Install APK on Device
```bash
# Connect your Android device via USB with debugging enabled
adb install android/app/build/outputs/apk/release/app-release.apk
```

## 🏗️ Project Structure

```
FinanceManagementApp/
├── android/              # Android native code
├── ios/                  # iOS native code
├── src/
│   └── FinanceApp.jsx   # Main app component
├── App.js               # Root component
├── index.js             # App entry point
├── app.json             # App configuration
├── package.json         # Dependencies
├── babel.config.js      # Babel configuration
└── metro.config.js      # Metro bundler config
```

## 🎨 UI Components

### Account Cards
Each account card displays:
- Account name (සිංහල/English)
- Account number
- Current balance in LKR (රු)
- Color-coded by bank/type
- Default account indicator

### Balance Summary
- Total balance card with prominent display
- Split view: Bank vs Cash balance
- Color-coded for quick recognition

### Navigation
- Fixed bottom navigation bar
- 5 main sections with icons
- Active tab highlighting
- Smooth transitions

## 💻 Technology Stack

- **Framework:** React Native 0.72
- **Language:** JavaScript (React JSX)
- **UI:** StyleSheet (React Native native styling)
- **State Management:** React Hooks (useState)
- **Storage:** AsyncStorage (ready for implementation)
- **Navigation:** Custom bottom tab navigation

## 🔧 Configuration

### App Name & Display Name
Edit `app.json`:
```json
{
  "name": "FinanceManagementApp",
  "displayName": "මුදල් කළමනාකරණ"
}
```

### Change App Icon
Replace the following files:
- Android: `android/app/src/main/res/mipmap-*/ic_launcher.png`
- iOS: `ios/FinanceManagementApp/Images.xcassets/AppIcon.appiconset/`

### Splash Screen
- Android: `android/app/src/main/res/drawable/splash.xml`
- iOS: `ios/FinanceManagementApp/LaunchScreen.storyboard`

## 📊 Data Structure

### Account Object
```javascript
{
  id: number,
  name: string,
  number: string,
  balance: number,
  type: 'bank' | 'cash'
}
```

### Sample Data
```javascript
accounts: [
  { id: 1, name: "People's Bank", number: '1234567890', balance: 155000, type: 'bank' },
  { id: 2, name: "Commercial Bank", number: '0987654321', balance: 0, type: 'bank' },
  { id: 3, name: "පිබිදී", number: '2558', balance: 20800, type: 'bank' }
]
```

## 🌟 Features Coming Soon

- [ ] Add/Edit/Delete bank accounts
- [ ] Transaction history
- [ ] Income & expense tracking
- [ ] Budget categories management
- [ ] Data persistence (AsyncStorage/SQLite)
- [ ] Charts and analytics
- [ ] Export reports (PDF/Excel)
- [ ] Multi-currency support
- [ ] Cloud backup & sync
- [ ] Biometric authentication
- [ ] Dark mode

## 🐛 Troubleshooting

### Metro Bundler Issues
```bash
# Clear cache
npm start -- --reset-cache
```

### Android Build Errors
```bash
cd android
./gradlew clean
cd ..
npm run android
```

### iOS Pod Install Issues
```bash
cd ios
pod deintegrate
pod install
cd ..
npm run ios
```

### Port Already in Use
```bash
# Kill process on port 8081
npx react-native start --port=8082
```

## 📱 Device Requirements

### Android
- Minimum SDK: 21 (Android 5.0 Lollipop)
- Target SDK: 33 (Android 13)
- Required permissions:
  - INTERNET (for future updates)
  - WRITE_EXTERNAL_STORAGE (for data backup)
  - READ_EXTERNAL_STORAGE (for data restore)

### iOS
- Minimum iOS version: 12.4
- Supported devices: iPhone 6s and newer

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- React Native community
- Sri Lankan developer community
- Sinhala Unicode support

## 📞 Support

For issues and questions:
- Create an issue on GitHub
- Email: support@example.com

---

**Made with ❤️ for Sri Lankan community**

**ශ්‍රී ලාංකීය ප්‍රජාව සඳහා ආදරයෙන් නිර්මාණය කරන ලදී** 🇱🇰

## 🎯 Code Overview

### Main Component Structure

The app uses a single-component architecture with embedded sub-components:

```javascript
FinanceApp (Main Component)
├── State Management (useState hooks)
│   ├── activeTab - Current navigation tab
│   └── accounts - Array of bank/cash accounts
├── Helper Functions
│   └── formatCurrency - Format numbers as LKR currency
├── Sub-Components
│   ├── AccountCard - Individual account display
│   ├── DashboardView - Main dashboard screen
│   └── PlaceholderView - Placeholder for other tabs
└── Bottom Navigation - 5-tab navigation bar
```

### Styling Approach

Uses React Native StyleSheet for optimal performance:
- All styles defined in a single StyleSheet.create() call
- Conditional styling with array syntax
- Dynamic colors based on account type
- Shadow effects for depth (elevation on Android, shadow* on iOS)

### Key Functions

1. **formatCurrency(amount)**
   - Converts numbers to Sri Lankan Rupee format
   - Returns: `රු 155,000`

2. **AccountCard({ account })**
   - Renders individual account cards
   - Dynamic color selection
   - Shows account name, number, balance

3. **DashboardView()**
   - Main dashboard layout
   - Total balance summary
   - Bank/Cash split view
   - Account listings

## 🔐 Security Notes

For production builds:
1. Sign your APK with a keystore
2. Enable ProGuard for code obfuscation
3. Use environment variables for sensitive data
4. Implement proper authentication
5. Encrypt stored data

## 📈 Performance Tips

1. **Optimize Images**: Use appropriate sizes and formats
2. **Lazy Loading**: Implement for long lists
3. **Memoization**: Use React.memo for heavy components
4. **FlatList**: Replace ScrollView for large datasets
5. **Native Driver**: Enable for animations

## 🌐 Localization

Currently supports:
- **Sinhala (සිංහල)** - Primary UI language
- **English** - Secondary/technical terms

To add more languages, implement i18n library like `react-i18next`.

---

**App Version:** 1.0.0  
**Last Updated:** 2025-11-11  
**React Native Version:** 0.72.0
