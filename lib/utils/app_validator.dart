class AppValidator {
  AppValidator._();


  static String? validateEmpty(String? value){
    if (value == null || value.trim().isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  static String? validateEmail (String? value){


    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value == null || value.isEmpty) {
      return "Please enter your mail";
    }

    return emailRegex.hasMatch(value) ?  null :  "Email is not correct";
  }

  static String? validatePassword(String? value) {

    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }

    return null;
  }

  static String? validateConfirmPassword (String? value, String? password){
    if (value == null || value.isEmpty) {
      return "Please enter your password again";
    } else {
      if (value != password) {
        return "Confirm password not match";
      }
    }

    return null;
  }

}