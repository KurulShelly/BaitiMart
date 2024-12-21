import 'package:get/get.dart';

class CheckoutController extends GetxController {
  var deliveryAddress = ''.obs;
  var cartItems = <Map<String, dynamic>>[].obs;
  var totalAmount = 0.0.obs;

  // Update data checkout
  void updateDeliveryAddress(String address) {
    deliveryAddress.value = address;
  }

  void updateCartItems(List<Map<String, dynamic>> items) {
    cartItems.value = items;
  }

  void updateTotalAmount(double amount) {
    totalAmount.value = amount;
  }

  // Method to perform checkout logic (such as calling an API, etc.)
  void checkout() {
    // Logika checkout bisa ditempatkan di sini (misalnya simpan ke database atau API)
    print("Checkout berhasil: ${deliveryAddress.value}");
    // Menggunakan snackbar untuk konfirmasi
    Get.snackbar('Checkout', 'Pesanan berhasil dilakukan');
  }
}
