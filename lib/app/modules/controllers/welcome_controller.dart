import 'package:get/get.dart';
import 'package:myapp/app/routes/app_routes.dart';

class WelcomeController extends GetxController {
  // Fungsi untuk navigasi ke halaman Home setelah tombol Get Started diklik
  void navigateToHome() {
    Get.toNamed(AppRoutes.home);  // Navigasi ke halaman HomeView
  }
}
