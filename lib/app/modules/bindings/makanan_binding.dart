// lib/app/modules/bindings/makanan_binding.dart
import 'package:get/get.dart';
import '../controllers/makanan_controller.dart';

class MakananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MakananController>(() => MakananController());
  }
}
