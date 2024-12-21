import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_routes.dart';

class CodView extends StatelessWidget {
  const CodView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil argumen yang dikirim dari tampilan Activity
    final args = Get.arguments as Map<String, dynamic>?;
    final String deliveryAddress = args?['address'] ?? 'Alamat tidak tersedia'; // Alamat pengiriman
    final List cartItems = args?['cartItems'] ?? []; // Item keranjang
    final double totalAmount = args?['totalAmount'] ?? 0.0; // Total pembayaran

    return Scaffold(
      appBar: AppBar(
        title: const Text('COD', style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Metode Pembayaran
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'Pembayaran Cash Only',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Alamat Pengiriman
            const Text(
              'Alamat Pengiriman',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(deliveryAddress, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),

            // Menampilkan Produk
            Column(
              children: cartItems.map<Widget>((item) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text('Rp ${item['price']}', style: const TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            // Bagian Total Harga
            const SizedBox(height: 16),
            const Text('Total Pembayaran:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Rp $totalAmount', style: const TextStyle(color: Colors.green, fontSize: 16)),
            const Spacer(),

            // Tombol Check Out
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Checkout dengan mengirimkan data alamat, item, dan total pembayaran
                Get.toNamed(AppRoutes.checkout, arguments: {
                  'address': deliveryAddress,
                  'cartItems': cartItems,
                  'totalAmount': totalAmount,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Check Out', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
