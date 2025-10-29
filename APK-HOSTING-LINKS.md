# 📤 APK Download Links - ලින්ක් හදන විදිහ

## 🌟 ඉක්මන් සහ නිදහස් APK Hosting Sites

### 1. 🟢 GitHub Releases (Best Option - නිදහස් සහ Permanent)

**විශේෂාංග:**
- ✅ නිදහස්
- ✅ Permanent links
- ✅ 100MB දක්වා files
- ✅ Unlimited downloads
- ✅ Version management

**ක්‍රමය:**

```bash
# Option A: Web Interface
# 1. GitHub repository එකට යන්න
# 2. "Releases" → "Create a new release"
# 3. Tag: v1.0.0
# 4. Title: "Budget Tracker v1.0.0"
# 5. APK file drag & drop කරන්න
# 6. "Publish release"

# Option B: Command Line (gh CLI)
gh release create v1.0.0 \
  android/app/build/outputs/apk/release/app-release.apk \
  --title "Budget Tracker v1.0.0" \
  --notes "පළමු release - Personal Finance Management App"
```

**Download Link Format:**
```
https://github.com/USERNAME/REPO_NAME/releases/download/v1.0.0/app-release.apk
```

**Example:**
```
https://github.com/johndoe/finance-app/releases/download/v1.0.0/app-release.apk
```

---

### 2. 🔵 Google Drive (ලේසි සහ ජනප්‍රිය)

**විශේෂාංග:**
- ✅ නිදහස් (15GB)
- ✅ මහා ලේසි
- ✅ කාටත් හරි
- ⚠️ Download quota limits

**ක්‍රමය:**

1. [drive.google.com](https://drive.google.com) යන්න
2. "New" → "File upload"
3. APK file select කරන්න
4. Upload වෙද්දී wait කරන්න
5. File එකට right-click → "Share"
6. "General access" → "Anyone with the link"
7. "Viewer" permissions තබන්න
8. "Copy link" click කරන්න

**Normal Link:**
```
https://drive.google.com/file/d/1A2B3C4D5E6F/view?usp=sharing
```

**Direct Download Link:**
```
https://drive.google.com/uc?export=download&id=1A2B3C4D5E6F
```

**Link Convert කරන්නේ කොහොමද:**
- File ID එක (slashes දෙක අතරේ තියෙන්නේ) copy කරන්න
- මේ format එකට දාන්න: `https://drive.google.com/uc?export=download&id=FILE_ID`

---

### 3. 🟠 Dropbox

**විශේෂාංග:**
- ✅ නිදහස් (2GB)
- ✅ ස්ථාවර links
- ✅ ලේසි share කරන්න

**ක්‍රමය:**

1. [dropbox.com](https://dropbox.com) යන්න
2. APK file upload කරන්න
3. Upload වෙලා ඉවර වෙද්දී file එකට hover කරන්න
4. "Share" button click කරන්න
5. "Create link" click කරන්න
6. Link copy කරන්න

**Normal Link:**
```
https://www.dropbox.com/s/abc123xyz/app-release.apk?dl=0
```

**Direct Download Link:**
අන්තිමේ `dl=0` එක `dl=1` කරන්න:
```
https://www.dropbox.com/s/abc123xyz/app-release.apk?dl=1
```

---

### 4. 🟣 Firebase App Distribution (Professional)

**විශේෂාංග:**
- ✅ නිදහස්
- ✅ Analytics included
- ✅ Version tracking
- ✅ Tester management
- ⚠️ Firebase account එකක් ඕනේ

**Setup:**

```bash
# 1. Firebase CLI install කරන්න
npm install -g firebase-tools

# 2. Login වෙන්න
firebase login

# 3. Firebase project එකක් create කරන්න
firebase init

# 4. App Distribution setup කරන්න
# Firebase Console → App Distribution → Get Started
# Android app එකක් register කරන්න

# 5. APK upload කරන්න
firebase appdistribution:distribute \
  android/app/build/outputs/apk/release/app-release.apk \
  --app 1:123456789:android:abc123 \
  --release-notes "පළමු version - Budget Tracker" \
  --groups "testers"
```

**Download Link:**
Firebase console එකෙන් link එක copy කරන්න:
```
https://appdistribution.firebase.dev/i/abc123xyz
```

---

### 5. 🟡 Transfer.sh (ඉක්මන් Temporary Sharing - 14 days)

**විශේෂාංග:**
- ✅ Account එකක් නැතිව use කරන්න පුළුවන්
- ✅ ඉක්මනින්ම upload වෙනවා
- ⚠️ 14 දිනකින් delete වෙනවා
- ⚠️ Max 10GB

**ක්‍රමය:**

```bash
# Terminal එකෙන් APK folder එකට යන්න
cd android/app/build/outputs/apk/release

# Upload කරන්න
curl --upload-file app-release.apk https://transfer.sh/BudgetTracker.apk

# Download link instant එනවා:
# https://transfer.sh/xxxxx/BudgetTracker.apk
```

**Browser එකෙන්:**
1. [transfer.sh](https://transfer.sh) යන්න
2. APK file drag & drop කරන්න
3. Upload වෙනවා සහ link එනවා
4. Link copy කරලා share කරන්න

---

### 6. 🔴 MediaFire (Large Files සඳහා)

**විශේෂාංග:**
- ✅ නිදහස් (10GB + 50GB with registration)
- ✅ විශාල files
- ✅ No download limits
- ⚠️ Ads තියෙනවා

**ක්‍රමය:**

1. [mediafire.com](https://www.mediafire.com) යන්න
2. Account එකක් හදාගන්න (optional)
3. "Upload Files" click කරන්න
4. APK select කරන්න
5. Upload වෙද්දී wait කරන්න
6. "Get links" click කරන්න
7. Direct download link copy කරන්න

**Link Format:**
```
https://www.mediafire.com/file/abc123xyz/app-release.apk/file
```

---

### 7. 🟢 WeTransfer (Up to 2GB Free)

**විශේෂාංග:**
- ✅ Account නැතිව use කරන්න පුළුවන්
- ✅ 2GB දක්වා නිදහස්
- ⚠️ 7 දිනකින් expire වෙනවා
- ✅ Email notifications

**ක්‍රමය:**

1. [wetransfer.com](https://wetransfer.com) යන්න
2. APK file drag & drop කරන්න
3. Email එකක් add කරන්න (optional)
4. "Transfer" click කරන්න
5. Link copy කරන්න

---

### 8. 🟣 Expo.dev (EAS Build භාවිතා කරන්නේ නම්)

**විශේෂාංග:**
- ✅ නිදහස්
- ✅ Automatic builds
- ✅ Version management
- ✅ Cloud building (Android Studio එකක් නැතිව)

**ක්‍රමය:**

```bash
# EAS Build කරන්න
npm install -g eas-cli
eas login
eas build --platform android

# Build එක complete වෙද්දී link එනවා:
# https://expo.dev/artifacts/eas/abc123.apk
```

---

## 📊 Comparison - හොඳම Option කුමක්ද?

| Service | Free Size | Permanent | Speed | Best For |
|---------|-----------|-----------|-------|----------|
| **GitHub Releases** | 100MB | ✅ Yes | ⭐⭐⭐⭐⭐ | Production apps |
| **Google Drive** | 15GB | ✅ Yes | ⭐⭐⭐⭐ | Personal sharing |
| **Dropbox** | 2GB | ✅ Yes | ⭐⭐⭐⭐ | Quick sharing |
| **Firebase** | Unlimited | ✅ Yes | ⭐⭐⭐⭐⭐ | Professional teams |
| **Transfer.sh** | 10GB | ❌ 14 days | ⭐⭐⭐⭐⭐ | Quick tests |
| **MediaFire** | 10GB | ✅ Yes | ⭐⭐⭐ | Large files |
| **WeTransfer** | 2GB | ❌ 7 days | ⭐⭐⭐⭐ | One-time sharing |
| **Expo.dev** | Unlimited | ✅ Yes | ⭐⭐⭐⭐⭐ | RN developers |

---

## 🎯 Recommendations

### For Production Release:
```
1. GitHub Releases (Main)
2. Firebase App Distribution (Backup)
3. Google Play Store (Official)
```

### For Testing:
```
1. Transfer.sh (Quick tests)
2. Firebase App Distribution (Team testing)
3. Expo.dev (React Native)
```

### For Sharing with Friends:
```
1. Google Drive (Everyone has Gmail)
2. Dropbox (Simple)
3. WhatsApp/Telegram (Direct send)
```

---

## 🔗 Link Shorteners (Links කෙටි කරන්න)

Long links කෙටි කරන්න:

### Bitly
```
1. https://bitly.com යන්න
2. Long link paste කරන්න
3. Short link එක copy කරන්න

Example:
https://bit.ly/budget-tracker-app
```

### TinyURL
```
1. https://tinyurl.com යන්න
2. Long URL paste කරන්න
3. Custom alias එකක් දාන්න (optional)

Example:
https://tinyurl.com/budget-app
```

### Rebrandly (Custom Domain)
```
Custom domain එකක් use කරන්න:
https://download.yourdomain.com/budget-tracker
```

---

## 📱 QR Code Generate කරන්න

ඔබේ download link එක QR code එකක් කරන්න:

### Online:
```
1. https://www.qr-code-generator.com යන්න
2. APK download link paste කරන්න
3. "Create QR Code" click කරන්න
4. Download කරන්න

Users phone එකෙන් scan කරලා directly download කරගන්න පුළුවන්!
```

### Command Line:
```bash
# qrencode install කරන්න
sudo apt install qrencode

# QR code generate කරන්න
qrencode -o apk-download-qr.png "https://your-download-link.com/app.apk"
```

---

## ✅ Best Practice

### 1. Multiple Hosting හදන්න
```
Primary: GitHub Releases
Backup: Google Drive
Mirror: Firebase
```

### 2. Version Management
```
v1.0.0 - Initial release
v1.1.0 - Bug fixes
v2.0.0 - New features

Each version එකට වෙනම release එකක්!
```

### 3. Clear Instructions දෙන්න
```markdown
📱 Budget Tracker App Download

🔗 Download Link: https://github.com/user/repo/releases/download/v1.0.0/app.apk

📋 Installation:
1. Download APK
2. Enable "Unknown sources"
3. Install
4. Open app

⚠️ Minimum: Android 5.0+
📦 Size: 25MB
🔄 Version: 1.0.0
```

### 4. Update Messages
```
🆕 New Update Available!

Version 1.1.0
- Fixed crash on startup
- Added dark mode
- Performance improvements

📥 Download: [link]
```

---

## 🎉 Summary

**ඉක්මනින්ම (Testing):**
```bash
curl --upload-file app-release.apk https://transfer.sh/
```

**Production Release:**
```bash
gh release create v1.0.0 app-release.apk
```

**Professional:**
```bash
eas build --platform android
```

**Link Share කරන්න** WhatsApp, Telegram, Facebook, Twitter - කාටත්! 🚀

---

**සතුටින් share කරන්න! 📱✨**
