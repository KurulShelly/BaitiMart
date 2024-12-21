// lib/app/modules/views/sembako_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/data/CartItem.dart';
import '../controllers/sembako_controller.dart';
import '../controllers/cart_controller.dart';
import '../controllers/favorites_controller.dart'; // Import FavoritesController
import '../../data/favorite_item.dart'; // Import FavoriteItem

class SembakoView extends GetView<SembakoController> {
  const SembakoView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final FavoritesController favoritesController = Get.find<FavoritesController>(); // Ambil instance FavoritesController
    SembakoController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sembako', style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Get.toNamed('/favorites'); // Navigasi ke halaman favorit
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Get.toNamed('/cart'); // Navigasi ke halaman Keranjang
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
              "Temukan Produk Sembako Favorit Anda!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Cari",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: controller.sembakoList.length,
                  itemBuilder: (context, index) {
                    final product = controller.sembakoList[index];
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
                                product['image']!,
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
                                  product['name']!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product['price']!,
                                  style: const TextStyle(color: Colors.green),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Menambahkan item ke keranjang
                                        cartController.addItem(
                                      CartItem(
                                        name: product['name']!,
                                        price: double.parse(product['price']!.replaceAll('Rp ', '').replaceAll('.', '')),
                                        quantity: 1, // Default quantity to 1
                                      ),
                                        );
                                        Get.snackbar('Sukses', '${product['name']} telah ditambahkan ke keranjang');
                                      },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                      child: const Text('add to cart'),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.favorite_border),
                                      onPressed: () {
                                        // Menambahkan item ke favorit
                                        favoritesController.addFavorite(
                                          FavoriteItem(
                                            name: product['name']!,
                                            price: product['price']!,
                                            image: product['image']!,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promo'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Aktivitas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed('/home'); // Navigasi ke halaman Home
              break;
            case 1:
              Get.toNamed('/promo'); // Navigasi ke halaman Promo
              break;
            case 2:
              Get.toNamed('/activity'); // Navigasi ke halaman Aktivitas
              break;
            case 3:
              Get.toNamed('/accounts'); // Navigasi ke halaman Akun
              break;
          }
        },
      ),
    );
  }
}
