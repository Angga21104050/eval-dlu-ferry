import 'package:get/get.dart';

class OrderTicketController extends GetxController {
  // Properti untuk menyimpan gender yang dipilih
  var gender = 'Laki Laki'.obs;

  // Fungsi untuk memperbarui gender saat pengguna memilih opsi
  void updateGender(String value) {
    gender.value = value;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
