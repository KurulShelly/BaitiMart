import 'package:get/get.dart';

class CodController extends GetxController {
  // You can add any additional properties or methods here as needed
  String deliveryAddress = '';
  List cartItems = [];
  double totalAmount = 0.0;

  void setDeliveryAddress(String address) {
    deliveryAddress = address;
  }

  void setCartItems(List items) {
    cartItems = items;
  }

  void setTotalAmount(double amount) {
    totalAmount = amount;
  }

  // Example method to calculate total, if needed
  void calculateTotal() {
    totalAmount = cartItems.fold(0, (sum, item) => sum + item['price']);
  }
}
