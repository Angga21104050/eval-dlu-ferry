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

  // Tambahkan variabel untuk menyimpan hasil pencarian
  RxList<Map<String, dynamic>> filteredTickets = <Map<String, dynamic>>[].obs;

  // Helper untuk normalisasi tanggal (abaikan komponen waktu)
  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  // 🔍 Fungsi pencarian tiket
  void searchTickets({
    required RxList<Map<String, dynamic>> filteredTickets,
    required List<String> selectedTicketTypes,
    required DateTime departureDate,
  }) {
    // Debug: Print data untuk verifikasi
    // print('Filtering with:');
    // print('- From City: ${fromCity.value}');
    // print('- To City: ${toCity.value}');
    // print('- Departure Date: $departureDate');
    filteredTickets.value =
        ferryTickets.where((ticket) {
          // print('Checking ticket: ${ticket['ferryName']} on ${ticket['departureDate']}');
          final bool matchesPort =
              ticket['departurePort'] == fromCity.value &&
              ticket['arrivalPort'] == toCity.value;
          // Gunakan casting as List<String> untuk memastikan tipe data benar sebelum menerapkan .any().
          final bool matchesType =
              selectedTicketTypes.isEmpty ||
              (ticket['ticketType'] is List<String> &&
                  (ticket['ticketType'] as List<String>).any(
                    (type) => selectedTicketTypes.contains(type),
                  ));
          // Filter tanggal keberangkatan
          // Gunakan _normalizeDate untuk perbandingan
          final bool matchesDepartureDate =
              _normalizeDate(ticket['departureDate']) ==
              _normalizeDate(departureDate);

          return matchesPort && matchesType && matchesDepartureDate;
        }).toList();

    // print('Total tickets found: ${filteredTickets.length}');
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
