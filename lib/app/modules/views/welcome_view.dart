import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/vegetables.jpg', // Pastikan path gambar sesuai
              fit: BoxFit.cover,
            ),
          ),
          // Overlay Container for text and button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFFF8E2C4).withOpacity(0.7), // Semi-transparent background for readability
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to Baiti Mart',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(188, 30, 101, 35),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Belanja hemat dan nyaman di Baiti Mart Lengkap untuk sehari-hari.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 36, 141, 22),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  // Row to align the button to the right
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: controller.navigateToHome, // Navigasi ke halaman Home
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(188, 30, 101, 35),
                        minimumSize: const Size(150, 50), // Adjust size if needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Membuat sudut tombol melengkung
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Menambahkan padding
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255), // Teks tombol putih
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
