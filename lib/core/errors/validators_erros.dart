abstract class ValidatorsErrors {
  // فحص الاسم الكامل: إذا كان أقل من 32 كلمات
  static String? validateFullName(String? value) {
    // فحص إذا كان الحقل فارغًا
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال الاسم واللقب';
    }

    // إزالة المسافات الزائدة بين الكلمات
    String cleanedValue = value.trim().replaceAll(RegExp(r'\s+'), ' ');

    // فحص إذا كان الاسم أقل من كلمتين
    List<String> nameParts = cleanedValue.split(' ');
    if (nameParts.length < 2 || nameParts.length > 3) {
      return 'الاسم كامل يجب أن يحتوي على الاسم واللقب';
    }

    // فحص إذا كان الاسم يحتوي على رموز أو أرقام
    if (!RegExp(
      r'^[a-zA-Z\u0621-\u064A\u0660-\u0669\s]+$',
    ).hasMatch(cleanedValue)) {
      return 'الاسم كامل يجب أن يحتوي على الاسم واللقب فقط';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    RegExp emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email == null || email.isEmpty) {
      return 'برجاء ادخال البريد الالكتروني';
    } else if (!emailValid.hasMatch(email)) {
      return 'البريد الالكتروني يجب ان يكون صحيح';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    var regex = RegExp(
        r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.//n])(?=.*[A-Z])(?=.*[a-z]).*$");
    if (password == null || password.isEmpty) {
      return "برجاء ادخال كلمة المرور";
    } else if (!regex.hasMatch(password)) {
      return "كلمة المرور يجب ان تكون على الاقل 8 احرف و تحوي حروف كبيرة و صغيرة و ارقام و رموز خاصة.";
    }
    return null;
  }

  static String? validateTermsAndConditions(bool? value) {
    if (value == null || !value) {}
    return null;
  }
}
