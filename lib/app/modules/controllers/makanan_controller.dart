// lib/app/modules/controllers/makanan_controller.dart
import 'package:get/get.dart';

class MakananController extends GetxController {
  var productList = [
    {'name': 'Galon', 'price': 'Rp 20.000', 'image': 'assets/images/galon.jpg'},
    {'name': 'Aqua', 'price': 'Rp 15.000', 'image': 'assets/images/aqua.jpg'},
    {'name': 'Potato', 'price': 'Rp 25.000', 'image': 'assets/images/snack.jpg'},
    {'name': 'Air Cup', 'price': 'Rp 18.000', 'image': 'assets/images/gelas.jpg'},
    {'name': 'Sponge', 'price': 'Rp 30.000', 'image': 'assets/images/sponge.jpg'},
    {'name': 'Cleo', 'price': 'Rp 22.000', 'image': 'assets/images/cleo.jpg'},
  ].obs;
}
