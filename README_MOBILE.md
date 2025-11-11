# 💰 මුදල් කළමනාකරණ - Mobile App

A React Native mobile application for personal finance management with Sinhala language support.

## 📱 Features

### 🏦 Account Management
- **Multiple Bank Accounts** - Track multiple bank accounts with names and account numbers
- **Cash Balance** - Manage on-hand cash
- **Real-time Balance** - Automatic calculation of total balance
- **Account Cards** - Beautiful card-based UI for each account

### 📊 Dashboard
- **Total Balance Display** - View your complete financial overview
- **Bank Balance Summary** - Quick view of all bank accounts
- **Cash Balance** - Current cash on hand
- **Account Listings** - Organized view of all accounts

### 🎨 Modern UI/UX
- **Material Design Icons** - Using react-native-vector-icons
- **Bottom Tab Navigation** - Easy navigation between sections
- **Sinhala Language Support** - Complete Sinhala interface
- **Responsive Design** - Optimized for mobile devices
- **Data Persistence** - AsyncStorage for local data storage

## 🚀 Getting Started

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn
- React Native CLI
- Android Studio (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. **Install dependencies**
   ```bash
   npm install
   ```

2. **Install pods (iOS only)**
   ```bash
   cd ios && pod install && cd ..
   ```

3. **Run on Android**
   ```bash
   npm run android
   ```

4. **Run on iOS**
   ```bash
   npm run ios
   ```

### Project Structure

```
finance-app-mobile/
├── android/                 # Android native code
├── ios/                     # iOS native code (if needed)
├── src/
│   ├── components/          # Reusable components
│   │   └── AccountCard.js
│   ├── screens/             # Screen components
│   │   ├── DashboardScreen.js
│   │   ├── BankScreen.js
│   │   ├── CashScreen.js
│   │   ├── CategoriesScreen.js
│   │   └── SettingsScreen.js
│   └── utils/               # Utility functions
│       ├── formatters.js
│       └── storage.js
├── App.js                   # Main app component
├── index.js                 # Entry point
└── package.json
```

## 📦 Dependencies

### Core
- `react` - React library
- `react-native` - React Native framework
- `@react-navigation/native` - Navigation library
- `@react-navigation/bottom-tabs` - Bottom tab navigator

### UI & Icons
- `react-native-vector-icons` - Icon library (MaterialCommunityIcons)

### Storage
- `@react-native-async-storage/async-storage` - Local data persistence

### Utilities
- `react-native-safe-area-context` - Safe area handling
- `react-native-screens` - Native screen components

## 🎯 Key Components

### DashboardScreen
Main screen displaying:
- Total balance card
- Bank and cash balance statistics
- List of bank accounts
- Cash account display

### AccountCard
Reusable component for displaying account information:
- Account name and number
- Current balance
- Color-coded cards
- Active indicator for primary account

### Navigation
Bottom tab navigation with 5 tabs:
1. **Dashboard** - Main overview
2. **Bank** - Bank account management
3. **Cash** - Cash management
4. **Categories** - Expense categories
5. **Settings** - App settings

## 🔧 Configuration

### Android Setup

1. Ensure Android SDK is installed
2. Set up Android emulator or connect physical device
3. Run `npm run android`

### iOS Setup (macOS only)

1. Install Xcode and CocoaPods
2. Run `cd ios && pod install`
3. Run `npm run ios`

## 📝 Code Analysis

### Original Web Component Features
The original React web component included:
- Dashboard view with account cards
- Bottom navigation (5 tabs)
- Account management (bank accounts with names, numbers, balances)
- Sinhala language interface
- Modern UI with Tailwind CSS

### Mobile App Conversion
Converted to React Native with:
- ✅ Same dashboard layout and features
- ✅ Bottom tab navigation using React Navigation
- ✅ Account cards with same design principles
- ✅ Sinhala language support maintained
- ✅ Native mobile styling with StyleSheet
- ✅ Data persistence with AsyncStorage
- ✅ Material Design icons

## 🎨 Styling

The app uses React Native StyleSheet for styling:
- Consistent color scheme (Indigo primary: #4f46e5)
- Card-based UI design
- Shadow effects for depth
- Responsive layouts

## 💾 Data Storage

Data is stored locally using AsyncStorage:
- Accounts list
- Cash balance
- All user data persists between app sessions

## 🔮 Future Enhancements

- [ ] Add transaction history
- [ ] Implement add/edit account functionality
- [ ] Add expense tracking
- [ ] Income management
- [ ] Category management
- [ ] Charts and analytics
- [ ] Export functionality
- [ ] Multi-currency support
- [ ] Cloud sync

## 📄 License

MIT License

## 🙏 Acknowledgments

- React Native team
- React Navigation
- Material Community Icons
- Sinhala language support

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ මොබයිල් යෙදුම - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*
