# دليل إعداد Firebase App Distribution

## المشكلة الحالية
❌ No access to project 244051247756

## الحلول

### 1. فحص تسجيل الدخول الحالي
```bash
# فحص الحساب الحالي
firebase projects:list
```

### 2. إعادة تسجيل الدخول
```bash
# تسجيل الخروج
firebase logout

# تسجيل الدخول مرة أخرى
firebase login
```

### 3. فحص المشاريع المتاحة
```bash
# عرض جميع المشاريع
firebase projects:list
```

### 4. إذا لم يظهر المشروع، تحقق من:
- أنك تستخدم الحساب الصحيح
- أن لديك صلاحيات في المشروع
- أن معرف المشروع صحيح

### 5. الحصول على معرف المشروع الصحيح
```bash
# في مجلد المشروع
firebase use --add
```

### 6. تحديث معرف المشروع في Fastfile
إذا كان معرف المشروع مختلف، قم بتحديثه في:
- `android/fastlane/Fastfile`
- `android/fastlane/simple_firebase.rb`

### 7. فحص صلاحيات المشروع
```bash
# فحص الصلاحيات
firebase projects:list --filter projectId:244051247756
```

### 8. إذا كنت تستخدم حساب مختلف
```bash
# تسجيل الدخول بحساب مختلف
firebase logout
firebase login --reauth
```

## خطوات التشخيص

1. **فحص الحساب الحالي**:
   ```bash
   firebase projects:list
   ```

2. **إذا لم يظهر المشروع**:
   ```bash
   firebase logout
   firebase login
   ```

3. **فحص المشروع مرة أخرى**:
   ```bash
   firebase projects:list --filter projectId:244051247756
   ```

4. **إذا نجح، جرب Fastlane**:
   ```bash
   fastlane android check_firebase
   ```

## ملاحظات مهمة

- تأكد من أنك تستخدم الحساب الصحيح الذي له صلاحيات في المشروع
- قد تحتاج إلى طلب صلاحيات من مالك المشروع
- تأكد من أن معرف المشروع صحيح 