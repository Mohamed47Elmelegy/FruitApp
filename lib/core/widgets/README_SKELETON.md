# Skeleton Widget المخصص

تم إنشاء widget skeleton مخصص بدون استخدام مكتبات خارجية لتحل محل مكتبة `skeletonizer`.

## المميزات

- تأثير shimmer متحرك
- قابل للتخصيص (الألوان، المدة، إلخ)
- دعم للـ Sliver widgets
- أداء محسن
- بدون dependencies خارجية

## الاستخدام

### SkeletonWidget الأساسي

```dart
SkeletonWidget(
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
  duration: Duration(milliseconds: 1500),
  enabled: true,
  child: YourWidget(),
)
```

### SkeletonSliver للـ Sliver widgets

```dart
SkeletonSliver(
  baseColor: AppColors.grayscale50,
  highlightColor: AppColors.grayscale50.withValues(alpha: 0.3),
  enabled: true,
  child: YourSliverWidget(),
)
```

## المعاملات

- `child`: الـ widget المراد تطبيق تأثير skeleton عليه
- `baseColor`: اللون الأساسي للـ skeleton (افتراضي: Colors.grey[300])
- `highlightColor`: لون التأثير المضيء (افتراضي: Colors.grey[100])
- `duration`: مدة دورة التأثير (افتراضي: 1500ms)
- `enabled`: تفعيل/إلغاء تفعيل التأثير (افتراضي: true)

## مثال عملي

```dart
BlocBuilder<ProductsCubit, ProductsState>(
  builder: (context, state) {
    if (state is ProductsSuccess) {
      return ProductsGridView(products: state.products);
    } else if (state is ProductsFailure) {
      return CustomErrorWidget(text: state.errMessage);
    } else {
      return SkeletonSliver(
        baseColor: AppColors.grayscale50,
        highlightColor: AppColors.grayscale50.withValues(alpha: 0.3),
        enabled: true,
        child: ProductsGridView(products: getDummyProducts()),
      );
    }
  },
)
```

## التحديثات

تم استبدال:
- `Skeletonizer.sliver()` بـ `SkeletonSliver()`
- `Skeletonizer.zone()` بـ `SkeletonWidget()`
- `containersColor` بـ `baseColor` و `highlightColor` 