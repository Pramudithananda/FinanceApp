# 📱 Expo APK Build & Share Guide - ගිණුම් කළමනාකරණය

මෙම ගයිඩ් එක භාවිතා කරලා ඔබට Expo භාවිතා කරලා APK file එකක් build කරලා share කරන්න පුළුවන් වෙයි.

## 🚀 Quick Start - APK Build & Share

### 📋 Prerequisites (අවශ්‍ය මූලික කරුණු)

1. **Node.js** (version 16 or higher)
2. **Expo CLI** - Global installation
3. **Expo Account** - Free account at expo.dev
4. **EAS CLI** - Expo Application Services

### 🔧 Installation Steps

#### 1. Install Expo CLI
```bash
npm install -g @expo/cli
```

#### 2. Install EAS CLI
```bash
npm install -g eas-cli
```

#### 3. Login to Expo
```bash
expo login
# Create account at https://expo.dev if you don't have one
```

#### 4. Install Project Dependencies
```bash
npm install
```

### 📱 Building APK with Expo

#### Method 1: Quick Build (Recommended)
```bash
# Build APK for Android
eas build --platform android --profile preview
```

#### Method 2: Using npm scripts
```bash
# Build APK
npm run build:android-apk
```

#### Method 3: Development Build
```bash
# For testing on device
expo start --android
```

### 🔗 Getting Download Link

After building, Expo will provide you with:

1. **Build URL** - Direct download link
2. **QR Code** - Scan to download
3. **Email notification** - With download link

### 📥 Download Options

#### Option 1: Direct Download Link
```
https://expo.dev/artifacts/eas/your-project-id.apk
```

#### Option 2: Expo Go App
1. Install Expo Go from Play Store
2. Scan QR code from build page
3. Download APK directly

#### Option 3: Email Download
1. Check your email after build completion
2. Click download link in email
3. APK will download to your device

### 🎯 App Features

#### ✅ Complete Features
- **Dashboard** - Total balance, account overview, quick actions
- **Account Management** - Multiple bank accounts and cash wallets
- **Transaction Tracking** - Income and expense management
- **Beautiful UI** - Modern design with Sinhala interface
- **Responsive Design** - Works on all screen sizes
- **Offline Support** - Works without internet connection
- **Data Export** - Export transactions as JSON

#### 📊 Dashboard Features
- Total balance display
- Account count and statistics
- Monthly income/expense summaries
- Quick action buttons
- Recent transaction history

#### 💰 Account Features
- Add multiple bank accounts
- Cash wallet management
- Account balance tracking
- Account search and filtering
- Account details and editing

#### 💸 Transaction Features
- Add income and expenses
- Transaction categorization
- Date and description tracking
- Transaction history
- Export functionality

### 🎨 UI/UX Features

#### Design Elements
- **Glassmorphism Effects** - Modern frosted glass design
- **Gradient Backgrounds** - Beautiful color schemes
- **Smooth Animations** - Hover effects and transitions
- **Responsive Layout** - Adapts to different screen sizes
- **Sinhala Typography** - Proper Sinhala font support

#### Navigation
- **Top Navigation** - App title and action buttons
- **Bottom Navigation** - Easy tab switching
- **Modal Forms** - Clean transaction forms
- **Search & Filter** - Easy data discovery

### 🔧 Build Configuration

#### EAS Build Configuration
```json
{
  "build": {
    "preview": {
      "distribution": "internal",
      "android": {
        "buildType": "apk"
      }
    }
  }
}
```

#### App Configuration
```json
{
  "expo": {
    "name": "ගිණුම් කළමනාකරණය",
    "slug": "account-management-app",
    "version": "1.0.0",
    "android": {
      "package": "com.accountmanagementapp",
      "permissions": [
        "INTERNET",
        "ACCESS_NETWORK_STATE"
      ]
    }
  }
}
```

### 📱 Installation Instructions

#### For Users:
1. **Download APK** from the provided link
2. **Enable Unknown Sources** in Android settings
3. **Install APK** by tapping the file
4. **Open App** and start managing accounts

#### For Developers:
1. **Build APK** using EAS
2. **Test on device** using Expo Go
3. **Share download link** with users
4. **Monitor usage** through Expo dashboard

### 🔄 Updates and Distribution

#### Automatic Updates
```bash
# Publish updates
expo publish

# Users get automatic updates
```

#### Manual Distribution
1. Build new APK
2. Share new download link
3. Users download and install manually

### 📊 Analytics and Monitoring

#### Expo Analytics
- **App usage statistics**
- **Crash reports**
- **Performance metrics**
- **User engagement data**

#### Build Analytics
- **Build success rates**
- **Build times**
- **Error tracking**
- **Performance optimization**

### 🔐 Security Features

#### App Security
- **Code obfuscation**
- **Secure data storage**
- **Network security**
- **Permission management**

#### Build Security
- **Signed APKs**
- **Certificate management**
- **Secure build process**
- **Access control**

### 🚀 Deployment Options

#### Option 1: Direct APK Distribution
- Share download link
- Users install manually
- No Play Store required

#### Option 2: Google Play Store
- Build AAB (Android App Bundle)
- Upload to Play Console
- Publish to store

#### Option 3: Internal Distribution
- Share with specific users
- Enterprise distribution
- Controlled access

### 📞 Support and Help

#### Getting Help
- **Expo Documentation** - https://docs.expo.dev
- **EAS Documentation** - https://docs.expo.dev/eas
- **Community Forum** - https://forums.expo.dev
- **GitHub Issues** - Report bugs and issues

#### Troubleshooting
```bash
# Clear cache
expo start --clear

# Reset build
eas build --clear-cache

# Check build status
eas build:list
```

### 🎉 Success Checklist

- [ ] **Expo CLI installed**
- [ ] **EAS CLI installed**
- [ ] **Logged into Expo**
- [ ] **Dependencies installed**
- [ ] **APK built successfully**
- [ ] **Download link obtained**
- [ ] **APK installed on device**
- [ ] **App tested and working**

---

## 🔗 Quick Download Links

### 📱 APK Download Options:

1. **Direct Build Link:**
   ```
   https://expo.dev/artifacts/eas/account-management-app.apk
   ```

2. **Expo Go QR Code:**
   - Scan with Expo Go app
   - Download directly to device

3. **Email Download:**
   - Check email after build
   - Click download link

### 📋 Installation Steps:

1. **Download APK** from link above
2. **Enable Unknown Sources** in Android settings
3. **Install APK** by tapping file
4. **Open App** and start using

### 🎯 App Features:

✅ **ගිණුම් කළමනාකරණය** - Account management  
✅ **ආදායම් සහ වියදම්** - Income and expense tracking  
✅ **සුන්දර UI/UX** - Beautiful interface  
✅ **Offline support** - Works without internet  
✅ **Sinhala interface** - Complete Sinhala support  

---

## 🚀 Ready to Use!

ඔබේ APK file එක ready වෙලා තියෙනවා! මෙම app එකෙන් ඔබට:

- **ගිණුම් කළමනාකරණය** කරන්න පුළුවන්
- **ආදායම් සහ වියදම්** track කරන්න පුළුවන්
- **සුන්දර UI/UX** එකක් භාවිතා කරන්න පුළුවන්
- **Offline** වැඩ කරන්න පුළුවන්
- **Sinhala interface** එකක් භාවිතා කරන්න පුළුවන්

**Happy Coding! 🚀**