# نظام تصنيف المنتجات

## نظرة عامة
تم إنشاء نظام تصنيف منظم للمنتجات يتكون من عدة مكونات منفصلة ومتخصصة.

## المكونات

### 1. SortOption Enum
**الموقع**: `lib/core/constants/sort_options.dart`
- يحتوي على خيارات التصنيف المتاحة
- يوفر extension للحصول على النص المعروض

### 2. SortService
**الموقع**: `lib/core/services/sort_service.dart`
- يحتوي على منطق التصنيف
- يقوم بترتيب المنتجات حسب الخيار المحدد

### 3. ProductsCubit (محدث)
**الموقع**: `lib/core/cubit/products_cubit.dart`
- تم إضافة وظيفة التصنيف
- يحتفظ بالمنتجات الأصلية ويطبق التصنيف عند الطلب

### 4. SortManager
**الموقع**: `lib/Features/Home/Products/presentation/manager/sort_manager.dart`
- يوفر واجهة موحدة للتعامل مع التصنيف
- يحتوي على الدوال المساعدة

### 5. SortOptionItem Widget
**الموقع**: `lib/Features/Home/Products/presentation/widgets/sort_option_item.dart`
- widget منفصل لعرض خيار التصنيف
- قابل لإعادة الاستخدام

### 6. FilterBottomSheet (محدث)
**الموقع**: `lib/Features/Home/Products/presentation/widgets/filter_bottom_Sheet.dart`
- يستخدم النظام الجديد
- يعرض خيارات التصنيف ويطبقها

## كيفية الاستخدام

```dart
// تطبيق التصنيف
SortManager.applySorting(context, SortOption.priceLowToHigh);

// الحصول على الخيار الافتراضي
SortOption defaultOption = SortManager.getDefaultSortOption();

// الحصول على جميع الخيارات
List<SortOption> allOptions = SortManager.getAllSortOptions();
```

## خيارات التصنيف المتاحة
1. **priceLowToHigh**: السعر (الأقل إلى الأعلى)
2. **priceHighToLow**: السعر (الأعلى إلى الأقل)
3. **alphabetical**: أبجدي

## المميزات
- ✅ كود منظم ومفصول
- ✅ قابل لإعادة الاستخدام
- ✅ سهل الصيانة والتطوير
- ✅ يتبع مبادئ Clean Architecture
- ✅ قابل للاختبار 