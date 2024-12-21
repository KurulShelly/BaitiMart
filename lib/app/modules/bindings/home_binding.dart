// lib/app/modules/bindings/home_binding.dart
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/favorites_controller.dart'; // Import the FavoritesController

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoritesController>(() => FavoritesController()); // Add this line
  }
}
