# Order Tracking Architecture - Clean Architecture Implementation

## نظرة عامة

تم إعادة هيكلة نظام تتبع الطلبات وفقاً لمبادئ Clean Architecture مع فصل الطلبات النشطة وغير النشطة إلى صفحات منفصلة.

## البنية الجديدة

### 1. Domain Layer (الطبقة الأساسية)

#### Entities
- `OrderTrackingEntity`: الكيان الرئيسي لتتبع الطلب
- `OrderTrackingStep`: كيان خطوة التتبع مع الألوان والأيقونات
- `OrderStatusInfo`: معلومات حالة الطلب مع الألوان والأيقونات
- `OrderStatus`: Enum لحالات الطلب المختلفة

#### Repository Interface
- `OrderTrackingRepository`: واجهة للوصول للبيانات

#### Use Cases
- `GetActiveOrdersUseCase`: الحصول على الطلبات النشطة
- `GetInactiveOrdersUseCase`: الحصول على الطلبات غير النشطة
- `GetOrderTrackingDetailsUseCase`: الحصول على تفاصيل تتبع الطلب

### 2. Data Layer (طبقة البيانات)

#### Models
- `OrderTrackingModel`: نموذج البيانات مع تحويل البيانات

#### Repository Implementation
- `OrderTrackingRepositoryImpl`: تنفيذ الوصول للبيانات

### 3. Presentation Layer (طبقة العرض)

#### Cubits
- `ActiveOrdersCubit`: إدارة حالة الطلبات النشطة
- `InactiveOrdersCubit`: إدارة حالة الطلبات غير النشطة

#### Views
- `OrdersTabsView`: الصفحة الرئيسية مع تبويبات
- `ActiveOrdersView`: صفحة الطلبات النشطة
- `InactiveOrdersView`: صفحة الطلبات غير النشطة

#### Widgets
- `ActiveOrdersViewBody`: عرض الطلبات النشطة
- `InactiveOrdersViewBody`: عرض الطلبات غير النشطة
- `OrderTrackingTimeline`: خط زمني محسن لتتبع الطلب

## حالات الطلب والألوان

### الطلبات النشطة
- **قيد المراجعة (Pending)**: برتقالي 🟠
- **تم قبول الطلب (Approved)**: أزرق 🔵
- **قيد التجهيز (Preparing)**: بنفسجي 🟣
- **خرج للتوصيل (Shipping)**: أخضر 🟢

### الطلبات غير النشطة
- **تم التسليم (Delivered)**: أخضر 🟢
- **تم الإلغاء (Cancelled)**: أحمر 🔴

## المميزات الجديدة

1. **فصل الطلبات**: طلبات نشطة ومنفصلة عن المكتملة
2. **ألوان ديناميكية**: كل حالة لها لون وأيقونة مميزة
3. **خط زمني محسن**: عرض أفضل لمراحل التتبع
4. **تبويبات**: واجهة مستخدم محسنة مع تبويبات
5. **إدارة حالة محسنة**: استخدام Cubit للتحكم في الحالة
6. **تحديث البيانات**: إمكانية تحديث حالة الطلب

## كيفية الاستخدام

### إضافة طلب جديد
```dart
final orderTracking = OrderTrackingEntity(
  orderId: 'order123',
  trackingNumber: 'TRK240112345',
  status: 'pending',
  createdAt: DateTime.now().toIso8601String(),
  steps: [], // سيتم إنشاؤها تلقائياً
  statusInfo: OrderStatusInfo.fromStatus('pending'),
);
```

### عرض الطلبات النشطة
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ActiveOrdersView(userId: currentUserId),
  ),
);
```

### عرض الطلبات المكتملة
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => InactiveOrdersView(userId: currentUserId),
  ),
);
```

### عرض جميع الطلبات مع تبويبات
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => OrdersTabsView(userId: currentUserId),
  ),
);
```

## التحديثات المطلوبة

1. **إضافة Dependencies**: تأكد من تسجيل جميع الـ dependencies في GetIt
2. **تحديث Routes**: إضافة المسارات الجديدة
3. **اختبار الوظائف**: التأكد من عمل جميع الوظائف الجديدة
4. **تحديث UI**: تطبيق التصميم الجديد على باقي التطبيق

## ملاحظات مهمة

- تم الحفاظ على التوافق مع الكود القديم
- يمكن إضافة المزيد من حالات الطلب بسهولة
- الألوان والأيقونات قابلة للتخصيص
- البنية تتبع مبادئ Clean Architecture بدقة 