@echo off
chcp 65001 >nul

echo 🍎 Fruit App - Auto Update Script
echo ==================================

REM التحقق من وجود fastlane
where fastlane >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: fastlane not found. Please install fastlane first.
    pause
    exit /b 1
)

REM التحقق من وجود shorebird
where shorebird >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: shorebird not found. Please install shorebird first.
    echo Install command: curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/shorebirdtech/install/main/install.sh ^| bash
    pause
    exit /b 1
)

REM الانتقال إلى مجلد android
cd android

echo 🔄 Starting automatic update...

REM تشغيل التحديث التلقائي
fastlane android shorebird_auto_update

REM التحقق من نجاح العملية
if %errorlevel% equ 0 (
    echo.
    echo ✅ Update completed successfully!
    echo 📱 Users will get the update automatically when they open the app.
    echo.
    echo 📊 To check update status: fastlane android shorebird_status
) else (
    echo.
    echo ❌ Update failed. Please check the error messages above.
    echo.
    echo 🛠️  Troubleshooting options:
    echo    - fastlane android shorebird_clean_patch
    echo    - fastlane android shorebird_status
    echo    - shorebird doctor
)

cd ..

pause 