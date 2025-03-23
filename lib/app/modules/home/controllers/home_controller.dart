import 'package:get/get.dart';
import '../../../data/list_tiket_dummy.dart';

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
    'Semua Kelas', // Tambahkan "Semua Kelas" sebagai opsi default
    ...dummyTicketTypes
        .firstWhere(
          (ticket) => ticket.type == 'Penumpang',
          orElse: () => Ticket(type: '', categories: []),
        )
        .categories
        .map((category) => category.categoryName),
  ];

  final List<String> vehicleClasses = [
    'Semua Kelas', // Tambahkan "Semua Kelas" sebagai opsi default
    ...dummyTicketTypes
        .firstWhere(
          (ticket) => ticket.type == 'Kendaraan',
          orElse: () => Ticket(type: '', categories: []),
        )
        .categories
        .map((category) => category.categoryName),
  ];

  final List<String> vipRoomClasses = [
    'Semua Kelas', // Tambahkan "Semua Kelas" sebagai opsi default
    ...dummyTicketTypes
        .firstWhere(
          (ticket) => ticket.type == 'Kamar VIP',
          orElse: () => Ticket(type: '', categories: []),
        )
        .categories
        .map((category) => category.categoryName),
  ];

  // Tambahkan variabel untuk menyimpan kota keberangkatan & tujuan
  var fromCity = ''.obs;
  var toCity = ''.obs;

  void setFromCity(String city) {
    fromCity.value = city;
  }

  void setToCity(String city) {
    toCity.value = city;
  }

  void swapCities() {
    var temp = fromCity.value;
    fromCity.value = toCity.value;
    toCity.value = temp;
  }

  // ✅ Tambahkan variabel untuk menyimpan hasil pencarian
  // RxList<Map<String, dynamic>> filteredTickets = <Map<String, dynamic>>[].obs;

  // // 🔍 Fungsi pencarian tiket
  // void searchTickets({
  //   required String departurePort,
  //   required String arrivalPort,
  //   required List<String> selectedTicketTypes,
  //   String? selectedClass,
  // }) {
  //   filteredTickets.value =
  //       ferryTickets.where((ticket) {
  //         bool matchesDeparture = ticket['departurePort'] == departurePort;
  //         bool matchesArrival = ticket['arrivalPort'] == arrivalPort;
  //         bool matchesTicketType = selectedTicketTypes.contains(
  //           ticket['ticketType'],
  //         );
  //         bool matchesClass =
  //             selectedClass == null ||
  //             ticket['classes'].contains(selectedClass);

  //         return matchesDeparture &&
  //             matchesArrival &&
  //             matchesTicketType &&
  //             matchesClass;
  //       }).toList();

  //   // Navigasi ke halaman hasil pencarian
  //   Get.toNamed('/ticket-search-results', arguments: filteredTickets);
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
