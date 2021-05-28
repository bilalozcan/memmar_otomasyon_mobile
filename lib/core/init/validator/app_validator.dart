class AppValidator {
  static String? nameSurnameValidator(nameSurname) {
    if (nameSurname!.isEmpty) return 'Lütfen Ad Soyad Giriniz';
  }

  static String? emailValidator(email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regex = RegExp(pattern as String);
    if (email!.isEmpty) {
      return 'Lütfen Email Giriniz';
    } else if (!regex.hasMatch(email!)) {
      return 'Geçersiz Email';
    }
  }

  static String? phoneValidator(phone) {
    var regExp = RegExp('(05|5)[0-9][0-9][0-9]([0-9]){6,6}');
    if (phone!.isEmpty) {
      return 'Lütfen Telefon Numarası Giriniz';
    } else if (!regExp.hasMatch(phone)) {
      return 'Geçersiz Telefon Numarası';
    }
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Lütfen Şifre Giriniz';
    } else if (password.length < 8) {
      return 'Şifre en az 8 karakter olmalıdır';
    }
  }

}
