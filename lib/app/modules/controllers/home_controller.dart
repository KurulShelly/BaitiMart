// lib/app/modules/controllers/home_controller.dart
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Variabel untuk menyimpan data atau status
  var counter = 0.obs;

  // Method untuk menambah counter
  void increment() {
    counter++;
  }
}
