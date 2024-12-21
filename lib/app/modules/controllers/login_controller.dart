import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;  // Variabel observable
  var password = ''.obs;  // Variabel observable

  // Fungsi untuk menetapkan email
  void setEmail(String value) {
    email.value = value;
  }

  // Fungsi untuk menetapkan password
  void setPassword(String value) {
    password.value = value;
  }

  // Fungsi untuk memeriksa validitas form
  bool isFormValid() {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
