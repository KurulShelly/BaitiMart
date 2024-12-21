import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart'; // Import FavoritesController

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil instance FavoritesController
    final FavoritesController favoritesController = Get.find<FavoritesController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorit', style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.green,
      ),
      body: Obx(() {
        // Menggunakan favoritesController untuk mengakses item favorit
        if (favoritesController.favoriteItems.isEmpty) {
          return const Center(child: Text('Tidak ada item favorit. Tambahkan beberapa!'));
        }

        return ListView.builder(
          itemCount: favoritesController.favoriteItems.length,
          itemBuilder: (context, index) {
            final item = favoritesController.favoriteItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(item.name),
                subtitle: Text(item.price.toString()),
                leading: Image.asset(item.image),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    favoritesController.removeFavorite(item); // Menghapus item dari favorit
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
