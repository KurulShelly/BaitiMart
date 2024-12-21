import 'package:get/get.dart';

class SignUpController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  bool isFormValid() {
    return email.isNotEmpty && password.isNotEmpty && password.value == confirmPassword.value;
  }
}
