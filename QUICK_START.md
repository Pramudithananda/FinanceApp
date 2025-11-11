# ⚡ Quick Start Guide - මුදල් කළමනාකරණ App

Get your Finance Management mobile app running in minutes! 🚀

## 🎯 5-Minute Quick Start

### Prerequisites Check ✅

Before starting, make sure you have:
- [ ] Node.js installed (v16+)
- [ ] Android Studio installed (for Android)
- [ ] Java JDK 11 installed

**Don't have these?** → See [SETUP_GUIDE.md](./SETUP_GUIDE.md) for detailed installation.

---

## 🚀 Steps

### 1️⃣ Navigate to Project (5 seconds)

```bash
cd /workspace
```

### 2️⃣ Install Dependencies (2-3 minutes)

```bash
npm install
```

**What this does:**
- Installs React Native
- Installs all required packages
- Sets up node_modules folder

### 3️⃣ Start Metro Bundler (10 seconds)

**Open Terminal 1:**
```bash
npm start
```

**You should see:**
```
Welcome to Metro!
Fast - Scalable - Integrated

               ######                ######
             ###     ####        ####     ###
            ##          ###    ###          ##
            ##             ####             ##
...
```

**Keep this terminal running!** ⚠️

### 4️⃣ Run on Android (30 seconds)

**Open Terminal 2** (new terminal window):
```bash
npm run android
```

**What happens:**
1. Android emulator launches (if not already running)
2. App is built and installed
3. Metro bundler compiles JavaScript
4. App opens on emulator/device

**First time?** It may take 2-3 minutes. Be patient! ⏳

---

## ✅ Success!

You should now see:
- 🏠 Dashboard screen with purple header
- 💰 Balance cards (Total, Bank, Cash)
- 🏦 Bank account cards (People's Bank, Commercial Bank, පිබිදී)
- 📱 Bottom navigation bar
- 🇱🇰 Sinhala text throughout

**Congratulations! Your app is running!** 🎉

---

## 🎮 Try These Actions

1. **Tap Dashboard** 🏠
   - View your balances
   - See account cards

2. **Tap Bank** 🏦
   - Opens bank section (placeholder)

3. **Tap Cash** 💰
   - Opens cash section (placeholder)

4. **Tap Categories** 📁
   - Opens categories section (placeholder)

5. **Tap Settings** ⚙️
   - Opens settings section (placeholder)

---

## 🔧 Common Issues & Quick Fixes

### Issue: "Command not found: npm"
**Fix:** Node.js not installed
```bash
# Install Node.js from https://nodejs.org/
```

### Issue: "SDK location not found"
**Fix:** Create local.properties
```bash
echo "sdk.dir=/path/to/Android/Sdk" > android/local.properties
```

### Issue: Port 8081 already in use
**Fix:** Kill the process
```bash
# Mac/Linux
lsof -ti:8081 | xargs kill -9

# Windows
npx react-native start --port=8082
```

### Issue: Emulator won't start
**Fix:** Start manually
```bash
emulator -list-avds
emulator -avd <avd-name>
```

### Issue: Red error screen on app
**Fix:** Reload the app
- Press `R` twice quickly (RR) in Metro terminal
- Or shake device → "Reload"

---

## 📱 Using Physical Device

### Android Phone:

1. **Enable Developer Mode**
   - Settings → About Phone
   - Tap "Build Number" 7 times

2. **Enable USB Debugging**
   - Settings → Developer Options
   - Turn on "USB Debugging"

3. **Connect USB Cable**
   ```bash
   adb devices  # Verify device is connected
   ```

4. **Run App**
   ```bash
   npm run android
   ```

---

## 🏗️ Building APK

### Debug APK (For Testing)

```bash
cd android
./gradlew assembleDebug
cd ..
```

**APK Location:**
```
android/app/build/outputs/apk/debug/app-debug.apk
```

### Install APK

```bash
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

---

## 📚 Next Steps

Now that your app is running:

1. **Explore the Code**
   - Main file: `src/FinanceApp.jsx`
   - Modify styles, add features

2. **Read Documentation**
   - [MOBILE_APP_README.md](./MOBILE_APP_README.md) - Complete guide
   - [SETUP_GUIDE.md](./SETUP_GUIDE.md) - Detailed setup
   - [CODE_CONVERSION_GUIDE.md](./CODE_CONVERSION_GUIDE.md) - How it was built

3. **Customize**
   - Change colors
   - Add new accounts
   - Implement features

4. **Build & Deploy**
   - Create release APK
   - Publish to Play Store

---

## 🎯 Development Workflow

### Daily Development Cycle:

```bash
# Terminal 1 - Metro Bundler (keep running)
npm start

# Terminal 2 - Run app
npm run android

# When you make code changes:
# 1. Save file
# 2. Press 'R' twice in Metro terminal (RR)
# 3. Changes appear on device
```

### Fast Refresh ⚡
- Enabled by default
- Changes appear automatically
- No need to rebuild

---

## 🆘 Need More Help?

### For Setup Issues:
→ See [SETUP_GUIDE.md](./SETUP_GUIDE.md)

### For Code Understanding:
→ See [CODE_CONVERSION_GUIDE.md](./CODE_CONVERSION_GUIDE.md)

### For Features & Documentation:
→ See [MOBILE_APP_README.md](./MOBILE_APP_README.md)

### For Project Overview:
→ See [PROJECT_SUMMARY.md](./PROJECT_SUMMARY.md)

---

## 🎨 Quick Customization

### Change Primary Color

Open `src/FinanceApp.jsx`, find:
```javascript
backgroundColor: '#4F46E5'  // Purple
```

Change to:
```javascript
backgroundColor: '#10B981'  // Green
backgroundColor: '#F97316'  // Orange
backgroundColor: '#8B5CF6'  // Purple
backgroundColor: '#EF4444'  // Red
```

### Add New Account

In `src/FinanceApp.jsx`, find:
```javascript
const [accounts, setAccounts] = useState([...]);
```

Add:
```javascript
{ 
  id: 4, 
  name: "Your Bank Name", 
  number: '1111111111', 
  balance: 50000, 
  type: 'bank' 
}
```

---

## ⚡ Pro Tips

1. **Keep Metro Running**
   - Don't close Terminal 1
   - Speeds up reload times

2. **Use Fast Refresh**
   - Automatic on file save
   - For manual: Press R twice

3. **Check Logs**
   ```bash
   npx react-native log-android
   ```

4. **Clear Cache When Stuck**
   ```bash
   npm start -- --reset-cache
   ```

5. **Debug Menu on Device**
   - Shake device
   - Or: `adb shell input keyevent 82`

---

## 🎉 You're All Set!

Your Finance Management app is now running!

**Happy Coding!** 👨‍💻👩‍💻

**සුභ පැතුම්!** 🇱🇰

---

**Questions?** Check other documentation files or create an issue!

**Version**: 1.0.0  
**Last Updated**: 2025-11-11
