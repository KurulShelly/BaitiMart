import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/accounts_controller.dart';

class AccountsView extends GetView<AccountsController> {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Agar konten bisa di-scroll
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto Profil
            Center(
              child: GestureDetector(
                onTap: () {
                  // Logika untuk mengganti foto profil
                },
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Username
            const Text('Username', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(
              controller: controller.usernameController,
              decoration: const InputDecoration(
                hintText: 'Enter your username',
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Nama Lengkap
            const Text('Full Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your full name',
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Email
            const Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // No.Telepon
            const Text('Phone Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(
              controller: controller.phoneController,
              decoration: const InputDecoration(
                hintText: 'Enter your phone number',
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Alamat Pengiriman
            const Text('Shipping Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(
              controller: controller.addressController,
              decoration: const InputDecoration(
                hintText: 'Enter your shipping address',
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // Membuat alamat bisa lebih panjang
            ),
            const SizedBox(height: 20),

            // Tombol untuk menyimpan
            ElevatedButton(
              onPressed: () {
                // Simpan alamat dan data lainnya
                controller.saveAddress();
                Get.snackbar('Success', 'Your address has been saved');
              },
              child: const Text('Save Address'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
