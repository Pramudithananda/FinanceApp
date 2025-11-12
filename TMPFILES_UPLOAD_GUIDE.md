# 📤 tmpfiles.org වලට Upload කරන්න

## 🚀 Automated Script Use කරන්න (Easiest!)

### One Command:

```bash
chmod +x upload-to-tmpfiles.sh && ./upload-to-tmpfiles.sh
```

**මේක කරන දේවල්:**
1. ✅ APK file එක හොයනවා
2. ✅ tmpfiles.org වලට upload කරනවා
3. ✅ Download link එක generate කරනවා
4. ✅ Share message එකක් create කරනවා
5. ✅ QR code link එකක් generate කරනවා
6. ✅ Link එක save කරනවා (download-link.txt)

**කාලය:** 1-2 minutes

---

## 📋 Manual Upload (Alternative)

### Method 1: curl Command

```bash
# APK file එක upload කරන්න
curl -F "file=@මුදල්-කළමනාකරණ-v1.0.apk" https://tmpfiles.org/api/v1/upload

# හෝ old APK use කරන්න නම්
curl -F "file=@මුදල් කළමනාකරණ_1.0.apk" https://tmpfiles.org/api/v1/upload
```

**Output:**
```json
{
  "status": "success",
  "data": {
    "url": "https://tmpfiles.org/xxxxx",
    "direct_url": "https://tmpfiles.org/dl/xxxxx"
  }
}
```

**Direct Download Link:**
```
https://tmpfiles.org/dl/xxxxx
```

---

### Method 2: Browser Upload

1. **Website එකට යන්න:**
   ```
   https://tmpfiles.org/
   ```

2. **Upload:**
   - "Choose File" click කරන්න
   - APK file select කරන්න
   - "Upload" click කරන්න

3. **Get Link:**
   - Upload complete වුණාම link එක copy කරන්න
   - Direct download link use කරන්න (tmpfiles.org/dl/xxxxx)

---

## 🎯 tmpfiles.org Features

### ✅ Advantages:
- **Free:** No account needed
- **Permanent:** Files don't expire
- **Fast:** Quick uploads & downloads
- **No Ads:** Clean interface
- **Anonymous:** No tracking
- **API:** Command-line friendly
- **100MB Limit:** Enough for APK

### ⚠️ Limitations:
- 100MB max file size
- Can't delete after upload
- Public access (anyone with link)

---

## 📱 After Upload - Share කරන්න

### WhatsApp Message Template:

```
🎉 මුදල් කළමනාකරණ යෙදුම - Download කරගන්න!

💰 සම්පූර්ණයෙන්ම සිංහල interface එකක් සහිත!

Features:
✅ බැංකු ගිණුම් tracking
✅ මුදල් ශේෂය කළමනාකරණය  
✅ Dashboard with balance display
✅ Color-coded account cards
✅ Free & Open Source

📥 Download කරන්න:
https://tmpfiles.org/dl/xxxxx

📦 Version: 1.0.0
📏 Size: ~20MB
📱 Android 6.0+

⚠️ Install කරන්න කලින්:
Settings → Security → Install Unknown Apps (Enable)

🇱🇰 Made for Sri Lanka!
```

---

## 🔧 Troubleshooting

### "curl: command not found"

**Install curl:**

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install curl
```

**Mac:**
```bash
brew install curl
```

**Windows:**
- Download from: https://curl.se/windows/

### "Upload failed"

**Check:**
1. Internet connection working ද?
2. File size < 100MB ද?
3. tmpfiles.org site එක down ද?
4. APK file එක corrupt වෙලා නැද්ද?

**Retry:**
```bash
./upload-to-tmpfiles.sh
```

### "File not found"

**Build APK first:**
```bash
chmod +x COMPLETE_SETUP.sh
./COMPLETE_SETUP.sh
```

හෝ APK file එක current folder එකට copy කරන්න.

---

## 🎯 Quick Commands

### Upload:
```bash
./upload-to-tmpfiles.sh
```

### Build & Upload:
```bash
./COMPLETE_SETUP.sh && ./upload-to-tmpfiles.sh
```

### Test Download:
```bash
# Upload කළාට පස්සේ link එක test කරන්න
curl -I https://tmpfiles.org/dl/xxxxx
```

---

## 📊 Comparison: tmpfiles vs Others

| Service | Max Size | Duration | Speed | Account | API |
|---------|----------|----------|-------|---------|-----|
| **tmpfiles** | 100MB | Permanent | ⚡⚡⚡ | No | Yes ✅ |
| Catbox | 200MB | Permanent | ⚡⚡⚡ | No | No |
| Transfer.sh | 2GB | 14 days | ⚡⚡⚡ | No | Yes ✅ |
| Google Drive | 15GB | Permanent | ⚡⚡ | Yes | Yes ✅ |

**tmpfiles.org advantages:**
- ✅ Command-line friendly (curl)
- ✅ JSON API response
- ✅ Direct download links
- ✅ No expiration
- ✅ Fast & reliable

---

## 📝 Complete Workflow

### 1. Build APK:
```bash
chmod +x COMPLETE_SETUP.sh
./COMPLETE_SETUP.sh
```
⏱️ 10-15 minutes

### 2. Upload to tmpfiles:
```bash
chmod +x upload-to-tmpfiles.sh
./upload-to-tmpfiles.sh
```
⏱️ 1-2 minutes

### 3. Share Link:
```
https://tmpfiles.org/dl/xxxxx
```
Copy කරලා share කරන්න!

### 4. Test:
Phone එකෙන් link එක open කරලා APK download කරන්න.

**Total Time:** ~15-20 minutes

---

## 🔗 Alternative Upload Services

tmpfiles.org වැඩ නැත්නම්:

### 1. Transfer.sh:
```bash
curl --upload-file මුදල්-කළමනාකරණ-v1.0.apk https://transfer.sh/finance-app.apk
```

### 2. File.io:
```bash
curl -F "file=@මුදල්-කළමනාකරණ-v1.0.apk" https://file.io
```

### 3. 0x0.st:
```bash
curl -F "file=@මුදල්-කළමනාකරණ-v1.0.apk" https://0x0.st
```

---

## ✅ Success Checklist

Upload කිරීමෙන් පස්සේ verify කරන්න:

- [ ] Link එක copy කරගත්තා
- [ ] download-link.txt file එකේ save වුණා
- [ ] Link එක test කරලා බැලුවා (browser එකෙන්)
- [ ] APK download වෙනවා confirm කළා
- [ ] Share message එක prepare කරලා තියෙනවා
- [ ] Link එක safe place එකක save කරලා තියෙනවා

---

## 🎉 Done!

ඔබට දැන්:
- ✅ Automated upload script එකක් තියෙනවා
- ✅ Manual upload commands තියෙනවා
- ✅ Share templates තියෙනවා
- ✅ Troubleshooting solutions තියෙනවා
- ✅ Alternative services තියෙනවා

---

## 🚀 Start Now!

```bash
# One command - everything automatic!
chmod +x upload-to-tmpfiles.sh && ./upload-to-tmpfiles.sh
```

**Result:** Download link ready in 1-2 minutes!

---

**සාර්ථක upload කිරීමක් වේවා! 🎉**

**Questions?** Check [UPLOAD_APK_GUIDE.md](UPLOAD_APK_GUIDE.md) for more options!
