@echo off
REM Account Management App - APK Build Script for Windows
REM මෙම script එක භාවිතා කරලා APK file එකක් build කරන්න පුළුවන් වෙයි

echo 🚀 Starting APK Build Process...
echo 📱 Account Management App - APK Builder
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js first.
    pause
    exit /b 1
)

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm first.
    pause
    exit /b 1
)

echo ✅ Node.js and npm are installed
echo 📦 Installing dependencies...

REM Install dependencies
npm install
if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)

echo ✅ Dependencies installed successfully

REM Check if Android SDK is available
if "%ANDROID_HOME%"=="" (
    echo ⚠️  ANDROID_HOME is not set. Please set it to your Android SDK path.
    echo    Example: set ANDROID_HOME=C:\Users\YourUsername\AppData\Local\Android\Sdk
    pause
    exit /b 1
)

echo ✅ Android SDK found at: %ANDROID_HOME%

REM Clean previous builds
echo 🧹 Cleaning previous builds...
cd android
gradlew clean
if %errorlevel% neq 0 (
    echo ❌ Failed to clean project
    cd ..
    pause
    exit /b 1
)
cd ..

echo ✅ Project cleaned successfully

REM Build release APK
echo 🔨 Building release APK...
cd android
gradlew assembleRelease
if %errorlevel% neq 0 (
    echo ❌ Failed to build APK
    cd ..
    pause
    exit /b 1
)
cd ..

echo ✅ APK built successfully!

REM Check if APK exists
set APK_PATH=android\app\build\outputs\apk\release\app-release.apk
if exist "%APK_PATH%" (
    echo 📱 APK file created at: %APK_PATH%
    echo.
    echo 🎉 Build completed successfully!
    echo.
    echo 📋 Next steps:
    echo 1. Copy the APK to your Android device
    echo 2. Enable 'Install from Unknown Sources' in settings
    echo 3. Tap the APK file to install
    echo.
    echo 🔧 To install via ADB:
    echo    adb install %APK_PATH%
) else (
    echo ❌ APK file not found at expected location
    pause
    exit /b 1
)

echo.
echo 🚀 Happy coding! Your app is ready to use!
pause