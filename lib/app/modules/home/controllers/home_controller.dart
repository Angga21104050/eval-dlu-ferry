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
        Get.offNamed('/home');
        break;
      case 1:
        Get.offNamed('/my-ticket');
        break;
      case 2:
        Get.offNamed('/profile');
        break;
    }
  }

  // data dummy kelas tiket
  final List<String> passengerClasses = [
    'Semua Kelas', 
    ...dummyTicketTypes
        .firstWhere(
          (ticket) => ticket.type == 'Penumpang',
          orElse: () => Ticket(type: '', categories: []),
        )
        .categories
        .map((category) => category.categoryName)
        .toList()
        .sublist(1, 12),
  ];

  final List<String> vehicleClasses = [
    'Semua Kelas', 
    ...dummyTicketTypes
        .firstWhere(
          (ticket) => ticket.type == 'Kendaraan',
          orElse: () => Ticket(type: '', categories: []),
        )
        .categories
        .map((category) => category.categoryName)
        .toList()
        .sublist(1, 14),
  ];

  final List<String> vipRoomClasses = [
    'Semua Kelas', 
    ...dummyTicketTypes
        .firstWhere(
          (ticket) => ticket.type == 'Kamar VIP',
          orElse: () => Ticket(type: '', categories: []),
        )
        .categories
        .map((category) => category.categoryName)
        .toList()
        .sublist(1, 3),
  ];

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

  var departureDate = DateTime.now().obs;

  RxList<Map<String, dynamic>> filteredTickets = <Map<String, dynamic>>[].obs;

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  void searchTickets({
    required RxList<Map<String, dynamic>> filteredTickets,
    required List<String> selectedTicketTypes,
    required DateTime departureDate,
  }) {

    // print('- From City: ${fromCity.value}');
    // print('- To City: ${toCity.value}');
    // print('- Departure Date: $departureDate');
    filteredTickets.value =
        ferryTickets.where((ticket) {
          // print('Checking ticket: ${ticket['ferryName']} on ${ticket['departureDate']}');
          final bool matchesPort =
              ticket['departurePort'] == fromCity.value &&
              ticket['arrivalPort'] == toCity.value;
          final bool matchesType =
              selectedTicketTypes.isEmpty ||
              (ticket['ticketType'] is List<String> &&
                  (ticket['ticketType'] as List<String>).any(
                    (type) => selectedTicketTypes.contains(type),
                  ));
          final bool matchesDepartureDate =
              _normalizeDate(ticket['departureDate']) ==
              _normalizeDate(departureDate);

          return matchesPort && matchesType && matchesDepartureDate;
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
