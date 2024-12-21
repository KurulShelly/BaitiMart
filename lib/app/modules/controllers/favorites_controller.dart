// lib/app/modules/controllers/favorites_controller.dart
import 'package:get/get.dart';
import '../../data/favorite_item.dart';

class FavoritesController extends GetxController {
  var favoriteItems = <FavoriteItem>[].obs;

  void addFavorite(FavoriteItem item) {
    // Cek apakah item sudah ada di favorit
    if (!favoriteItems.any((element) => element.name == item.name)) {
      favoriteItems.add(item);
      Get.snackbar('Success', '${item.name} added to favorites');
    } else {
      Get.snackbar('Info', '${item.name} is already in favorites');
    }
  }

  void removeFavorite(FavoriteItem item) {
    favoriteItems.remove(item);
    Get.snackbar('Removed', '${item.name} removed from favorites');
  }
}
