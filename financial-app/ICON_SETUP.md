# App Icon Setup Guide

## ✅ Icons Created Successfully

The financial app icon has been created and placed in the correct Android resource directories:

- `android/app/src/main/res/mipmap-mdpi/ic_launcher.png` (48x48)
- `android/app/src/main/res/mipmap-hdpi/ic_launcher.png` (72x72)
- `android/app/src/main/res/mipmap-xhdpi/ic_launcher.png` (96x96)
- `android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png` (144x144)
- `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png` (192x192)

Both square and round versions are included for each density.

## 🎨 Icon Design

The icon features:
- **Blue gradient background** - Represents trust and professionalism
- **Green wallet** - Symbolizes money management
- **Gold coins** - Represents currency and wealth
- **Sinhala "රු" symbol** - Sri Lankan Rupee representation

## 📱 Building APK with New Icon

### Option 1: Build New APK (Recommended)

1. **Navigate to the project:**
   ```bash
   cd financial-app
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Build debug APK:**
   ```bash
   cd android
   ./gradlew assembleDebug
   ```

4. **Find the APK:**
   The APK will be at:
   `android/app/build/outputs/apk/debug/app-debug.apk`

### Option 2: Update Existing APK Icon

To update the existing APK file (`මුදල් කළමනාකරණ_1.0.apk`) with the new icon:

1. **Install APKTool:**
   ```bash
   # On Linux/Mac
   brew install apktool
   
   # Or download from https://ibotpeaches.github.io/Apktool/
   ```

2. **Decompile the APK:**
   ```bash
   apktool d "මුදල් කළමනාකරණ_1.0.apk" -o apk_output
   ```

3. **Replace icons:**
   ```bash
   # Copy new icons to the decompiled APK
   cp android/app/src/main/res/mipmap-*/ic_launcher*.png apk_output/res/mipmap-*/
   ```

4. **Rebuild the APK:**
   ```bash
   apktool b apk_output -o "මුදල් කළමනාකරණ_1.0_new.apk"
   ```

5. **Sign the APK (required for installation):**
   ```bash
   # Generate keystore (first time only)
   keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
   
   # Sign the APK
   jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore "මුදල් කළමනාකරණ_1.0_new.apk" my-key-alias
   
   # Align the APK
   zipalign -v 4 "මුදල් කළමනාකරණ_1.0_new.apk" "මුදල් කළමනාකරණ_1.0_signed.apk"
   ```

## 🔄 Regenerating Icons

If you need to regenerate the icons:

```bash
python3 create_icon.py
```

This will recreate all icon sizes from the source design.

## 📝 Icon Specifications

- **Format:** PNG with transparency
- **Sizes:** Multiple densities for Android
- **Style:** Modern, professional financial app design
- **Colors:** Blue (#1e3a8a), Green (#10b981), Gold (#fbbf24)

## ✅ Verification

After building, verify the icon appears correctly:
1. Install the APK on an Android device
2. Check the app icon on the home screen
3. Verify it appears in the app drawer
4. Check different screen densities if possible

## 🎯 Next Steps

1. Build the new APK with the icon
2. Test on Android device
3. Distribute the updated APK

---

**Note:** The icon is now part of the app source code and will be included automatically when building a new APK.
