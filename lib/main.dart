import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart'; // Import AppRoutes untuk navigasi
import 'app/modules/bindings/home_binding.dart'; // Import HomeBinding
import 'app/modules/bindings/cart_binding.dart'; // Import CartBinding
import 'app/modules/controllers/makanan_controller.dart'; // Import MakananController
import 'app/modules/controllers/cart_controller.dart'; // Import CartController
import 'app/modules/controllers/favorites_controller.dart'; // Import FavoritesController

void main() {
  // Mendaftarkan semua controller dan binding
  Get.put(MakananController()); // Mendaftarkan MakananController
  Get.put(CartController()); // Mendaftarkan CartController
  Get.put(FavoritesController()); // Mendaftarkan FavoritesController

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BaitiMart - Belanja Online',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: AppRoutes.welcome, // Set WelcomePage sebagai halaman pertama
      getPages: AppRoutes.routes, // Menggunakan rute yang telah didefinisikan
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    );
  }
}
