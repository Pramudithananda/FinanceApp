# 🚀 Quick Start Guide

## Installation & Run

```bash
# 1. Install dependencies
npm install

# 2. Start Expo development server
npm start
# or
expo start

# 3. Run on your device/emulator
# - Press 'a' for Android
# - Press 'i' for iOS
# - Press 'w' for Web
# - Scan QR code with Expo Go app on your phone
```

## 📱 What's Included

✅ **Dashboard View**
- Total balance display
- Income/Expense cards
- Bank account cards
- Cash account display

✅ **Navigation**
- 5-tab bottom navigation
- Dashboard, Bank, Cash, Categories, Settings

✅ **Features**
- Sinhala language interface
- Currency formatting (රු prefix)
- Modern mobile UI
- Responsive design

## 📂 Project Structure

```
.
├── App.js                 # Entry point
├── app.json              # Expo config
├── package.json          # Dependencies
├── src/
│   └── components/
│       └── FinanceApp.js # Main component
└── README_MOBILE.md      # Full documentation
```

## 🔧 Next Steps

1. **Add functionality:**
   - Implement add/edit/delete accounts
   - Add transaction history
   - Implement category management

2. **Data persistence:**
   - Install AsyncStorage (already in package.json)
   - Create storage utilities
   - Save/load data on app lifecycle

3. **Enhance UI:**
   - Add loading states
   - Add error handling
   - Add form modals

## 📖 Documentation

- **Full README:** See `README_MOBILE.md`
- **Code Analysis:** See `ANALYSIS.md`
- **Original Component:** Provided React component

## 🐛 Troubleshooting

**Metro bundler cache issues:**
```bash
npm start -- --reset-cache
```

**Dependencies issues:**
```bash
rm -rf node_modules
npm install
```

**Expo issues:**
```bash
expo install --fix
```

---

**Ready to build! 🎉**
