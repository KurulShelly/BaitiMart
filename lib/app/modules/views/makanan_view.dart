import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/data/CartItem.dart';
import '../controllers/makanan_controller.dart';
import '../controllers/cart_controller.dart';
import '../controllers/favorites_controller.dart'; // Import FavoritesController
import '../../data/favorite_item.dart'; // Import FavoriteItem model

class MakananView extends GetView<MakananController> {
  const MakananView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final FavoritesController favoritesController = Get.find<FavoritesController>();
    final MakananController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Makanan & Minuman',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Get.toNamed('/favorites'); // Navigate to Favorites page
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Get.toNamed('/cart'); // Navigate to Cart page
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
              "Temukan Produk Makanan Favorit Anda!",
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
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    final product = controller.productList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                                  child: Image.asset(
                                    product['image']!, // Ensure this key exists in your product model
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      // Add the product to favorites
                                      favoritesController.addFavorite(
                                        FavoriteItem(
                                          name: product['name']!,
                                          price: product['price']!,
                                          image: product['image']!,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
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
                                  'Rp ${product['price']}',
                                  style: const TextStyle(color: Colors.green),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Use the correct CartItem model here
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
                                  child: const Text('add to cart', style: TextStyle(fontSize: 12)),
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
              Get.toNamed('/home'); // Navigate to Home page
              break;
            case 1:
              Get.toNamed('/promo'); // Navigate to Promo page
              break;
            case 2:
              Get.toNamed('/activity'); // Navigate to Activity page
              break;
            case 3:
              Get.toNamed('/accounts'); // Navigate to Account page
              break;
          }
        },
      ),
    );
  }
}
