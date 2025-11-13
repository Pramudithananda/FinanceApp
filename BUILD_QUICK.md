# ⚡ Quick APK Build Guide

## 🎯 Fastest Way to Build & Download APK

### Option 1: Automated Script (Easiest)

```bash
./build-apk.sh
```

මේ script එක:
- ✅ EAS CLI check කරයි
- ✅ Login check කරයි
- ✅ APK build කරයි
- ✅ Download link එක show කරයි

### Option 2: Manual Commands

```bash
# 1. EAS CLI install (first time only)
npm install -g eas-cli

# 2. Login
eas login

# 3. Build APK
eas build --platform android --profile preview

# 4. Get download link (after build completes)
eas build:list
# Latest build එකේ link එක copy කරන්න
```

### Option 3: One-Line Build

```bash
eas build --platform android --profile preview && eas build:list --limit 1
```

---

## 📱 Download Link Format

Build complete වුනාට පස්සේ:

```
https://expo.dev/artifacts/[build-id]
```

**Example:**
```
https://expo.dev/artifacts/eas-abc123xyz
```

---

## 🔗 Alternative: Expo Dashboard

1. Go to: https://expo.dev
2. Login
3. Your projects → finance-app-mobile
4. Builds tab
5. Latest build → Download button

---

## ⏱️ Build Time

- First build: ~15-20 minutes
- Subsequent builds: ~10-15 minutes

---

## ✅ Build Complete කියලා දැනගන්න

Terminal හි:
```
✅ Build Complete!
📱 APK Download Link:
   https://expo.dev/artifacts/[build-id]
```

---

**Ready to build! Run `./build-apk.sh` 🚀**
