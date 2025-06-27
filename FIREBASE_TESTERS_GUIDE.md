# 👥 دليل إدارة Testers في Firebase App Distribution

## 🎯 الهدف
بدلاً من إرسال النسخة لشخص واحد، يمكنك إنشاء مجموعة testers وإرسال النسخة لجميع الأشخاص في المجموعة مرة واحدة.

## 🚀 الأوامر الجديدة

### 1. إنشاء مجموعة testers
```bash
fastlane android create_testers_group
```

### 2. إضافة tester إلى المجموعة
```bash
fastlane android add_tester email:test@example.com
```

### 3. رفع نسخة لجميع testers في المجموعة
```bash
fastlane android release_with_testers
```

### 4. عرض جميع testers
```bash
fastlane android list_testers
```

## 📋 خطوات الإعداد

### الخطوة 1: إنشاء مجموعة testers
```bash
fastlane android create_testers_group
```

### الخطوة 2: إضافة testers للمجموعة
```bash
# إضافة tester واحد
fastlane android add_tester email:ahmed@example.com

# إضافة tester آخر
fastlane android add_tester email:sara@example.com

# إضافة tester ثالث
fastlane android add_tester email:mohamed@example.com
```

### الخطوة 3: رفع نسخة لجميع testers
```bash
fastlane android release_with_testers
```

## 🔄 سير العمل الجديد

### للمرة الأولى:
1. `fastlane android create_testers_group` - إنشاء المجموعة
2. `fastlane android add_tester email:test@example.com` - إضافة testers
3. `fastlane android release_with_testers` - رفع نسخة للجميع

### للتحديثات اللاحقة:
1. `fastlane android shorebird_patch` - تحديث OTA عبر Shorebird
2. `fastlane android release_with_testers` - رفع نسخة جديدة لجميع testers

## 📱 كيف يعمل؟

### في Firebase Console:
- اذهب إلى **App Distribution > Testers**
- ستجد مجموعة "Testers Group"
- جميع testers المضافة سيظهرون في هذه المجموعة

### عند رفع نسخة:
- جميع testers في المجموعة سيتلقون إشعار بالنسخة الجديدة
- يمكنهم تحميل النسخة مباشرة من الإشعار
- لا تحتاج لإرسال رابط منفصل لكل شخص

## 🛠️ أوامر مفيدة

```bash
# إنشاء المجموعة (مرة واحدة فقط)
fastlane android create_testers_group

# إضافة testers
fastlane android add_tester email:test1@example.com
fastlane android add_tester email:test2@example.com
fastlane android add_tester email:test3@example.com

# رفع نسخة للجميع
fastlane android release_with_testers

# عرض جميع testers
fastlane android list_testers
```

## ⚠️ ملاحظات مهمة

1. **إنشاء المجموعة مرة واحدة فقط** - لا تحتاج لإعادة إنشائها
2. **إضافة testers حسب الحاجة** - يمكنك إضافة testers جدد في أي وقت
3. **النسخة تصل للجميع** - عند رفع نسخة، جميع testers في المجموعة سيتلقونها
4. **إدارة من Firebase Console** - يمكنك إدارة testers من Firebase Console أيضاً

## 🎉 المميزات

- ✅ **سهولة الإدارة** - مجموعة واحدة بدلاً من قوائم منفصلة
- ✅ **توزيع تلقائي** - جميع testers يتلقون النسخة تلقائياً
- ✅ **مرونة** - إضافة/إزالة testers بسهولة
- ✅ **تتبع** - معرفة من قام بتحميل النسخة

## 🔗 روابط مفيدة

- [Firebase App Distribution Documentation](https://firebase.google.com/docs/app-distribution)
- [Managing Testers](https://firebase.google.com/docs/app-distribution/manage-testers)
- [Creating Groups](https://firebase.google.com/docs/app-distribution/manage-testers#create-groups) 