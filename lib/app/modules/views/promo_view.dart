import 'package:flutter/material.dart';

class PromoView extends StatelessWidget {
  const PromoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView( // Membungkus seluruh konten dengan SingleChildScrollView agar bisa digulir
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header untuk Promo
            const Text(
              'Hot Deals & Discounts!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Gambar Banner Promo
            SizedBox(
              height: 150,
              child: PageView(
                children: [
                  Image.asset('assets/images/pro3.png', fit: BoxFit.cover),
                  Image.asset('assets/images/promo2.png', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Promo List Section
            const Text(
              'Latest Promotions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // List of promo items
            PromoItem(
              title: '50% OFF on Select Items!',
              description: 'Get 50% off on selected products, limited time only.',
              imageUrl: 'assets/images/p1.png',
              onTap: () {
                // Handle promo details or redirection here
                print("Promo 50% tapped");
              },
            ),
            const SizedBox(height: 12), // Memberikan jarak antar promo item
            PromoItem(
              title: 'Buy 1 Get 1 Free',
              description: 'Buy one and get another free for selected products.',
              imageUrl: 'assets/images/p2.png',
              onTap: () {
                // Handle promo details or redirection here
                print("Buy 1 Get 1 tapped");
              },
            ),
            const SizedBox(height: 12), // Memberikan jarak antar promo item
            PromoItem(
              title: 'Free Delivery for Orders Above Rp 100.000',
              description: 'Enjoy free delivery for orders above Rp 100.000.',
              imageUrl: 'assets/images/p3.png',
              onTap: () {
                // Handle promo details or redirection here
                print("Free Delivery tapped");
              },
            ),

            const SizedBox(height: 20),

            // Button for more promos or offers
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle logic to show more offers or redirect to another page
                  print("Show more promos");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Show More Offers', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk menampilkan setiap item promo
class PromoItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  const PromoItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,  // Trigger action when tapping the promo item
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Image for promo item
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Promo item details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
