class AppValidator {
  AppValidator._();


  static String? validateEmpty(String? value, String validFieldEmpty){
    if (value == null || value.trim().isEmpty) {
      return validFieldEmpty;
    }
    return null;
  }

  static String? validateEmail (String? value, String validEmailRequired, String validEmailFormat){


    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value == null || value.isEmpty) {
      return validEmailRequired;
    }

    return emailRegex.hasMatch(value) ?  null :  validEmailFormat;
  }

  static String? validatePassword(String? value, String validPasswordEnter) {

    if (value == null || value.isEmpty) {
      return validPasswordEnter;
    }

    return null;
  }

  static String? validateConfirmPassword (String? value, String? password, String validConfirmPasswordEnter, String validConfirmPasswordMismatch){
    if (value == null || value.isEmpty) {
      return validConfirmPasswordEnter ;
    } else {
      if (value != password) {
        return validConfirmPasswordMismatch;
      }
      }
    return null;
    }


}