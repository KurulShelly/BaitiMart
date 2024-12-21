import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Back, KURKUR',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Get.toNamed(AppRoutes.favorites); // Navigate to Favorites page
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Get.toNamed(AppRoutes.cart); // Navigate to Cart page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Find the Products You Desire!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Search for products...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: PageView(
                children: [
                  Image.asset('assets/images/banner1.png', fit: BoxFit.cover),
                  Image.asset('assets/images/banner2.png', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8.0,
              children: [
                const Chip(label: Text("Best Seller")),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.makanan),
                  child: const Chip(label: Text("Makanan")),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.sembako),
                  child: const Chip(label: Text("Sembako")),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.sayuran),
                  child: const Chip(label: Text("Sayur")),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: 4, // Hardcoded for now, replace with dynamic data
                itemBuilder: (context, index) {
                  String imagePath;
                  String productName;

                  // Mengatur gambar dan nama produk sesuai dengan indeks
                  switch (index) {
                    case 0:
                      imagePath = 'assets/images/galon.jpg';
                      productName = 'Galon';
                      break;
                    case 1:
                      imagePath = 'assets/images/cabe.png';
                      productName = 'Cabe';
                      break;
                    case 2:
                      imagePath = 'assets/images/sponge.jpg';
                      productName = 'Sponge';
                      break;
                    case 3:
                      imagePath = 'assets/images/beras.png';
                      productName = 'Beras';
                      break;
                    default:
                      imagePath = 'assets/images/minyak.png';
                      productName = 'Minyak';
                  }

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                            child: Image.asset(
                              imagePath, // Menampilkan gambar sesuai dengan path yang telah ditentukan
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productName, // Menampilkan nama produk sesuai dengan indeks
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "More",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promo'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Accounts'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(AppRoutes.home); // Navigate to Home
              break;
            case 1:
              Get.toNamed(AppRoutes.promo); // Ensure promo page exists
              break;
            case 2:
              Get.toNamed(AppRoutes.activity); // Navigate to Activity page
              break;
            case 3:
              Get.toNamed(AppRoutes.accounts); // Ensure accounts page exists
              break;
          }
        },
      ),
    );
  }
}
