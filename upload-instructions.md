# 📤 APK Upload Instructions - සියල්ලම Upload කරන්න

## 🎯 Overview

මේ instructions ටිකෙන් ඔබට APK file එක upload කරලා public download links ටික create කරන්න පුළුවන් වෙයි.

## 📱 APK File Ready

✅ **APK File Location:** `public/AccountManager.apk`
✅ **File Size:** ~15MB
✅ **Version:** 1.0.0

## 🚀 Upload Options

### 1. 📁 Google Drive Upload

**Step-by-Step:**
1. **Go to Google Drive:** https://drive.google.com
2. **Upload File:** Drag & drop `public/AccountManager.apk`
3. **Share File:** Right-click > Share > Copy link
4. **Update HTML:** Replace `YOUR_GOOGLE_DRIVE_ID` in `public/index.html`

**Command:**
```bash
# Open Google Drive in browser
xdg-open https://drive.google.com
```

### 2. 📦 Dropbox Upload

**Step-by-Step:**
1. **Go to Dropbox:** https://www.dropbox.com
2. **Upload File:** Drag & drop `public/AccountManager.apk`
3. **Share File:** Right-click > Share > Copy link
4. **Update HTML:** Replace `YOUR_DROPBOX_ID` in `public/index.html`

**Command:**
```bash
# Open Dropbox in browser
xdg-open https://www.dropbox.com
```

### 3. 🐙 GitHub Releases

**Step-by-Step:**
1. **Create Repository:** https://github.com/new
2. **Push Code:** 
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/account-manager-app.git
   git push -u origin main
   ```
3. **Create Release:** Go to repository > Releases > Create new release
4. **Upload APK:** Drag & drop `public/AccountManager.apk`

### 4. 🌐 Netlify/Vercel

**Step-by-Step:**
1. **Go to Netlify:** https://netlify.com
2. **Deploy Site:** Drag & drop `public` folder
3. **Get URL:** Automatic public URL
4. **Share:** Direct download link

## 🔧 Quick Upload Scripts

### Google Drive Upload Script
```bash
#!/bin/bash
echo "📤 Uploading to Google Drive..."
echo "1. Open: https://drive.google.com"
echo "2. Upload: public/AccountManager.apk"
echo "3. Share and copy link"
echo "4. Update public/index.html"
```

### Dropbox Upload Script
```bash
#!/bin/bash
echo "📤 Uploading to Dropbox..."
echo "1. Open: https://www.dropbox.com"
echo "2. Upload: public/AccountManager.apk"
echo "3. Share and copy link"
echo "4. Update public/index.html"
```

## 📋 Update Download Links

After uploading, update `public/index.html`:

```html
<!-- Replace these placeholders with real links -->
<a href="https://drive.google.com/uc?export=download&id=YOUR_ACTUAL_DRIVE_ID" target="_blank">
    🔗 Google Drive Download
</a>

<a href="https://www.dropbox.com/s/YOUR_ACTUAL_DROPBOX_ID/AccountManager.apk?dl=1" target="_blank">
    🔗 Dropbox Download
</a>
```

## 🎯 Recommended Approach

### Option 1: Google Drive (Easiest)
1. Upload to Google Drive
2. Get shareable link
3. Update HTML file
4. Share download page

### Option 2: GitHub Releases (Professional)
1. Create GitHub repository
2. Push code
3. Create release with APK
4. Get direct download link

### Option 3: Netlify (Free Hosting)
1. Deploy to Netlify
2. Get public URL
3. Share download page

## 📱 Final Download Links

After uploading, you'll have:

- **🔗 Direct APK Download:** `https://your-hosting-service.com/AccountManager.apk`
- **🌐 Download Page:** `https://your-hosting-service.com`
- **📱 QR Code:** Auto-generated for mobile download

## 🚀 Quick Start Commands

```bash
# 1. Check APK file
ls -la public/AccountManager.apk

# 2. Open upload services
xdg-open https://drive.google.com
xdg-open https://www.dropbox.com
xdg-open https://github.com

# 3. Update links after upload
nano public/index.html
```

## ✅ Success Checklist

- [ ] APK file created (`public/AccountManager.apk`)
- [ ] Uploaded to hosting service
- [ ] Updated download links in HTML
- [ ] Tested download links
- [ ] Shared with users

## 🎉 Ready to Share!

Once uploaded, share these links:

- **📱 APK Download:** Your hosting service link
- **🌐 Download Page:** Your hosting service URL
- **📋 Instructions:** Installation guide included

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*