import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/app/data/CartItem.dart';

class CartController extends GetxController {
  var items = <CartItem>[].obs;  // Daftar item keranjang
  var total = 0.obs;  // Total harga
  
  // Fungsi untuk menghitung total
  void calculateTotal() {
    total.value = items.fold<double>(0.0, (sum, item) {
      return sum + (item.price * item.quantity);
    }).toInt();  // Mengonversi hasil ke int
  }

  // Fungsi untuk menambah item ke keranjang
  void addItem(CartItem item) {
    items.add(item);
    calculateTotal();
  }

  // Fungsi untuk menghapus item dari keranjang
  void removeItem(CartItem item) {
    items.remove(item);
    calculateTotal();
  }

  // Fungsi untuk menyimpan data ke Firestore
  Future<void> saveCartToFirestore(String address, double totalAmount, double deliveryAddress) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Mengonversi daftar items menjadi format yang diterima Firestore
    List<Map<String, dynamic>> cartItems = items.map((item) => item.toMap()).toList();

    // Menyimpan data ke koleksi "orders" di Firestore
    try {
      await firestore.collection('orders').add({
        'address': address,
        'cartItems': cartItems,
        'totalAmount': total.value,  // Gunakan total.value dari controller
        'createdAt': FieldValue.serverTimestamp(),
      });
      print('Pesanan berhasil disimpan ke Firebase');
    } catch (e) {
      print('Terjadi kesalahan saat menyimpan pesanan: $e');
    }
  }
}
