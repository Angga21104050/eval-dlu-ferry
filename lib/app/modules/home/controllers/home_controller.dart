import 'package:get/get.dart';
import '../../../data/list_tiket_dummy.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var selectedIndex = 0.obs; // Gunakan observable untuk menyimpan index aktif

  // navigationbarBottom
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

  // data dummy kelas tiket
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
  RxList<Map<String, dynamic>> filteredTickets = <Map<String, dynamic>>[].obs;

  // 🔍 Fungsi pencarian tiket
  void searchTickets({
    required RxList<Map<String, dynamic>> filteredTickets,
    required List<String> selectedTicketTypes,
  }) {
    filteredTickets.value =
        ferryTickets.where((ticket) {
          final bool matchesPort =
              ticket['departurePort'] == fromCity.value &&
              ticket['arrivalPort'] == toCity.value;
          final bool matchesType =
              selectedTicketTypes.isEmpty ||
              selectedTicketTypes.contains(ticket['ticketType']);

          return matchesPort && matchesType;
        }).toList();
  }

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
