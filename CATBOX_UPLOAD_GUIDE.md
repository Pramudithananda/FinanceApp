# 📤 Catbox එකට Upload කරන්නේ කොහොමද?

## මුදල් කළමනාකරණ App - Catbox Upload Guide

---

## 🎯 Catbox කියන්නේ මොකද්ද?

Catbox.moe යනු **free file hosting service** එකක්:
- ✅ Files upload කරන්න පුළුවන් (200MB දක්වා)
- ✅ Direct download links ලැබේ
- ✅ Account එකක් ඕන නෑ
- ✅ Files permanent (නැති වෙන්නේ නෑ)
- ✅ Fast downloads

---

## 📦 Upload කරන්න Files

මම ඔබට project එක **2 formats** වල pack කරලා තියෙනවා:

### 1. MudalKalamanakarna-Complete-App.tar.gz
- Linux/Mac සඳහා best
- Compressed format
- Smaller size

### 2. MudalKalamanakarna-Complete-App.zip
- Windows සඳහා best
- Universal format
- Extract කරන්න පහසුයි

---

## 🚀 Catbox එකට Upload කරන විධිය

### Method 1: Web Interface (Easiest)

```
1. Browser එකෙන් යන්න: https://catbox.moe

2. "Choose File" button එක click කරන්න

3. File select කරන්න:
   - MudalKalamanakarna-Complete-App.zip (හෝ .tar.gz)

4. "Upload" button click කරන්න

5. Upload complete වුණහම link එකක් ලැබේ:
   https://files.catbox.moe/xxxxxx.zip

6. Link එක copy කරගන්න!
```

### Method 2: Command Line (Advanced)

#### Linux/Mac:

```bash
# ZIP file upload කරන්න
curl -F "reqtype=fileupload" \
     -F "fileToUpload=@/workspace/MudalKalamanakarna-Complete-App.zip" \
     https://catbox.moe/user/api.php

# TAR.GZ file upload කරන්න
curl -F "reqtype=fileupload" \
     -F "fileToUpload=@/workspace/MudalKalamanakarna-Complete-App.tar.gz" \
     https://catbox.moe/user/api.php
```

#### Windows (PowerShell):

```powershell
$file = "C:\path\to\MudalKalamanakarna-Complete-App.zip"
$upload = Invoke-RestMethod -Uri "https://catbox.moe/user/api.php" `
    -Method Post `
    -Form @{
        reqtype = "fileupload"
        fileToUpload = Get-Item $file
    }
Write-Host $upload
```

---

## 📋 File එකේ තියෙන දේවල්

Upload කරන file එකේ මේ සියල්ල තියෙනවා:

```
MudalKalamanakarna-Complete-App/
│
├── 📱 App Files
│   ├── App.js
│   ├── index.js
│   ├── app.json
│   └── package.json
│
├── ⚙️ Config Files
│   ├── babel.config.js
│   ├── metro.config.js
│   ├── .prettierrc.js
│   └── .gitignore
│
├── 📁 Source Code
│   └── src/
│       ├── context/
│       │   └── AppContext.js
│       ├── screens/
│       │   ├── DashboardScreen.js
│       │   ├── BankScreen.js
│       │   ├── CashScreen.js
│       │   ├── CategoriesScreen.js
│       │   └── SettingsScreen.js
│       └── utils/
│           └── formatters.js
│
├── 📚 Documentation (11 files)
│   ├── START_HERE.md
│   ├── QUICK_START_SINHALA.md
│   ├── APP_OVERVIEW_SINHALA.md
│   ├── INSTALL_GUIDE_SINHALA.md
│   ├── APK_QUICK_GUIDE.md
│   ├── EXPO_BUILD_GUIDE.md
│   ├── BUILD_APK_GUIDE_SINHALA.md
│   ├── FEATURES.md
│   ├── PROJECT_SUMMARY.md
│   ├── SETUP.md
│   ├── README.md
│   └── CATBOX_UPLOAD_GUIDE.md
│
└── 🤖 Scripts
    └── AUTOMATED_BUILD_SCRIPT.sh
```

**Total:** ~25 files, සම්පූර්ණ working app!

---

## 📥 Download කරගන්න හා Extract කරන්න

### After Upload (Link ලැබුණු පසු):

#### Windows:
```
1. Link click කරන්න
2. ZIP file download වේ
3. Right-click → "Extract All"
4. Folder open වේ!
```

#### Mac:
```
1. Link click කරන්න
2. File download වේ
3. Double-click ZIP file
4. Auto extract වේ!
```

#### Linux:
```bash
# ZIP extract කරන්න
unzip MudalKalamanakarna-Complete-App.zip
cd MudalKalamanakarna-Complete-App

# TAR.GZ extract කරන්න
tar -xzf MudalKalamanakarna-Complete-App.tar.gz
cd MudalKalamanakarna-Complete-App

# Dependencies install කරන්න
npm install

# Run කරන්න!
npm start
```

---

## 🔗 Share කරන Link Format

Upload කළ පසු ලැබෙන link එක මේ format එකේ වෙයි:

```
https://files.catbox.moe/abc123.zip
```

මේ link එක:
- ✅ Direct download link
- ✅ Permanent (නැති වෙන්නේ නෑ)
- ✅ Fast download
- ✅ No ads
- ✅ Share කරන්න පුළුවන් කැමති කෙනෙකුටම

---

## 📤 Alternative Upload Services

Catbox එක work නොවන්නේ නම්, මේ services use කරන්න පුළුවන්:

### 1. LitterBox (Temporary - Free)
```
URL: https://litterbox.catbox.moe
Features:
  - Temporary storage (1h to 3 days)
  - Free
  - No account needed
  - Same as Catbox but temporary
```

### 2. GoFile (Free)
```
URL: https://gofile.io
Features:
  - Unlimited storage
  - No account needed (optional)
  - Fast downloads
  - Files expire after inactivity
```

### 3. Anonfiles (Free)
```
URL: https://anonfiles.com
Features:
  - Anonymous uploads
  - No registration
  - Fast downloads
```

### 4. Google Drive
```
URL: https://drive.google.com
Features:
  - 15GB free storage
  - Google account needed
  - Reliable
  - Sharable links
```

### 5. Dropbox
```
URL: https://dropbox.com
Features:
  - 2GB free
  - Account needed
  - Good for sharing
  - Mobile apps
```

---

## 💡 Best Practices

### 1. Upload කරන්න පෙර:

```bash
# File size check කරන්න
ls -lh MudalKalamanakarna-Complete-App.zip

# ZIP working ද බලන්න
unzip -t MudalKalamanakarna-Complete-App.zip

# TAR.GZ working ද බලන්න
tar -tzf MudalKalamanakarna-Complete-App.tar.gz
```

### 2. Upload කරන විට:

- ✅ Stable internet connection use කරන්න
- ✅ File size check කරන්න (200MB limit)
- ✅ Upload complete වෙනකම් wait කරන්න

### 3. Upload කළ පසු:

- ✅ Link test කරන්න (download try කරන්න)
- ✅ Link save කරගන්න (notepad එකක)
- ✅ Link share කරන්න අවශ්‍ය අයට

---

## 🔐 Security Tips

1. **Public Links**
   - Catbox links public (කවුරුත් download කරන්න පුළුවන්)
   - Sensitive data include නොකරන්න

2. **Backup**
   - Original files තියාගන්න
   - Multiple copies save කරන්න
   - Cloud backup use කරන්න

3. **Testing**
   - Upload කරපු file download කර test කරන්න
   - Extract කර files check කරන්න
   - App run වේද බලන්න

---

## 🎯 Quick Reference

### Upload Command (Linux/Mac):
```bash
curl -F "reqtype=fileupload" \
     -F "fileToUpload=@/workspace/MudalKalamanakarna-Complete-App.zip" \
     https://catbox.moe/user/api.php
```

### Download & Extract:
```bash
# Download
wget https://files.catbox.moe/xxxxxx.zip

# Extract
unzip MudalKalamanakarna-Complete-App.zip

# Install & Run
cd MudalKalamanakarna-Complete-App
npm install
npm start
```

---

## 📊 File Sizes (Approximate)

```
Without node_modules:
  ZIP:     ~50-100 KB
  TAR.GZ:  ~40-80 KB

With node_modules (after npm install):
  ~200-300 MB
  
Note: Upload කරන files වල node_modules නෑ
      (Download කර npm install කරන්න ඕනෑ)
```

---

## ✅ Checklist

Upload කරන්න පෙර:

- [ ] File pack කරලා තියෙනවා
- [ ] File size check කරලා
- [ ] ZIP/TAR.GZ test කරලා
- [ ] Internet connection stable
- [ ] Catbox.moe site access කරන්න පුළුවන්

Upload කළ පසු:

- [ ] Link ලැබුණා
- [ ] Link test කරලා (download කරලා)
- [ ] Link save කරලා
- [ ] File extract වෙනවා
- [ ] Files complete
- [ ] Ready to share!

---

## 🎊 Ready to Upload!

Files pack කරලා ready! දැන්:

1. **Browser එකෙන්:** https://catbox.moe වෙත යන්න
2. **Upload කරන්න:** ZIP හෝ TAR.GZ file එක
3. **Link copy කරන්න:** Download link එක
4. **Share කරන්න:** කැමති කෙනෙකුටම!

---

## 📞 Need Help?

Problems නම්:
- Try alternative upload service
- Check internet connection
- Try smaller file
- Use different browser
- Clear browser cache

---

**Happy Sharing!** 📤✨

Made with ❤️ for Sri Lanka 🇱🇰
