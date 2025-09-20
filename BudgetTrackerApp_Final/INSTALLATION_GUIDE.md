# 📱 Budget Tracker App - Installation Guide

## 🎯 Quick Start

### 1. Extract the ZIP file
```bash
unzip BudgetTrackerApp_Complete.zip
cd BudgetTrackerApp_Final
```

### 2. Install Dependencies
```bash
npm install
```

### 3. Install React Native CLI (if not installed)
```bash
npm install -g @react-native-community/cli
```

### 4. Install AsyncStorage
```bash
npm install @react-native-async-storage/async-storage
```

### 5. For Android Development
```bash
# Install Android Studio
# Set up Android SDK
# Create AVD (Android Virtual Device)

# Run on Android
npm run android
```

### 6. For iOS Development (Mac only)
```bash
# Install Xcode
# Install iOS Simulator

# Run on iOS
npm run ios
```

## 🔧 Development Setup

### Prerequisites
- Node.js (v14 or higher)
- npm or yarn
- React Native CLI
- Android Studio (for Android)
- Xcode (for iOS - Mac only)

### Environment Setup
1. **Android Studio Setup**
   - Download and install Android Studio
   - Install Android SDK (API level 21+)
   - Create an Android Virtual Device (AVD)

2. **React Native CLI Setup**
   ```bash
   npm install -g @react-native-community/cli
   ```

3. **Project Dependencies**
   ```bash
   npm install
   npm install @react-native-async-storage/async-storage
   ```

## 🚀 Running the App

### Development Mode
```bash
# Start Metro bundler
npm start

# Run on Android (in another terminal)
npm run android

# Run on iOS (in another terminal)
npm run ios
```

### Building APK
```bash
# For debug APK
cd android
./gradlew assembleDebug

# For release APK
cd android
./gradlew assembleRelease
```

## 📁 Project Structure

```
BudgetTrackerApp_Final/
├── src/
│   ├── components/          # React components
│   │   ├── Modals/         # Modal components
│   │   ├── Header.js       # App header
│   │   ├── BalanceCard.js  # Balance display
│   │   ├── ActionButton.js # Action buttons
│   │   ├── CategoryCard.js # Category display
│   │   └── TransactionItem.js # Transaction display
│   ├── utils/              # Utility functions
│   │   ├── storage.js      # Data storage
│   │   └── formatters.js   # Currency formatting
│   ├── App.js              # Main app component
│   └── styles.js           # App styles
├── android/                # Android configuration
├── ios/                    # iOS configuration
├── package.json            # Dependencies
├── app.json               # App configuration
└── README.md              # Documentation
```

## 🎨 Features

- ✅ **Bank & Cash Balance Tracking**
- ✅ **Transaction Management**
- ✅ **Category-based Expense Tracking**
- ✅ **Progress Bars for Categories**
- ✅ **Transaction History**
- ✅ **Sinhala Language Support**
- ✅ **Modern UI Design**
- ✅ **Data Persistence**

## 🐛 Troubleshooting

### Common Issues

1. **Metro bundler issues**
   ```bash
   npx react-native start --reset-cache
   ```

2. **Android build issues**
   ```bash
   cd android
   ./gradlew clean
   cd ..
   npm run android
   ```

3. **iOS build issues**
   ```bash
   cd ios
   pod install
   cd ..
   npm run ios
   ```

4. **Dependencies issues**
   ```bash
   rm -rf node_modules
   npm install
   ```

## 📱 App Features

### Main Features
- **Balance Management**: Track bank and cash balances
- **Transaction Recording**: Add deposits, income, and expenses
- **Category Management**: Create and manage expense categories
- **Progress Tracking**: Visual progress bars for category spending
- **Transaction History**: View all past transactions
- **Sinhala Interface**: Complete Sinhala language support

### UI Components
- **Header**: App title and version
- **Balance Cards**: Bank and cash balance display
- **Action Buttons**: Quick access to main functions
- **Category Cards**: Expense category management
- **Transaction List**: Recent transaction history
- **Modals**: Transaction and category input forms

## 🔄 Data Flow

1. **User Input** → Transaction/Category forms
2. **Data Processing** → Balance calculations
3. **State Update** → React state management
4. **Storage** → AsyncStorage persistence
5. **UI Update** → Component re-rendering

## 📊 Data Structure

### Transaction Object
```javascript
{
  id: timestamp,
  type: 'bank-deposit' | 'income' | 'expense',
  amount: number,
  description: string,
  category: categoryObject | null,
  date: string,
  timestamp: number
}
```

### Category Object
```javascript
{
  id: number,
  name: string,
  balance: number,
  target: number,
  spent: number,
  unitPrice: number
}
```

## 🎯 Next Steps

1. **Test the app** on both Android and iOS
2. **Customize the UI** according to your preferences
3. **Add new features** as needed
4. **Deploy to app stores** when ready

## 📞 Support

If you encounter any issues:
1. Check the troubleshooting section
2. Review the React Native documentation
3. Check the project's README.md file
4. Create an issue in the project repository

---

**Happy coding! 🚀**