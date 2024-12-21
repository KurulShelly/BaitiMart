import 'package:get/get.dart';
import '../controllers/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy loading controller CheckoutController
    Get.lazyPut<CheckoutController>(() => CheckoutController());
  }
}
