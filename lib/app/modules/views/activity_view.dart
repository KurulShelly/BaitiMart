import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil argumen yang diterima dari CartView
    final args = Get.arguments as Map<String, dynamic>?; 
    final String deliveryAddress = args?['address'] ?? 'Tidak ada alamat';
    final List cartItems = args?['cartItems'] ?? [];
    final double totalAmount = args?['totalAmount'] ?? 0.0;

    final ActivityController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Bagian Belanja Online dan Belanja di Toko
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Belanja Online',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Belanja di Toko',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol COD
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.cod, arguments: {
                          'address': deliveryAddress,
                          'cartItems': cartItems,
                          'totalAmount': totalAmount,
                        });
                      },
                      child: const Text(
                        'COD',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Jarak antara tombol
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Logika untuk Ambil di Toko
                      },
                      child: const Text(
                        'Ambil di Toko',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Menampilkan alamat pengiriman dan total belanja
            const Text('Alamat Pengiriman:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(deliveryAddress),
            const SizedBox(height: 10),
            const Text('Total Belanja:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Rp $totalAmount'),

            const SizedBox(height: 20),

            // Menampilkan Produk
            const Text('Detail Pesanan:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
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
                              Text('Rp ${item['price']} x ${item['quantity']}', style: const TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Tombol Start Shopping atau Activity List
            controller.activities.isEmpty 
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No activity', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Logika untuk memulai belanja
                        },
                        child: const Text('Start Shopping'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true, // Menggunakan shrinkWrap agar tidak memperbesar ukuran list
                  physics: NeverScrollableScrollPhysics(), // Menghindari scroll ganda
                  itemCount: controller.activities.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.activities[index]),
                    );
                  },
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promo'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Accounts'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(AppRoutes.home);
              break;
            case 1:
              Get.toNamed(AppRoutes.promo);
              break;
            case 2:
              // Sudah di halaman Activity
              break;
            case 3:
              Get.toNamed(AppRoutes.accounts);
              break;
          }
        },
      ),
    );
  }
}
