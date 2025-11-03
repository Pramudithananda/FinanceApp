# ?? ????? ???????? - Personal Finance Management App

A modern React Native application for managing personal finances with a beautiful Sinhala interface.

## ?? Features

### ?? Account Management
- **Bank Account Balance** - Track your bank deposits and withdrawals
- **Cash Balance** - Manage your on-hand cash
- **Real-time Balance Updates** - Instant balance calculations
- **Smart Money Flow** - Automatic transfers between bank and cash

### ?? Transaction Management
- **Bank Deposits** - Direct deposits or cash-to-bank transfers
- **Bank Withdrawals** - Withdraw money from bank to cash
- **Transaction History** - View all your recent transactions
- **Smart Logic** - Cash reduces when depositing to bank, bank reduces when withdrawing

### ?? Income & Expense Tracking
- **Income Management** - Add income to bank or cash accounts
- **Expense Tracking** - Record and track all your expenses with categories
- **Categorized View** - Separate tabs for income and expenses
- **Date & Description** - Detailed transaction information

### ?? Modern UI/UX
- **Beautiful Design** - Modern card-based interface
- **Smooth Animations** - Hover effects and transitions
- **Responsive Design** - Works perfectly on mobile
- **Sinhala Interface** - Complete Sinhala language support

## ?? Prerequisites

Before you begin, ensure you have met the following requirements:

- Node.js (v16 or higher)
- npm or yarn
- React Native CLI
- Android Studio (for Android development)
- Xcode (for iOS development, macOS only)

## ?? Getting Started

### Installation

1. **Navigate to the project directory**
   ```bash
   cd finance-app
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **For iOS (macOS only)**
   ```bash
   cd ios && pod install && cd ..
   ```

### Running the App

**Android:**
```bash
npm run android
# or
yarn android
```

**iOS:**
```bash
npm run ios
# or
yarn ios
```

**Start Metro Bundler:**
```bash
npm start
# or
yarn start
```

## ?? Project Structure

```
finance-app/
??? src/
?   ??? components/
?   ?   ??? Modals/
?   ?   ?   ??? CategoryDetailsModal.js
?   ?   ?   ??? CategoryModal.js
?   ?   ?   ??? TransactionModal.js
?   ?   ??? ActionButton.js
?   ?   ??? BalanceCard.js
?   ?   ??? CategoryCard.js
?   ?   ??? Header.js
?   ?   ??? TransactionItem.js
?   ??? utils/
?   ?   ??? formatters.js
?   ?   ??? storage.js
?   ??? App.js
?   ??? styles.js
??? android/
??? ios/
??? package.json
??? README.md
```

## ?? Building for Production

### Android APK

1. **Generate a signed APK:**
   ```bash
   cd android
   ./gradlew assembleRelease
   ```

2. **The APK will be located at:**
   ```
   android/app/build/outputs/apk/release/app-release.apk
   ```

### Android App Bundle (for Play Store)

```bash
cd android
./gradlew bundleRelease
```

## ?? Key Components

- **App.js** - Main application component
- **BalanceCard** - Displays bank and cash balances
- **TransactionModal** - Handles deposits, income, and expenses
- **CategoryModal** - Manages expense categories
- **CategoryCard** - Displays category details with progress
- **TransactionItem** - Shows individual transactions

## ?? Customization

You can easily customize:

- Colors and styles in `src/styles.js`
- Default categories in `src/App.js`
- Currency format in `src/utils/formatters.js`
- Storage key in `src/utils/storage.js`

## ?? Dependencies

- **react-native** - React Native framework
- **@react-native-async-storage/async-storage** - Local data storage

## ?? Troubleshooting

**Common Issues:**

1. **Metro bundler issues:**
   ```bash
   npm start -- --reset-cache
   ```

2. **Android build issues:**
   ```bash
   cd android
   ./gradlew clean
   ```

3. **iOS pod issues:**
   ```bash
   cd ios
   pod deintegrate
   pod install
   ```

## ?? License

This project is licensed under the MIT License.

## ?? Acknowledgments

- React Native Team
- AsyncStorage library
- Sinhala Typography

---

**Made with ?? for the Sri Lankan community**

*????? ????? ???????? ??????? - ????? ?????? ??????? ????*
