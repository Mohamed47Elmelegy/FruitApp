# 🚀 دليل Shorebird مع Firebase App Distribution

## 📋 نظرة عامة

هذا الدليل يوضح كيفية ربط Shorebird مع Firebase App Distribution لتجنب رفع نسخة جديدة كل مرة.

## 🔧 الإعداد الأولي

### 1. تثبيت Shorebird
```bash
# تثبيت Shorebird CLI
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/shorebirdtech/install/main/install.sh | bash

# إعادة تشغيل Terminal
source ~/.bashrc
```

### 2. إعداد Shorebird للمشروع
```bash
# في مجلد المشروع
shorebird init
```

### 3. إعداد Firebase App Distribution
```bash
# تثبيت Firebase CLI
npm install -g firebase-tools

# تسجيل الدخول
firebase login

# إعداد المشروع
firebase init appdistribution
```

## 🎯 الاستخدام

### الإصدار الأول (بناء كامل + رفع)
```bash
fastlane android shorebird_release
```

### التحديثات اللاحقة (Shorebird Patch فقط)
```bash
fastlane android shorebird_patch
```

## 📁 الملفات المهمة

### 1. `shorebird.yaml`
```yaml
app_id: 4e379197-26fa-4711-a980-766b0dd22015
flavors:
  dev: d7c403d7-6294-4aad-a785-e36383029bb4
  prod: feaa2575-4845-4031-a1fb-71997f4cc300
```

### 2. `android/fastlane/Fastfile`
يحتوي على جميع الأوامر المطلوبة.

### 3. `android/fastlane/Appfile`
يحتوي على إعدادات التطبيق.

## 🔄 سير العمل

### للمرة الأولى:
1. `fastlane android shorebird_release`
   - يبني التطبيق كاملاً
   - يرفعه على Firebase App Distribution
   - ينشئ إصدار Shorebird

### للتحديثات اللاحقة:
1. `fastlane android shorebird_patch`
   - يرسل تحديث OTA عبر Shorebird
   - لا يحتاج لرفع نسخة جديدة

## 🛠️ أوامر مفيدة

```bash
# عرض حالة Shorebird
fastlane android shorebird_status

# اختبار Firebase
fastlane android test_firebase

# تشغيل محلي
fastlane android shorebird_run

# إعادة إعداد Shorebird
fastlane android shorebird_init
```

## ⚠️ استكشاف الأخطاء

### مشكلة: "This project is not linked to a Google Play account"
**الحل:** هذا تحذير عادي لـ Firebase App Distribution، لا يؤثر على الوظيفة.

### مشكلة: "Firebase App Distribution failed"
**الحل:**
1. تأكد من صحة Firebase Token
2. تأكد من إعداد Firebase App Distribution في Console
3. تأكد من وجود مجموعة "testers"

### مشكلة: "Shorebird patch failed"
**الحل:**
1. تأكد من وجود إصدار سابق
2. تأكد من عدم تغيير native code
3. تحقق من `shorebird doctor`

## 📊 مراقبة التحديثات

### في Firebase Console:
- App Distribution > Releases
- تتبع من قام بتحميل النسخة

### في Shorebird Dashboard:
- عرض الإصدارات والتحديثات
- مراقبة معدل التحديث

## 🔐 الأمان

### Firebase Token:
- احتفظ بالـ token آمن
- لا تشاركه في الكود العام
- استخدم متغيرات البيئة

### Shorebird:
- `app_id` آمن للمشاركة
- لا يحتوي على معلومات حساسة

## 📈 أفضل الممارسات

1. **اختبار التحديثات:** دائماً اختبر التحديثات محلياً أولاً
2. **التوثيق:** وثق كل إصدار وتحديث
3. **المراقبة:** راقب معدل التحديث والأخطاء
4. **النسخ الاحتياطية:** احتفظ بنسخة من كل إصدار مهم

## 🆘 الدعم

- [Shorebird Documentation](https://docs.shorebird.dev)
- [Firebase App Distribution](https://firebase.google.com/docs/app-distribution)
- [Fastlane Documentation](https://docs.fastlane.tools) 