class CartItem {
  String name;
  double price; // Menggunakan double untuk harga
  int quantity; // Menggunakan int untuk jumlah

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });

  // Fungsi untuk mengubah CartItem menjadi Map untuk Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
