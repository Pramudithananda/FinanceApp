# 📤 APK File Upload කරන්න - Catbox & වෙනත් Services

## 🎯 APK File එක Upload කරලා Share කරන්නේ කොහොමද?

---

## 🚀 Method 1: Catbox.moe (Recommended!)

Catbox එක **anonymous, fast, and free** file hosting service එකක්!

### Step 1: APK Build කරන්න (තවම කළේ නැත්නම්)

```bash
chmod +x COMPLETE_SETUP.sh
./COMPLETE_SETUP.sh
```

හෝ existing APK use කරන්න:
```
workspace/මුදල් කළමනාකරණ_1.0.apk
```

### Step 2: Catbox වෙබ්සයිට් එකට යන්න

🌐 **Website:** https://catbox.moe/

### Step 3: Upload කරන්න

**Desktop/Laptop එකෙන්:**
1. https://catbox.moe/ වෙබ් පිටුව open කරන්න
2. "Choose File" button එක click කරන්න
3. APK file එක select කරන්න (`මුදල්-කළමනාකරණ-v1.0.apk`)
4. "Upload" button එක click කරන්න
5. Upload වෙනකන් ඉන්න (file size අනුව මිනිත්තු 1-2ක් විතර)

**Mobile Phone එකෙන්:**
1. Browser එකෙන් https://catbox.moe/ open කරන්න
2. "Browse" හෝ "Choose File" tap කරන්න
3. File manager එකෙන් APK file එක select කරන්න
4. "Upload" tap කරන්න

### Step 4: Link එක Copy කරගන්න

Upload කිරීම complete වුණාට පස්සේ, ඔබට direct link එකක් ලැබෙනවා:

```
https://files.catbox.moe/xxxxxx.apk
```

**මේ link එක:**
- ✅ Permanent (delete නොවේ)
- ✅ Anonymous (account එකක් ඕන නැහැ)
- ✅ Fast downloads
- ✅ No ads හෝ waiting time
- ✅ Direct download link

### Step 5: Share කරන්න

Link එක share කරන්න:
- WhatsApp groups
- Telegram channels
- Facebook
- Email
- SMS
- QR code

---

## 📦 Method 2: GitHub Releases (For Developers)

**GitHub repository එකක් තියෙනවා නම්:**

### Step 1: Create a Release

```bash
# GitHub CLI use කරන්න
gh release create v1.0.0 "මුදල්-කළමනාකරණ-v1.0.apk" \
  --title "මුදල් කළමනාකරණ යෙදුම v1.0" \
  --notes "Initial release - Finance Management App"
```

**Web interface එකෙන්:**
1. GitHub repo එක open කරන්න
2. "Releases" tab එකට යන්න
3. "Draft a new release" click කරන්න
4. Tag version එක type කරන්න (v1.0.0)
5. APK file එක drag & drop කරන්න
6. "Publish release" click කරන්න

### Step 2: Share Download Link

GitHub automatically direct download link එකක් දෙනවා:
```
https://github.com/username/repo/releases/download/v1.0.0/මුදල්-කළමනාකරණ-v1.0.apk
```

---

## ☁️ Method 3: Google Drive

### Upload කරන්න:

1. **Google Drive එකට යන්න:** https://drive.google.com/
2. **Upload:** "New" → "File upload" → APK select කරන්න
3. **Wait:** Upload complete වෙනකන් ඉන්න
4. **Share:** File එක right-click → "Share"
5. **Public Access:** "Anyone with the link" select කරන්න
6. **Copy Link:** Share link එක copy කරන්න

**Direct Download Link හදන්න:**

Normal link එක:
```
https://drive.google.com/file/d/FILE_ID/view?usp=sharing
```

Direct download link එක:
```
https://drive.google.com/uc?export=download&id=FILE_ID
```

`FILE_ID` එක normal link එකෙන් copy කරගන්න.

---

## 📂 Method 4: Dropbox

### Upload කරන්න:

1. **Dropbox වෙබ්සයිට්:** https://www.dropbox.com/
2. **Upload:** "Upload" button → APK file select කරන්න
3. **Share:** File එක hover කරලා "Share" click කරන්න
4. **Create Link:** "Create link" button click කරන්න
5. **Copy:** Link එක copy කරන්න

**Direct Download Link:**

Normal link:
```
https://www.dropbox.com/s/xxxxx/file.apk?dl=0
```

Direct download (change `dl=0` to `dl=1`):
```
https://www.dropbox.com/s/xxxxx/file.apk?dl=1
```

---

## 🔗 Method 5: Transfer.sh (Command Line)

**Terminal එකෙන් instant upload:**

```bash
# APK upload කරන්න
curl --upload-file මුදල්-කළමනාකරණ-v1.0.apk https://transfer.sh/finance-app.apk

# Output එක:
# https://transfer.sh/xxxxx/finance-app.apk
```

**Features:**
- No registration
- Command line friendly
- Files kept for 14 days
- Direct download

---

## 📱 Method 6: WeTransfer

### Upload කරන්න:

1. **Website:** https://wetransfer.com/
2. **Add Files:** APK file drag & drop කරන්න
3. **Email හෝ Link:** "Get a link" option select කරන්න
4. **Upload:** "Transfer" button click කරන්න
5. **Copy Link:** Upload complete වුණාම link copy කරන්න

**Features:**
- ✅ Up to 2GB free
- ✅ No account needed
- ✅ Files kept for 7 days
- ⚠️ Not permanent

---

## 🌐 Method 7: Mega.nz

### Upload කරන්න:

1. **Website:** https://mega.nz/
2. **Sign Up:** Free account create කරන්න (50GB free!)
3. **Upload:** APK file drag & drop කරන්න
4. **Share:** Right-click → "Get link"
5. **Copy:** Link එක copy කරගන්න

**Features:**
- ✅ 50GB free storage
- ✅ End-to-end encryption
- ✅ Fast downloads
- ✅ Permanent storage

---

## 📊 Service Comparison

| Service | Max Size | Duration | Speed | Best For |
|---------|----------|----------|-------|----------|
| **Catbox** | 200MB | Permanent | ⚡⚡⚡ | Everyone! ⭐ |
| **GitHub** | 2GB | Permanent | ⚡⚡⚡ | Developers |
| **Drive** | 15GB | Permanent | ⚡⚡ | Long-term |
| **Dropbox** | 2GB | Permanent | ⚡⚡ | Long-term |
| **Transfer** | 2GB | 14 days | ⚡⚡⚡ | Quick share |
| **WeTransfer** | 2GB | 7 days | ⚡⚡ | Temp share |
| **Mega** | 50GB | Permanent | ⚡⚡⚡ | Large files |

---

## 🚀 Catbox Upload කරන්න (Detailed)

### Desktop/Laptop:

**Step-by-Step:**

1. **APK Location පරීක්ෂා කරන්න:**
   ```bash
   ls -lh මුදල්-කළමනාකරණ-v1.0.apk
   # හෝ
   ls -lh workspace/මුදල්\ කළමනාකරණ_1.0.apk
   ```

2. **Browser Open කරන්න:**
   - Chrome, Firefox, Edge, Safari - කවුරුත් හරි

3. **Catbox වෙබ්සයිට් එකට යන්න:**
   ```
   https://catbox.moe/
   ```

4. **Upload Interface:**
   - "Choose File" button එක click කරන්න
   - හෝ APK file එක drag කරලා drop කරන්න

5. **Select APK:**
   - File browser එකෙන් APK file එක select කරන්න
   - "Open" click කරන්න

6. **Upload:**
   - "Upload" button එක click කරන්න
   - Progress bar එක පෙන්වයි

7. **Get Link:**
   - Upload complete වුණාම link එක පෙන්වයි
   - "Copy" button click කරන්න
   - හෝ link එක select කරලා Ctrl+C

8. **Done!**
   - Link එක save කරගන්න
   - Share කරන්න පුළුවන්

### Mobile Phone:

**Android/iPhone:**

1. **APK Location:**
   - Downloads folder හෝ file එක save කළ location එක හොයන්න

2. **Browser Open:**
   - Chrome, Firefox, Samsung Internet, Safari

3. **Go to Catbox:**
   ```
   https://catbox.moe/
   ```

4. **Upload:**
   - "Browse" හෝ "Choose File" tap කරන්න
   - File picker open වෙයි
   - APK file එක select කරන්න
   - "Upload" tap කරන්න

5. **Wait:**
   - Upload progress එක බලන්න
   - Internet speed අනුව 1-5 minutes

6. **Copy Link:**
   - Upload complete වුණාම link එක long-press කරන්න
   - "Copy" select කරන්න

7. **Share:**
   - WhatsApp, Telegram, SMS, etc. via share කරන්න

---

## 🔐 Security & Privacy

### Catbox:
- ✅ Anonymous uploads (no account needed)
- ✅ Files are permanent
- ✅ No tracking
- ⚠️ Public link - anyone can download
- ⚠️ Can't delete after upload (without account)

### GitHub Releases:
- ✅ Version control
- ✅ Can delete/update
- ✅ Download statistics
- ✅ Professional
- ⚠️ Requires GitHub account

### Google Drive:
- ✅ Can control access
- ✅ Can delete anytime
- ✅ Track downloads (if enabled)
- ⚠️ Requires Google account
- ⚠️ Storage limit (15GB free)

---

## 📝 Create a Download Page

APK share කරන්න better way එකක් අවශ්‍ය නම්, simple HTML page එකක් හදන්න:

```html
<!DOCTYPE html>
<html lang="si">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>මුදල් කළමනාකරණ යෙදුම Download</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            text-align: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .container {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
        }
        .download-btn {
            display: inline-block;
            background: #10b981;
            color: white;
            padding: 15px 30px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 18px;
            margin: 20px 0;
            transition: transform 0.2s;
        }
        .download-btn:hover {
            transform: scale(1.05);
            background: #059669;
        }
        .info {
            margin: 20px 0;
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>💰 මුදල් කළමනාකරණ යෙදුම</h1>
        <p class="info">සිංහල Interface සහිත Personal Finance App</p>
        
        <a href="YOUR_CATBOX_LINK_HERE" class="download-btn">
            📥 APK Download කරන්න
        </a>
        
        <div class="info">
            <p>📦 Version: 1.0.0</p>
            <p>📏 Size: ~20MB</p>
            <p>📱 Android 6.0+</p>
        </div>
        
        <div class="info">
            <h3>Features:</h3>
            <p>✅ බැංකු ගිණුම් කළමනාකරණය</p>
            <p>✅ මුදල් ශේෂ Tracking</p>
            <p>✅ සම්පූර්ණ සිංහල Interface</p>
        </div>
        
        <div class="info">
            <small>
                <p>⚠️ "Unknown Sources" enable කරන්න අමතක නොකරන්න</p>
                <p>Settings → Security → Install Unknown Apps</p>
            </small>
        </div>
    </div>
</body>
</html>
```

මේක save කරන්න `download.html` විදිහට, එතකොට:
1. Catbox link එක `YOUR_CATBOX_LINK_HERE` replace කරන්න
2. HTML file එක GitHub Pages හෝ Netlify එකේ host කරන්න
3. Custom URL එකක් ලබාගන්න (e.g., `yourname.github.io/finance-app`)

---

## 🎯 After Upload - Share කරන විදිය

### WhatsApp:
```
🎉 මුදල් කළමනාකරණ යෙදුම දැන් Download කරගන්න!

📱 Features:
✅ බැංකු ගිණුම් tracking
✅ මුදල් කළමනාකරණය
✅ සිංහල interface

📥 Download Link:
https://files.catbox.moe/xxxxx.apk

⚠️ Install කරන්න කලින් "Unknown Sources" enable කරන්න අමතක නොකරන්න!
```

### Facebook/Telegram:
```
💰 නව මුදල් කළමනාකරණ යෙදුම!

සම්පූර්ණයෙන්ම සිංහල interface එකක් සහිත, ඔබේ මුදල් කළමනාකරණය කරන්න පහසු app එකක්!

Features:
🏦 බැංකු ගිණුම් කළමනාකරණය
💵 මුදල් ශේෂ tracking
📊 Dashboard with balance display
🇱🇰 සම්පූර්ණ සිංහල interface

Download කරන්න: [Your Catbox Link]

Version: 1.0.0 | Size: 20MB | Free & Open Source
```

---

## 🔗 QR Code Generate කරන්න

Link එක QR code එකක් විදිහට convert කරන්න:

**Online Tools:**
1. https://www.qr-code-generator.com/
2. https://www.qrcode-monkey.com/
3. https://goqr.me/

**Steps:**
1. Website එකට යන්න
2. Catbox link එක paste කරන්න
3. "Generate QR Code" click කරන්න
4. QR code download කරන්න
5. Print කරන්න හෝ share කරන්න

People ට QR code එක scan කරලා direct ව app එක download කරගන්න පුළුවන්!

---

## ✅ Checklist

Upload කරන්න කලින්:

- [ ] APK build කරලා තියෙනවා
- [ ] APK test කරලා working ද බලලා තියෙනවා
- [ ] File size reasonable ද (< 50MB)
- [ ] Internet connection stable ද
- [ ] Upload service select කරලා තියෙනවා

Upload කිරීමෙන් පස්සේ:

- [ ] Link එක test කරලා බලන්න (download වෙනවද)
- [ ] APK install වෙනවද test කරන්න
- [ ] Link එක save කරගන්න (notepad/document එකක)
- [ ] Share message එකක් prepare කරන්න
- [ ] QR code එකක් generate කරන්න (optional)

---

## 💡 Pro Tips

1. **Multiple Mirrors:** කීපයක් services එකේ upload කරන්න (backup)
2. **Version Numbers:** File name එකේ version එක දාන්න
3. **Changelog:** Changes document කරන්න
4. **Screenshots:** App screenshots share කරන්න
5. **Tutorial Video:** Quick tutorial video එකක් හදන්න

---

## 🎉 Done!

ඔබට දැන් APK file එක:
- ✅ Upload කරන්න පුළුවන්
- ✅ Share link එකක් generate කරගන්න පුළුවන්
- ✅ Anyone කට share කරන්න පුළුවන්
- ✅ Download statistics track කරන්න පුළුවන් (GitHub නම්)

---

**සාර්ථක file sharing කිරීමක් වේවා! 🚀**

**Recommended:** Catbox.moe use කරන්න - fast, free, permanent!
