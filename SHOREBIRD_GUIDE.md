# دليل استخدام Shorebird للتحديث التلقائي

## ما هو Shorebird؟
Shorebird هو أداة تسمح لك بتحديث تطبيق Flutter بدون رفع نسخة جديدة من التطبيق. يمكنك إرسال تحديثات صغيرة (patches) للمستخدمين.

## الإعداد الحالي
- ✅ Shorebird CLI مثبت
- ✅ ملف `shorebird.yaml` مُعد
- ✅ تسجيل الدخول مكتمل
- ✅ APK تم بناؤه بنجاح

## خطوات التحديث التلقائي

### 1. إنشاء Patch للتحديث
```bash
# إنشاء patch للتطبيق
shorebird patch android --flavor prod
```

### 2. رفع Patch إلى Shorebird
```bash
# رفع patch للمستخدمين
shorebird release android --flavor prod
```

### 3. مراقبة التحديثات
```bash
# عرض حالة التحديثات
shorebird releases list
```

## أوامر مفيدة

### فحص حالة Shorebird
```bash
shorebird doctor
```

### عرض معلومات التطبيق
```bash
shorebird apps list
```

### عرض الإصدارات المتاحة
```bash
shorebird releases list
```

### حذف إصدار
```bash
shorebird releases delete <release-id>
```

## مثال عملي

### عند إجراء تغييرات في الكود:

1. **أجرِ التغييرات المطلوبة في الكود**

2. **أنشئ patch**:
   ```bash
   shorebird patch android --flavor prod
   ```

3. **ارفع patch**:
   ```bash
   shorebird release android --flavor prod
   ```

4. **سيتم تحديث التطبيق تلقائياً للمستخدمين**

## ملاحظات مهمة

### ✅ ما يمكن تحديثه:
- تغييرات في UI
- إصلاحات الأخطاء
- تحسينات الأداء
- إضافة ميزات جديدة (في حدود معينة)

### ❌ ما لا يمكن تحديثه:
- تغييرات في native code
- إضافة dependencies جديدة
- تغييرات في AndroidManifest.xml
- تغييرات في Info.plist

## إعدادات التحديث التلقائي

في ملف `shorebird.yaml`:
```yaml
# تفعيل التحديث التلقائي (افتراضي)
auto_update: true

# أو تعطيل التحديث التلقائي
# auto_update: false
```

## استكشاف الأخطاء

### إذا فشل إنشاء patch:
```bash
# تنظيف وإعادة المحاولة
flutter clean
flutter pub get
shorebird patch android --flavor prod
```

### إذا فشل رفع patch:
```bash
# فحص الاتصال
shorebird doctor
# إعادة تسجيل الدخول
shorebird logout
shorebird login
```

## مثال سريع للتحديث

```bash
# 1. أجرِ تغييرات في الكود
# 2. أنشئ patch
shorebird patch android --flavor prod

# 3. ارفع patch
shorebird release android --flavor prod

# 4. تحقق من النتيجة
shorebird releases list
```

## المزايا

- ✅ **سرعة**: تحديث فوري بدون انتظار
- ✅ **حجم صغير**: patches أصغر بكثير من APK كامل
- ✅ **سهولة**: أوامر بسيطة
- ✅ **أمان**: تحديثات آمنة ومُتحكم بها

## النتيجة النهائية

بعد رفع patch، سيتم تحديث التطبيق تلقائياً لجميع المستخدمين عند فتح التطبيق مرة أخرى، بدون الحاجة لرفع نسخة جديدة من التطبيق! 