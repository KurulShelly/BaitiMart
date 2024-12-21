// lib/app/modules/controllers/activity_controller.dart
import 'package:get/get.dart';

class ActivityController extends GetxController {
  // Contoh data untuk aktivitas, Anda bisa menyesuaikannya dengan data sebenarnya
  var activities = [].obs; // Awalnya kosong

  void addActivity(String activity) {
    activities.add(activity);
  }
}
