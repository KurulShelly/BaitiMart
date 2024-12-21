import 'package:get/get.dart';
import '../controllers/Cod_controller.dart';

class CodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodController>(() => CodController());
  }
}
