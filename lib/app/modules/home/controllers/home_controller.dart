import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var selectedIndex = 0.obs; // Gunakan observable untuk menyimpan index aktif

  void changeIndex(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed('/home'); // Gunakan `offNamed` agar tidak menumpuk halaman
        break;
      case 1:
        Get.offNamed('/my-ticket');
        break;
      case 2:
        Get.offNamed('/history');
        break;
      case 3:
        Get.offNamed('/profile');
        break;
    }
  }

  final List<String> passengerClasses = [
    'Semua Kelas',
    'Kelas I',
    'Kelas II',
    'Kelas III',
    'Ekonomi',
    'Ekonomi Tidur',
    'Ekonomi Duduk',
    'Executive Seat',
    'Cabin',
    'Double Cabin',
    'Single Cabin',
    'Vip Suites',
    'Ekonomi - Non Seat',
  ];

  final List<String> vehicleClasses = [
    'Semua Kelas',
    'Sepeda Motor 2.A (s.d 249CC)',
    'Sepeda Motor 2.B (250CC s.d 1000CC / Roda 3)',
    'Sepeda Motor >1001CC',
    'Kend. Kecil 3.A (s.d 2000CC)',
    'Kend. Kecil 3.B (2001CC ke Atas)',
    'Kend. Kecil 3.C >3001CC',
    'Truk Sedang 4.A',
    'Truk Sedang 4.B',
    'Truk Sedang 4.C',
    'Truk Besar 5.A',
    'Truk Besar 5.B',
    'Truk Besar 5.C',
    'Alat Berat 7.AB',
  ];

  final List<String> vipRoomClasses = [
    'Semua Kelas',
    'VIP Suites (2 Kasur)',
    'VIP Room 1 (1 Kasur)',
    'VIP Room 2 (2 Kasur)',
  ];

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
}
