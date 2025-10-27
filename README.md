# 📱 Account Manager App - සිංහල මුදල් කළමනාකරණ ඇප් එක

## 🎯 Overview

A modern, responsive account management application built with React Native, featuring a beautiful Sinhala interface for managing bank accounts, cash flow, income, and expenses.

## ✨ Features

- **🏦 Multi-Account Management** - Bank, Cash, and Savings accounts
- **💰 Income & Expense Tracking** - Categorized transactions
- **📊 Real-time Analytics** - Monthly statistics and trends
- **🔍 Search Functionality** - Find transactions quickly
- **💾 Local Storage** - Data persists on device
- **🎨 Beautiful UI/UX** - Modern design with Sinhala interface
- **📱 Responsive Design** - Works on all Android devices

## 🚀 Quick Download

### 📱 APK Download Links

**Direct Download:**
- [AccountManager.apk](https://github.com/yourusername/account-manager-app/releases/latest/download/AccountManager.apk)

**Alternative Hosting:**
- [Google Drive](https://drive.google.com/uc?export=download&id=YOUR_GOOGLE_DRIVE_ID)
- [Dropbox](https://www.dropbox.com/s/YOUR_DROPBOX_ID/AccountManager.apk?dl=1)
- [GitHub Releases](https://github.com/yourusername/account-manager-app/releases)

### 📋 Installation Instructions

1. **Download APK** - Use any of the links above
2. **Enable Unknown Sources** - Go to Settings > Security > Install from Unknown Sources
3. **Install APK** - Open the downloaded file and follow prompts
4. **Enjoy!** - Start managing your accounts 🎉

## 🏗️ Build Your Own APK

### Prerequisites
- Node.js (v16+)
- Android Studio with SDK
- Java JDK 11+

### Quick Build
```bash
# Clone repository
git clone https://github.com/yourusername/account-manager-app.git
cd account-manager-app

# Install dependencies
npm install

# Build APK
./build-apk.sh

# APK will be created as: AccountManager.apk
```

### Manual Build
```bash
npm install
cd android
./gradlew assembleRelease
cd ..
# APK location: android/app/build/outputs/apk/release/app-release.apk
```

## 📱 App Screenshots

### Dashboard
- Total balance overview
- Account cards (Bank, Cash, Savings)
- Monthly statistics
- Quick action buttons

### Transactions
- Searchable transaction history
- Categorized view
- Date and amount details

### Analytics
- Visual charts
- Income vs expenses
- Category breakdown

## 🎨 UI/UX Highlights

- **Modern Design** - Glassmorphism effects and gradients
- **Sinhala Interface** - Complete local language support
- **Responsive Layout** - Adapts to different screen sizes
- **Smooth Animations** - Professional user experience
- **Intuitive Navigation** - Easy-to-use bottom navigation

## 🔒 Security Features

- **Local Storage** - Data stays on your device
- **No Internet Required** - Works offline
- **Privacy Focused** - No data collection

## 📊 Data Management

### Account Types
- **Bank Account** - Traditional banking
- **Cash** - Physical money management
- **Savings** - Long-term savings tracking

### Transaction Categories
**Income:**
- වැටුප (Salary)
- ව්‍යාපාරික ආදායම (Business Income)
- ආයෝජන (Investment)
- වෙනත් (Other)

**Expenses:**
- ආහාර (Food)
- ප්‍රවාහන (Transport)
- බලශක්ති (Energy)
- සන්නිවේදන (Communication)
- සෞඛ්‍ය (Health)
- අධ්‍යාපන (Education)
- විනෝදාස්වාද (Entertainment)
- වෙනත් (Other)

## 🛠️ Development

### Project Structure
```
account-manager-app/
├── src/
│   └── AccountManagerApp.js    # Main app component
├── android/                    # Android-specific files
├── public/                     # Web hosting files
│   ├── index.html             # Download page
│   └── AccountManager.apk     # APK file
├── App.js                      # App entry point
├── package.json               # Dependencies
├── build-apk.sh              # Build script
└── README.md                 # This file
```

### Key Technologies
- **React Native** - Cross-platform mobile development
- **React Native Vector Icons** - Beautiful icons
- **React Native Linear Gradient** - Gradient effects
- **AsyncStorage** - Local data persistence

## 🔧 Troubleshooting

### Common Issues

1. **Build Fails**
   ```bash
   cd android
   ./gradlew clean
   ./gradlew assembleRelease
   ```

2. **Dependencies Issues**
   ```bash
   npm cache clean --force
   rm -rf node_modules
   npm install
   ```

3. **Android SDK Issues**
   - Set ANDROID_HOME environment variable
   - Install required SDK platforms (API 21+)
   - Install build tools (version 33.0.0)

## 📞 Support

If you encounter any issues:

1. Check the troubleshooting section above
2. Ensure all prerequisites are installed
3. Verify environment variables are set correctly
4. Try cleaning and rebuilding the project

## 🎉 Success!

Once the APK is built successfully, you'll see:
```
✅ APK build successful!
📱 APK file created: AccountManager.apk
📁 Location: /path/to/project/AccountManager.apk
```

## 📱 Installation on Device

1. **Enable Unknown Sources**:
   - Go to Settings > Security
   - Enable "Install from Unknown Sources"

2. **Transfer APK**:
   - Copy `AccountManager.apk` to your device
   - Use USB, email, or cloud storage

3. **Install**:
   - Open the APK file on your device
   - Follow the installation prompts

## 🔄 Updates

To update the app:
1. Pull the latest code
2. Run `./build-apk.sh` again
3. Install the new APK (it will replace the old version)

## 🌐 Online Demo

Visit our web demo: [Account Manager App Demo](https://yourusername.github.io/account-manager-app/)

## 📱 QR Code Download

Scan this QR code to download the APK on your mobile device:

```
[QR Code will be generated automatically on the web page]
```

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Contact

Your Name - [@yourusername](https://twitter.com/yourusername) - email@example.com

Project Link: [https://github.com/yourusername/account-manager-app](https://github.com/yourusername/account-manager-app)

---

**Download Links Summary:**
- 🔗 [Direct APK Download](AccountManager.apk)
- 🔗 [GitHub Releases](https://github.com/yourusername/account-manager-app/releases)
- 🔗 [Google Drive](https://drive.google.com/uc?export=download&id=YOUR_GOOGLE_DRIVE_ID)
- 🔗 [Dropbox](https://www.dropbox.com/s/YOUR_DROPBOX_ID/AccountManager.apk?dl=1)
