# استكشاف أخطاء Firebase App Distribution

## المشاكل الحالية
1. خطأ "execution expired" عند رفع ملف APK
2. خطأ "stack level too deep" (SystemStackError) في Ruby
3. خطأ "APK file not found" - تم حلها ✅

## الحلول المقترحة

### 1. فحص وجود ملف APK
```bash
# فحص وجود ملف APK
fastlane check_apk
```

### 2. حل مشكلة Stack Overflow
```bash
# تشغيل النسخة المبسطة
fastlane simple_firebase
```

### 3. فحص Firebase CLI
```bash
# فحص حالة Firebase CLI
fastlane android check_firebase
```

### 4. فحص Firebase CLI الأساسي
```bash
# فحص أساسي بدون معرف مشروع
fastlane basic_check
```

### 5. تحديث Firebase CLI Token
إذا كان الـ token منتهي الصلاحية:

```bash
# إعادة تسجيل الدخول
firebase logout
firebase login

# الحصول على token جديد
firebase login:ci --no-localhost
```

### 6. فحص الاتصال بالإنترنت
```bash
# اختبار الاتصال بـ Firebase
ping firebase.google.com
```

### 7. فحص حجم ملف APK
```bash
# فحص حجم الملف
ls -lh build/app/outputs/flutter-apk/app-prod-release.apk
```

### 8. تنظيف وإعادة البناء
```bash
# تنظيف المشروع
flutter clean
flutter pub get

# إعادة البناء
flutter build apk --release -t lib/main_prod.dart --flavor prod --no-tree-shake-icons
```

## الأوامر المفيدة

### فحص ملف APK
```bash
fastlane check_apk
```

### النسخة المبسطة (بدون فحوصات معقدة)
```bash
fastlane simple_firebase
```

### فحص Firebase CLI فقط
```bash
fastlane android check_firebase
```

### فحص Firebase CLI الأساسي
```bash
fastlane basic_check
```

### رفع APK مع فحص شامل
```bash
fastlane android firebase_distribution
```

### فحص الـ plugins المطلوبة
```bash
fastlane add_plugin firebase_app_distribution
```

## نصائح إضافية

1. **تأكد من وجود ملف APK**: تحقق من وجود الملف في المسار الصحيح `build/app/outputs/flutter-apk/app-prod-release.apk`
2. **فحص الصلاحيات**: تأكد من أن لديك صلاحيات كافية في مشروع Firebase
3. **استخدام VPN**: إذا كان هناك مشاكل في الاتصال، جرب استخدام VPN
4. **تحديث Fastlane**: تأكد من تحديث Fastlane إلى أحدث إصدار
5. **تجنب الاستدعاءات المتداخلة**: لا تستدعي نفس الدالة من داخلها

## رسائل الخطأ الشائعة

- `APK file not found`: تم حلها ✅ - المسار الآن صحيح
- `execution expired`: مشكلة في الاتصال أو حجم الملف كبير
- `stack level too deep`: استدعاء متداخل للدوال
- `token expired`: انتهاء صلاحية Firebase CLI token
- `permission denied`: عدم وجود صلاحيات كافية
- `No access to project`: عدم وجود صلاحيات في المشروع

## خطوات التشخيص

1. **فحص وجود ملف APK**:
   ```bash
   fastlane check_apk
   ```

2. **فحص Firebase CLI الأساسي**:
   ```bash
   fastlane basic_check
   ```

3. **جرب النسخة المبسطة**:
   ```bash
   fastlane simple_firebase
   ```

4. **إذا نجح، استخدم النسخة الكاملة**:
   ```bash
   fastlane android firebase_distribution
   ```

5. **إذا فشل، افحص Firebase CLI**:
   ```bash
   fastlane android check_firebase
   ```

6. **إذا كان هناك مشكلة في الـ token**:
   ```bash
   firebase logout
   firebase login
   firebase login:ci --no-localhost
   ``` 