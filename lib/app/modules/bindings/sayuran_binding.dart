// lib/app/modules/bindings/sayuran_binding.dart
import 'package:get/get.dart';
import '../controllers/sayuran_controller.dart';

class SayuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SayuranController>(() => SayuranController());
  }
}
