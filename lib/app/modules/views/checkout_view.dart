import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan argumen dari halaman sebelumnya (contoh: CartView)
    final args = Get.arguments as Map<String, dynamic>?;
    final String deliveryAddress = args?['address'] ?? 'Tidak ada alamat';
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ikon Sukses
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 16),
            const Text(
              'Success',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mohon menunggu barang hingga diterima',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Alamat Pengiriman
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                deliveryAddress,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),

            // Tombol kembali ke beranda
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.home); // Navigasi ke beranda setelah checkout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Kembali ke Beranda', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
