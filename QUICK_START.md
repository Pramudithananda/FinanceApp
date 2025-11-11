# 🚀 Quick Start Guide

## Installation Steps

### 1. Install Dependencies
```bash
npm install
```

### 2. For iOS (macOS only)
```bash
cd ios && pod install && cd ..
```

### 3. Run the App

**Android:**
```bash
npm run android
```

**iOS:**
```bash
npm run ios
```

## 📱 What's Included

### ✅ Completed Features
- Dashboard screen with account overview
- Bottom tab navigation (5 tabs)
- Account cards display
- Data persistence (AsyncStorage)
- Sinhala language support
- Modern UI design

### 🚧 Placeholder Screens
- Bank Screen
- Cash Screen  
- Categories Screen
- Settings Screen

## 🎯 Next Development Steps

1. **Implement Add Account**
   - Create modal/form component
   - Add validation
   - Update accounts state

2. **Build Bank Screen**
   - Full account management
   - Edit/Delete functionality

3. **Build Cash Screen**
   - Cash transactions
   - Balance management

4. **Build Categories Screen**
   - Category CRUD operations
   - Expense tracking

5. **Build Settings Screen**
   - App preferences
   - Data management

## 📝 Notes

- Data is stored locally using AsyncStorage
- All accounts persist between app sessions
- The app follows Material Design principles
- Icons use MaterialCommunityIcons

## 🐛 Troubleshooting

### Android Build Issues
- Ensure Android SDK is installed
- Check JAVA_HOME is set
- Clean build: `cd android && ./gradlew clean`

### iOS Build Issues
- Run `pod install` in ios folder
- Check Xcode version compatibility
- Clean build folder in Xcode

### Metro Bundler Issues
- Reset cache: `npm start -- --reset-cache`
- Clear watchman: `watchman watch-del-all`
