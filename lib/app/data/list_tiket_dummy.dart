import 'dart:math';

class Ticket {
  String type;
  List<TicketCategory> categories;

  Ticket({required this.type, required this.categories});
}

class TicketCategory {
  String categoryName;
  // double price;

  TicketCategory({required this.categoryName});
}

List<Ticket> dummyTicketTypes = [
  Ticket(
    type: 'Penumpang',
    categories: [
      TicketCategory(categoryName: 'Kelas I'),
      TicketCategory(categoryName: 'Kelas II'),
      TicketCategory(categoryName: 'Kelas III'),
      TicketCategory(categoryName: 'Ekonomi'),
      TicketCategory(categoryName: 'Ekonomi Tidur'),
      TicketCategory(categoryName: 'Ekonomi Duduk'),
      TicketCategory(categoryName: 'Executive Seat'),
      TicketCategory(categoryName: 'Cabin'),
      TicketCategory(categoryName: 'Double Cabin'),
      TicketCategory(categoryName: 'Single Cabin'),
      TicketCategory(categoryName: 'VIP Suites'),
      TicketCategory(categoryName: 'Ekonomi - Non Seat'),
    ],
  ),
  Ticket(
    type: 'Kendaraan',
    categories: [
      TicketCategory(categoryName: 'Sepeda'),
      TicketCategory(categoryName: 'Sepeda Motor 2.A (s.d 249CC)'),
      TicketCategory(
        categoryName: 'Sepeda Motor 2.B (250CC s.d 1000CC / Roda 3)',
      ),
      TicketCategory(categoryName: 'Sepeda Motor >1001CC'),
      TicketCategory(categoryName: 'Kend. Kecil 3.A (s.d 2000CC)'),
      TicketCategory(categoryName: 'Kend. Kecil 3.B (2001CC ke Atas)'),
      TicketCategory(categoryName: 'Kend. Kecil 3.C >3001CC'),
      TicketCategory(categoryName: 'Truk Sedang 4.A'),
      TicketCategory(categoryName: 'Truk Sedang 4.B'),
      TicketCategory(categoryName: 'Truk Sedang 4.C'),
      TicketCategory(categoryName: 'Truk Besar 5.A'),
      TicketCategory(categoryName: 'Truk Besar 5.B'),
      TicketCategory(categoryName: 'Truk Besar 5.C'),
      TicketCategory(categoryName: 'Alat Berat 7.AB'),
    ],
  ),
  Ticket(
    type: 'Kamar VIP',
    categories: [
      TicketCategory(categoryName: 'VIP Suites (2 Kasur)'),
      TicketCategory(categoryName: 'VIP Room 1 (1 Kasur)'),
      TicketCategory(categoryName: 'VIP Room 2 (2 Kasur)'),
    ],
  ),
];

List<String> availableTicketTypes =
    dummyTicketTypes.map((e) => e.type).toList();

// fungsi random classes untuk dammy
List<String> getRandomCategories(String type) {
  List<String> allCategories =
      dummyTicketTypes
          .firstWhere(
            (ticket) => ticket.type == type,
            orElse: () => Ticket(type: '', categories: []), // Tambahkan default
          )
          .categories
          .map((cat) => cat.categoryName)
          .toList();

  allCategories.shuffle(Random());
  return allCategories.take(6).toList();
}

List<Map<String, dynamic>> ferryTickets = [
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 27),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang'],
    'classes': {'Penumpang': getRandomCategories('Penumpang')},
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 27),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang', 'Kendaraan'], // Bisa lebih dari satu tipe
    'classes': {
      'Penumpang': getRandomCategories('Penumpang'),
      'Kendaraan': getRandomCategories('Kendaraan'),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 28),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang', 'Kamar VIP'], // Bisa lebih dari satu tipe
    'classes': {
      'Penumpang': getRandomCategories('Penumpang'),
      'Kamar VIP': getRandomCategories('Kamar VIP'),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 27),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Kendaraan', 'Kamar VIP'], // Bisa lebih dari satu tipe
    'classes': {
      'Kendaraan': getRandomCategories('Kendaraan'),
      'Kamar VIP': getRandomCategories('Kamar VIP'),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 27),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': [
      'Penumpang',
      'Kendaraan',
      'Kamar VIP',
    ], // Bisa lebih dari satu tipe
    'classes': {
      'Penumpang': getRandomCategories('Penumpang'),
      'Kendaraan': getRandomCategories('Kendaraan'),
      'Kamar VIP': getRandomCategories('Kamar VIP'),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 27),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Kendaraan'],
    'classes': {'Kendaraan': getRandomCategories('Kendaraan')},
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 27),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Kamar VIP'],
    'classes': {'Kamar VIP': getRandomCategories('Kamar VIP')},
    'price': '150.000',
  },
];
