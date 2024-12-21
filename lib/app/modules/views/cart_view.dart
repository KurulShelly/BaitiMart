import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../../routes/app_routes.dart'; // Import AppRoutes

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(  // Membungkus body dengan SingleChildScrollView untuk membuat halaman bisa di-scroll
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan jika keranjang kosong
              Obx(() {
                if (controller.items.isEmpty) {
                  return const Center(
                    child: Text('Keranjang Anda kosong', style: TextStyle(fontSize: 20)),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,  // Mengatur agar listview tidak mengambil space lebih dari yang dibutuhkan
                    physics: const NeverScrollableScrollPhysics(),  // Agar ListView tidak mengganggu scroll utama
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      final item = controller.items[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Mengakses item.name, item.price, dan item.quantity secara langsung
                                  Text(item.name, style: const TextStyle(fontSize: 18)),
                                  Text('Rp ${item.price}', style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      if (item.quantity > 1) {
                                        item.quantity--;
                                        controller.calculateTotal();
                                      } else {
                                        controller.removeItem(item);
                                      }
                                    },
                                  ),
                                  Text('${item.quantity}'),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      item.quantity++;
                                      controller.calculateTotal();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
              const SizedBox(height: 16),

              // Menampilkan Total harga
              Obx(() {
                // Mengonversi total yang merupakan RxInt menjadi double
                double totalAmount = controller.total.toDouble();
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Total: Rp ${totalAmount.toStringAsFixed(2)}', // Menggunakan 2 digit desimal
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              }),
              const SizedBox(height: 16),

              // Tombol Checkout
              ElevatedButton(
                onPressed: () async {
                  // Ambil alamat pengiriman (misalnya dari form atau text input)
                  final String deliveryAddress = "Alamat Pengiriman"; // Ganti dengan alamat yang sesuai
                  final List cartItems = controller.items.map((item) => {
                    'name': item.name,
                    'price': item.price,
                    'quantity': item.quantity,
                  }).toList(); // Pastikan ini dalam bentuk List<Map<String, dynamic>>

                  final double totalAmount = controller.total.toDouble(); // Menggunakan toDouble()

                  // Simpan ke Firestore
                  await controller.saveCartToFirestore(cartItems as String, totalAmount, deliveryAddress as double);

                  // Navigasi ke halaman Activity dan kirimkan argumen
                  Get.toNamed(AppRoutes.activity, arguments: {
                    'address': deliveryAddress,
                    'cartItems': cartItems,
                    'totalAmount': totalAmount,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
