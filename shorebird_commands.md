# أوامر Shorebird السريعة

## 🚀 التحديث التلقائي (بدون رفع نسخة جديدة)

### 1. إنشاء Patch للتحديث
```bash
shorebird patch android --flavor prod
```

### 2. رفع Patch للمستخدمين
```bash
shorebird release android --flavor prod
```

## 📋 أوامر مفيدة

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

## 🔄 مثال عملي للتحديث

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

## ⚡ أوامر سريعة

### تحديث سريع (خطوة واحدة):
```bash
# أنشئ patch وارفعه فوراً
shorebird patch android --flavor prod && shorebird release android --flavor prod
```

### تنظيف وإعادة المحاولة:
```bash
flutter clean && flutter pub get && shorebird patch android --flavor prod
```

## 📱 النتيجة

بعد رفع patch، سيتم تحديث التطبيق تلقائياً لجميع المستخدمين عند فتح التطبيق مرة أخرى، بدون الحاجة لرفع نسخة جديدة من التطبيق!

## 🎯 المزايا

- ✅ **سرعة**: تحديث فوري
- ✅ **حجم صغير**: patches أصغر من APK
- ✅ **سهولة**: أوامر بسيطة
- ✅ **أمان**: تحديثات آمنة 