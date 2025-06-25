# حل مشاكل Cubit و Provider في Flutter

## المشاكل الشائعة وحلولها

### 1. مشكلة "Provider not found"
**الخطأ:** `Provider not found for type X`

**الحل:**
- تأكد من أن `BlocProvider` موجود في شجرة الـ Widget
- تأكد من أن النوع صحيح في `BlocProvider<T>`
- تأكد من أن الـ Cubit مُسجل في GetIt بشكل صحيح

### 2. مشكلة "Multiple BlocProvider"
**الخطأ:** `Multiple BlocProvider found for type X`

**الحل:**
- تأكد من عدم وجود `BlocProvider` مكرر لنفس النوع
- استخدم `BlocProvider.value` إذا كنت تريد مشاركة نفس الـ instance

### 3. مشكلة "State not updating"
**الخطأ:** الـ UI لا يتحدث عند تغيير الـ state

**الحل:**
- تأكد من استخدام `BlocBuilder` أو `BlocListener` بشكل صحيح
- تأكد من أن الـ `emit` يتم استدعاؤه بشكل صحيح
- تحقق من الـ `BlocObserver` للأخطاء

### 4. مشكلة "GetIt not initialized"
**الخطأ:** `GetIt not initialized`

**الحل:**
- تأكد من استدعاء `setupGetit()` قبل `runApp()`
- تأكد من أن جميع الـ dependencies مُسجلة بشكل صحيح

## خطوات التشخيص

### 1. تفعيل الـ Debug Mode
```dart
// في main.dart
Bloc.observer = BlocObserverService();
```

### 2. التحقق من الـ Dependencies
```dart
// في أي مكان في التطبيق
CubitValidator.validateCubitSetup();
```

### 3. مراقبة الـ State Changes
```dart
// في الـ Widget
BlocBuilder<MyCubit, MyState>(
  builder: (context, state) {
    CubitValidator.logCubitState(context, context.read<MyCubit>());
    return YourWidget();
  },
)
```

## أفضل الممارسات

### 1. تنظيم الـ Providers
```dart
MultiBlocProvider(
  providers: [
    BlocProvider<CartCubit>(create: (_) => CartCubit()),
    BlocProvider<AuthCubit>(create: (_) => AuthCubit(getIt.get<AuthRepo>())),
  ],
  child: MyApp(),
)
```

### 2. استخدام GetIt بشكل صحيح
```dart
// تسجيل الـ dependencies
getIt.registerSingleton<MyRepository>(MyRepositoryImpl());

// استخدام الـ dependencies
final repo = getIt.get<MyRepository>();
```

### 3. التعامل مع الأخطاء
```dart
class MyCubit extends Cubit<MyState> {
  Future<void> myMethod() async {
    try {
      emit(MyLoadingState());
      final result = await repository.getData();
      emit(MySuccessState(result));
    } catch (e) {
      emit(MyErrorState(e.toString()));
    }
  }
}
```

## أوامر مفيدة للتشخيص

```bash
# تنظيف وإعادة بناء المشروع
flutter clean
flutter pub get
flutter run

# تشغيل مع verbose logging
flutter run --verbose

# فحص الـ dependencies
flutter pub deps
```

## روابط مفيدة
- [Flutter Bloc Documentation](https://bloclibrary.dev/)
- [GetIt Documentation](https://pub.dev/packages/get_it)
- [Stack Overflow - Flutter Bloc](https://stackoverflow.com/questions/tagged/flutter-bloc) 