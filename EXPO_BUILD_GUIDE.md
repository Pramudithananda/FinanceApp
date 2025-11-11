# 🚀 Expo භාවිතයෙන් APK Build කරන්නේ කොහොමද?

## ඉතාම පහසු ක්‍රමය! (Easiest Method!)

---

## 🎯 Why Expo?

✅ Native folders setup කරන්න ඕන නෑ  
✅ Android Studio install කරන්න ඕන නෑ  
✅ Cloud හි build වෙයි (ඔබේ computer එකේ resources use කරන්නේ නෑ)  
✅ APK download කරන්න පුළුවන් direct link එකක් ලැබේ  
✅ iOS build කරන්නත් පුළුවන් (Mac නැතිව)  

---

## 📋 STEP 1: Expo Project එකක් සාදන්න

### 1.1 Expo CLI Install කරන්න

```bash
npm install -g expo-cli
npm install -g eas-cli
```

### 1.2 නව Expo Project එකක් Create කරන්න

```bash
# නව project එකක් create කරන්න
npx create-expo-app MudalKalamanakarna --template blank

cd MudalKalamanakarna
```

---

## 📋 STEP 2: ඔබගේ Code Copy කරන්න

### 2.1 Dependencies Install කරන්න

```bash
# Navigation dependencies
npm install @react-navigation/native @react-navigation/bottom-tabs

# Expo navigation dependencies
npx expo install react-native-screens react-native-safe-area-context

# AsyncStorage
npx expo install @react-native-async-storage/async-storage

# Vector Icons (Expo හි built-in)
npx expo install @expo/vector-icons
```

### 2.2 Files Copy කරන්න

```bash
# ඔබගේ /workspace folder එකෙන් මේවා copy කරන්න:

# 1. src/ folder එක සම්පූර්ණයෙන්ම
cp -r /workspace/src ./

# 2. App.js file එක
cp /workspace/App.js ./

# හෝ manually copy කරන්න:
# - /workspace/src/context/AppContext.js
# - /workspace/src/screens/*.js
# - /workspace/src/utils/formatters.js
# - /workspace/App.js
```

### 2.3 App.js Modify කරන්න (Expo සඳහා)

`App.js` file එක open කර මෙසේ වෙනස් කරන්න:

```javascript
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { SafeAreaProvider } from 'react-native-safe-area-context';
// Vector Icons - Expo version
import { MaterialCommunityIcons } from '@expo/vector-icons';

import DashboardScreen from './src/screens/DashboardScreen';
import BankScreen from './src/screens/BankScreen';
import CashScreen from './src/screens/CashScreen';
import CategoriesScreen from './src/screens/CategoriesScreen';
import SettingsScreen from './src/screens/SettingsScreen';
import { AppProvider } from './src/context/AppContext';

const Tab = createBottomTabNavigator();

// Icon component wrapper
const Icon = ({ name, size, color }) => (
  <MaterialCommunityIcons name={name} size={size} color={color} />
);

export default function App() {
  return (
    <SafeAreaProvider>
      <AppProvider>
        <NavigationContainer>
          <Tab.Navigator
            screenOptions={{
              tabBarActiveTintColor: '#4F46E5',
              tabBarInactiveTintColor: '#9CA3AF',
              tabBarStyle: {
                backgroundColor: '#FFFFFF',
                borderTopWidth: 1,
                borderTopColor: '#E5E7EB',
                height: 65,
                paddingBottom: 8,
                paddingTop: 8,
              },
              tabBarLabelStyle: {
                fontSize: 11,
                fontWeight: '600',
              },
              headerStyle: {
                backgroundColor: '#4F46E5',
              },
              headerTintColor: '#FFFFFF',
              headerTitleStyle: {
                fontWeight: 'bold',
                fontSize: 20,
              },
            }}
          >
            <Tab.Screen
              name="Dashboard"
              component={DashboardScreen}
              options={{
                title: 'Dashboard',
                tabBarLabel: 'මුල් පිටුව',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="view-dashboard" size={size} color={color} />
                ),
              }}
            />
            <Tab.Screen
              name="Bank"
              component={BankScreen}
              options={{
                title: 'බැංකු ගිණුම්',
                tabBarLabel: 'බැංකු',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="bank" size={size} color={color} />
                ),
              }}
            />
            <Tab.Screen
              name="Cash"
              component={CashScreen}
              options={{
                title: 'මුදල් ගිණුම්',
                tabBarLabel: 'මුදල්',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="cash" size={size} color={color} />
                ),
              }}
            />
            <Tab.Screen
              name="Categories"
              component={CategoriesScreen}
              options={{
                title: 'ප්‍රවර්ග',
                tabBarLabel: 'ප්‍රවර්ග',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="folder-open" size={size} color={color} />
                ),
              }}
            />
            <Tab.Screen
              name="Settings"
              component={SettingsScreen}
              options={{
                title: 'සැකසුම්',
                tabBarLabel: 'සැකසුම්',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="cog" size={size} color={color} />
                ),
              }}
            />
          </Tab.Navigator>
        </NavigationContainer>
      </AppProvider>
    </SafeAreaProvider>
  );
}
```

### 2.4 Screen Files Update කරන්න

සියලු screen files වල `react-native-vector-icons` import එක වෙනස් කරන්න:

```javascript
// Before (React Native CLI):
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

// After (Expo):
import { MaterialCommunityIcons as Icon } from '@expo/vector-icons';
```

---

## 📋 STEP 3: App Test කරන්න (Local)

```bash
# Expo development server start කරන්න
npx expo start

# Options:
# - Press 'a' for Android
# - Press 'i' for iOS (Mac only)
# - Scan QR code with Expo Go app on phone
```

---

## 📋 STEP 4: EAS Build Setup කරන්න

### 4.1 EAS Configure කරන්න

```bash
# EAS login (account create කරන්න නැත්නම්)
eas login

# Build configure කරන්න
eas build:configure
```

### 4.2 eas.json Configure කරන්න

`eas.json` file එක create වේ. මෙසේ වෙනස් කරන්න:

```json
{
  "cli": {
    "version": ">= 5.2.0"
  },
  "build": {
    "development": {
      "developmentClient": true,
      "distribution": "internal"
    },
    "preview": {
      "android": {
        "buildType": "apk"
      },
      "distribution": "internal"
    },
    "production": {
      "android": {
        "buildType": "aab"
      }
    }
  },
  "submit": {
    "production": {}
  }
}
```

### 4.3 app.json Update කරන්න

`app.json` file එකේ app details add කරන්න:

```json
{
  "expo": {
    "name": "මුදල් කළමනාකරණ",
    "slug": "mudal-kalamanakarna",
    "version": "2.0.0",
    "orientation": "portrait",
    "icon": "./assets/icon.png",
    "userInterfaceStyle": "light",
    "splash": {
      "image": "./assets/splash.png",
      "resizeMode": "contain",
      "backgroundColor": "#4F46E5"
    },
    "assetBundlePatterns": [
      "**/*"
    ],
    "ios": {
      "supportsTablet": true,
      "bundleIdentifier": "com.mudalkalmanakarna.app"
    },
    "android": {
      "adaptiveIcon": {
        "foregroundImage": "./assets/adaptive-icon.png",
        "backgroundColor": "#4F46E5"
      },
      "package": "com.mudalkalmanakarna.app",
      "versionCode": 1
    },
    "web": {
      "favicon": "./assets/favicon.png"
    }
  }
}
```

---

## 📋 STEP 5: APK Build කරන්න! 🚀

### Method 1: Preview APK (Testing - Fastest)

```bash
# APK build කරන්න (Cloud හි)
eas build --platform android --profile preview

# Build status check කරන්න
eas build:list

# Build complete වීමෙන් පසු download link එකක් ලැබේ!
```

### Method 2: Local Build (Faster if configured)

```bash
# Local build කරන්න (experimental)
eas build --platform android --profile preview --local
```

### Method 3: Production Build (Play Store සඳහා)

```bash
# AAB build කරන්න
eas build --platform android --profile production
```

---

## 📋 STEP 6: APK Download කරගන්න

Build complete වීමෙන් පසු:

### Option A: Terminal Link

```
✅ Build complete!
📱 Download: https://expo.dev/artifacts/eas/xxxxx.apk

Click the link or copy to browser
```

### Option B: Expo Dashboard

```
1. Visit: https://expo.dev
2. Login to your account
3. Select your project
4. Go to "Builds" tab
5. Click "Download" button
6. APK file download වේ!
```

### Option C: Command Line

```bash
# Build URL list කරන්න
eas build:list

# Specific build download කරන්න
eas build:download --platform android
```

---

## 📋 STEP 7: APK Share කරන්න

### Method 1: Direct Phone Install

```bash
# QR code generate කරන්න
eas build:list

# Phone එකෙන් QR code scan කරන්න
# Direct download & install වේ!
```

### Method 2: Manual Download & Install

```
1. APK download කරන්න computer එකට
2. Phone එකට transfer කරන්න (USB/Cloud)
3. File Manager open කරන්න
4. APK tap කරන්න
5. Install කරන්න
6. Enjoy! 🎉
```

---

## 🎯 Complete Example (Start to Finish)

```bash
# 1. Create Expo project
npx create-expo-app MudalKalamanakarna --template blank
cd MudalKalamanakarna

# 2. Install dependencies
npm install @react-navigation/native @react-navigation/bottom-tabs
npx expo install react-native-screens react-native-safe-area-context
npx expo install @react-native-async-storage/async-storage
npx expo install @expo/vector-icons

# 3. Copy your code
# (Manually copy src/ folder and App.js)

# 4. Test locally
npx expo start
# Press 'a' for Android

# 5. Setup EAS
npm install -g eas-cli
eas login
eas build:configure

# 6. Build APK
eas build --platform android --profile preview

# 7. Wait for build (5-15 minutes)
# ☕ Have a coffee break!

# 8. Download APK from link provided
# 9. Install & Enjoy! 🎉
```

---

## 💡 Expo vs React Native CLI

| Feature | Expo | React Native CLI |
|---------|------|------------------|
| Setup | ⚡ Easy | 🐢 Complex |
| Build | ☁️ Cloud | 💻 Local |
| Android Studio | ❌ Not needed | ✅ Required |
| Build Time | 5-15 min | 5-10 min |
| APK Download | 🌐 Direct link | 📁 Local file |
| iOS Build | ✅ Yes (no Mac) | 🍎 Mac only |
| Customization | 🔒 Limited | 🔓 Full access |

---

## 🔧 Common Issues

### Issue 1: "eas command not found"

```bash
npm install -g eas-cli
```

### Issue 2: Build fails with dependencies

```bash
# Clear cache
npx expo start -c

# Reinstall dependencies
rm -rf node_modules
npm install
```

### Issue 3: "Not logged in"

```bash
eas login
# Enter your Expo account credentials
```

### Issue 4: Build takes too long

```
⏱️ Normal build time: 5-15 minutes
☁️ Cloud build depends on Expo servers
✅ You'll get email when build completes
```

---

## 📊 Build Cost (Expo)

```
🆓 Free Plan:
   - 30 builds per month
   - Perfect for testing & development
   
💰 Paid Plans:
   - More builds
   - Priority queue
   - Better support
```

---

## ✅ Final Checklist

Before building:

- [ ] Expo CLI installed
- [ ] EAS CLI installed
- [ ] Expo account created
- [ ] Project configured
- [ ] Dependencies installed
- [ ] Code tested locally
- [ ] app.json configured
- [ ] eas.json configured

After building:

- [ ] Build successful
- [ ] APK downloaded
- [ ] Installed on test device
- [ ] App works correctly
- [ ] All features functional
- [ ] Ready to share!

---

## 🎊 සාර්ථකයි!

Expo භාවිතයෙන් APK build කිරීම **ඉතාම පහසුයි**!

✅ No complex setup  
✅ No Android Studio  
✅ Cloud build  
✅ Direct download link  
✅ Easy to share  

**Happy Building!** 🚀📱

---

Made with ❤️ for Sri Lanka 🇱🇰
