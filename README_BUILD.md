# 📦 APK Build කරන විදිහ

## ⚡ Quick Start (සරලම විදිහ)

### Method 1: Automated Script (Recommended)

```bash
# Script එක run කරන්න
./build-apk.sh
```

මේක automatically:
- ✅ EAS CLI check කරයි
- ✅ Login check කරයි  
- ✅ APK build කරයි
- ✅ Download link එක show කරයි

### Method 2: Manual Commands

```bash
# 1. EAS CLI install කරන්න
npm install -g eas-cli

# 2. Expo account හරහා login කරන්න
eas login

# 3. APK build කරන්න
npm run build:android

# 4. Build complete වුනාට පස්සේ download link එක
eas build:list
```

---

## 📱 Download Link ලබාගන්න

Build complete වුනාට පස්සේ download link එක:

### Terminal හරහා:
```bash
eas build:list
```
Latest build එකේ link එක copy කරන්න.

### Direct Link Format:
```
https://expo.dev/artifacts/[build-id]
```

### Expo Dashboard හරහා:
1. https://expo.dev වෙත යන්න
2. Login කරන්න
3. Projects → finance-app-mobile
4. Builds tab
5. Latest build → Download button

---

## 🎯 Build Commands

```bash
# Preview APK (testing සඳහා)
npm run build:android

# Production APK
npm run build:android:prod

# Build status check
npm run build:status
```

---

## ⏱️ Build Time

- පළමු build: ~15-20 minutes
- පසුව builds: ~10-15 minutes

---

## 📋 Requirements

1. **Expo Account** (Free)
   - https://expo.dev/signup
   - හෝ `eas register` command

2. **EAS CLI**
   ```bash
   npm install -g eas-cli
   ```

3. **Login**
   ```bash
   eas login
   ```

---

## 🔍 Build Status Check

```bash
# All builds
eas build:list

# Specific build
eas build:view [build-id]

# Latest build status
npm run build:status
```

---

## 🐛 Troubleshooting

### Build Failed?

```bash
# Error details
eas build:view [build-id]

# Clear cache and rebuild
eas build --platform android --profile preview --clear-cache
```

### Download Link නැත?

1. Build complete වුනාද check කරන්න
2. Expo dashboard හි check කරන්න
3. Build ID use කරලා direct link:
   ```
   https://expo.dev/artifacts/[build-id]
   ```

---

## 📚 More Info

- **Full Instructions:** `BUILD_INSTRUCTIONS.md`
- **Quick Guide:** `BUILD_QUICK.md`
- **EAS Docs:** https://docs.expo.dev/build/introduction/

---

**Build කරන්න: `./build-apk.sh` 🚀**
