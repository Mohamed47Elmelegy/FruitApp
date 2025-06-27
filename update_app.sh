#!/bin/bash

# 🚀 Script التحديث التلقائي للتطبيق
# يستخدم Shorebird لتحديث التطبيق بدون رفع نسخة جديدة

echo "🍎 Fruit App - Auto Update Script"
echo "=================================="

# التحقق من وجود fastlane
if ! command -v fastlane &> /dev/null; then
    echo "❌ Error: fastlane not found. Please install fastlane first."
    exit 1
fi

# التحقق من وجود shorebird
if ! command -v shorebird &> /dev/null; then
    echo "❌ Error: shorebird not found. Please install shorebird first."
    echo "Install command: curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/shorebirdtech/install/main/install.sh | bash"
    exit 1
fi

# الانتقال إلى مجلد android
cd android

echo "🔄 Starting automatic update..."

# تشغيل التحديث التلقائي
fastlane android shorebird_auto_update

# التحقق من نجاح العملية
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Update completed successfully!"
    echo "📱 Users will get the update automatically when they open the app."
    echo ""
    echo "📊 To check update status: fastlane android shorebird_status"
else
    echo ""
    echo "❌ Update failed. Please check the error messages above."
    echo ""
    echo "🛠️  Troubleshooting options:"
    echo "   - fastlane android shorebird_clean_patch"
    echo "   - fastlane android shorebird_status"
    echo "   - shorebird doctor"
fi

cd .. 