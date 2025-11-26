class AppValidator {
  AppValidator._();


  static String? validateEmpty(String? value){
    if (value == null || value.trim().isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  // static String? validate
}