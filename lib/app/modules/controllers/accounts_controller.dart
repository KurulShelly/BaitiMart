import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountsController extends GetxController {
  // Controller untuk inputan teks
  var usernameController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController(); // Alamat pengiriman

  // Rx variable untuk menyimpan alamat
  var address = ''.obs;

  // Fungsi untuk menyimpan alamat
  void saveAddress() {
    final newAddress = addressController.text;
    if (newAddress.isNotEmpty) {
      address.value = newAddress; // Update alamat di Rx
      Get.snackbar('Success', 'Alamat pengiriman berhasil disimpan');
    } else {
      Get.snackbar('Error', 'Alamat tidak boleh kosong');
    }
  }
}
