# APK Installation Troubleshooting

## Common "App not installed" Errors

### Error: "Package appears to be invalid"
This usually means:
1. APK is not properly signed
2. APK is not properly aligned
3. APK structure is corrupted

### Solutions:

#### Method 1: Install via ADB (Recommended)
```bash
adb install fixed_app.apk
```

#### Method 2: Enable Developer Options
1. Go to Settings > About Phone
2. Tap "Build Number" 7 times
3. Go back to Settings > Developer Options
4. Enable "USB Debugging"
5. Enable "Install via USB"

#### Method 3: Uninstall Old Version First
If you have the old app installed:
```bash
adb uninstall com.financialapp
# or
adb uninstall <package-name-from-old-apk>
```

#### Method 4: Check APK Info
```bash
aapt dump badging fixed_app.apk
# or
adb install -r fixed_app.apk  # Force reinstall
```

### Alternative: Build from Source
The source code is ready at `/workspace/financial-app/`

To build properly:
1. Install Android Studio
2. Open the `android` folder
3. Sync Gradle
4. Build > Build Bundle(s) / APK(s) > Build APK(s)

### Current APK Status:
- ✅ Signed with debug keystore
- ✅ Icons updated
- ⚠️ May need proper alignment

---

**If installation still fails, please provide:**
1. Exact error message from device
2. Android version
3. Whether old app is installed
