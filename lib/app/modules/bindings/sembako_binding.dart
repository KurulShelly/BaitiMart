// lib/app/modules/bindings/sembako_binding.dart
import 'package:get/get.dart';
import '../controllers/sembako_controller.dart';

class SembakoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SembakoController>(() => SembakoController());
  }
}
