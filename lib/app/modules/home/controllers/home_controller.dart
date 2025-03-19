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

  // Variabel untuk menyimpan input pengguna
  // DateTime selectedDepartureDate = DateTime.now();
  // DateTime? selectedReturnDate;
  // bool isRoundTrip = false;
  // List<String> selectedTicketTypes = [];
  // String selectedPassengerClass = 'Semua Kelas';
  // String selectedVehicleClass = 'Semua Kelas';
  // String selectedVipRoomClass = 'Semua Kelas';

  // // Method untuk mengupdate tanggal keberangkatan
  // void updateDepartureDate(DateTime date) {
  //   selectedDepartureDate = date;
  //   update(); // Memberi tahu GetX bahwa ada perubahan
  // }

  // // Method untuk mengupdate tanggal pulang
  // void updateReturnDate(DateTime? date) {
  //   selectedReturnDate = date;
  //   update();
  // }

  // // Method untuk mengupdate status pulang pergi
  // void toggleRoundTrip(bool value) {
  //   isRoundTrip = value;
  //   if (!value) {
  //     selectedReturnDate = null;
  //   }
  //   update();
  // }

  // // Method untuk mengupdate jenis tiket yang dipilih
  // void updateTicketTypes(List<String> types) {
  //   selectedTicketTypes = types;
  //   update();
  // }

  // // Method untuk mengupdate kelas tiket sesuai jenisnya
  // void updatePassengerClass(String? value) {
  //   if (value != null) selectedPassengerClass = value;
  //   update();
  // }

  // void updateVehicleClass(String? value) {
  //   if (value != null) selectedVehicleClass = value;
  //   update();
  // }

  // void updateVipRoomClass(String? value) {
  //   if (value != null) selectedVipRoomClass = value;
  //   update();
  // }

  // // Method untuk menangani pencarian tiket
  // void searchTickets() {
  //   final ticketData = {
  //     'departureDate': selectedDepartureDate,
  //     'returnDate': isRoundTrip ? selectedReturnDate : null,
  //     'isRoundTrip': isRoundTrip,
  //     'selectedTicketTypes': selectedTicketTypes,
  //     'selectedPassengerClass':
  //         selectedTicketTypes.contains('Penumpang') ? selectedPassengerClass : null,
  //     'selectedVehicleClass':
  //         selectedTicketTypes.contains('Kendaraan') ? selectedVehicleClass : null,
  //     'selectedVipRoomClass':
  //         selectedTicketTypes.contains('Kamar VIP') ? selectedVipRoomClass : null,
  //   };

  //   // Debugging: Cek data yang dikirim
  //   print('Pencarian Tiket dengan Data: $ticketData');

  //   // Navigasi ke halaman hasil pencarian (bisa diganti dengan API call)
  //   Get.toNamed('/searchResults', arguments: ticketData);
  // }
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
