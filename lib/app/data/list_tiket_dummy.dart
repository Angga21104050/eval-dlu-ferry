// ignore: unused_import
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
      // -------------------------------------------------------------- 13
      // Kelas I
      TicketCategory(categoryName: 'Kelas I Bayi'),
      TicketCategory(categoryName: 'Kelas I Anak'),
      TicketCategory(categoryName: 'Kelas I Dewasa'),
      // Kelas II
      TicketCategory(categoryName: 'Kelas II Bayi'),
      TicketCategory(categoryName: 'Kelas II Anak'),
      TicketCategory(categoryName: 'Kelas II Dewasa'),
      // Kelas III
      TicketCategory(categoryName: 'Kelas III Bayi'),
      TicketCategory(categoryName: 'Kelas III Anak'),
      TicketCategory(categoryName: 'Kelas III Dewasa'),
      // Ekonomi
      TicketCategory(categoryName: 'Ekonomi Bayi'),
      TicketCategory(categoryName: 'Ekonomi Anak'),
      TicketCategory(categoryName: 'Ekonomi Dewasa'),
      // Ekonomi Tidur
      TicketCategory(categoryName: 'Ekonomi Tidur Bayi'),
      TicketCategory(categoryName: 'Ekonomi Tidur Anak'),
      TicketCategory(categoryName: 'Ekonomi Tidur Dewasa'),
      // Ekonomi Duduk
      TicketCategory(categoryName: 'Ekonomi Duduk Bayi'),
      TicketCategory(categoryName: 'Ekonomi Duduk Anak'),
      TicketCategory(categoryName: 'Ekonomi Duduk Dewasa'),
      // Executive Seat
      TicketCategory(categoryName: 'Executive Seat Bayi'),
      TicketCategory(categoryName: 'Executive Seat Anak'),
      TicketCategory(categoryName: 'Executive Seat Dewasa'),
      // Cabin
      TicketCategory(categoryName: 'Cabin Bayi'),
      TicketCategory(categoryName: 'Cabin Anak'),
      TicketCategory(categoryName: 'Cabin Dewasa'),
      // Double Cabin
      TicketCategory(categoryName: 'Double Cabin Bayi'),
      TicketCategory(categoryName: 'Double Cabin Anak'),
      TicketCategory(categoryName: 'Double Cabin Dewasa'),
      // Single Cabin
      TicketCategory(categoryName: 'Single Cabin Bayi'),
      TicketCategory(categoryName: 'Single Cabin Anak'),
      TicketCategory(categoryName: 'Single Cabin Dewasa'),
      // VIP Suites
      TicketCategory(categoryName: 'VIP Suites Bayi'),
      TicketCategory(categoryName: 'VIP Suites Anak'),
      TicketCategory(categoryName: 'VIP Suites Dewasa'),
      // Ekonomi - Non Seat
      TicketCategory(categoryName: 'Ekonomi - Non Seat Bayi'),
      TicketCategory(categoryName: 'Ekonomi - Non Seat Anak'),
      TicketCategory(categoryName: 'Ekonomi - Non Seat Dewasa'),
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
  if (type != 'Penumpang') {
    // Untuk tipe selain Penumpang, kembalikan semua kategori atau random seperti biasa
    return dummyTicketTypes
        .firstWhere(
          (ticket) => ticket.type == type,
          orElse: () => Ticket(type: '', categories: []),
        )
        .categories
        .map((cat) => cat.categoryName)
        .take(7)
        .toList();
  }

  // Ambil 6 random
  return dummyTicketTypes
      .firstWhere(
        (ticket) => ticket.type == 'Penumpang',
        orElse: () => Ticket(type: '', categories: []),
      )
      .categories
      .map((cat) => cat.categoryName)
      .toList()
    ..shuffle()
    ..take(6).toList();
}

List<Map<String, dynamic>> ferryTickets = [
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 5, 6),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang'],
    'classes': {
      'Penumpang':
          (dummyTicketTypes
                  .firstWhere((ticket) => ticket.type == 'Penumpang')
                  .categories // Added missing .categories access
                  .sublist(13, 37)
                  .map((cat) => cat.categoryName)
                  .toList()
                ..shuffle()) // Proper cascade notation
              .take(8)
              .toList(),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 5, 6),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang', 'Kendaraan'],
    'classes': {
      'Penumpang':
          (dummyTicketTypes
                  .firstWhere((ticket) => ticket.type == 'Penumpang')
                  .categories // Added missing .categories access
                  .sublist(13, 37)
                  .map((cat) => cat.categoryName)
                  .toList()
                ..shuffle()) // Proper cascade notation
              .take(8)
              .toList(),
      'Kendaraan':
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Kendaraan')
              .categories
              .map((cat) => cat.categoryName)
              .take(7)
              .toList(),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 5, 6),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': [
      'Penumpang',
      'Kendaraan',
      'Kamar VIP',
    ], // Bisa lebih dari satu tipe
    'classes': {
      'Penumpang':
          (dummyTicketTypes
                  .firstWhere((ticket) => ticket.type == 'Penumpang')
                  .categories // Added missing .categories access
                  .sublist(13, 37)
                  .map((cat) => cat.categoryName)
                  .toList()
                ..shuffle()) // Proper cascade notation
              .take(8)
              .toList(),
      'Kendaraan':
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Kendaraan')
              .categories
              .map((cat) => cat.categoryName)
              .take(7)
              .toList(),
      'Kamar VIP':
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Kamar VIP')
              .categories
              .map((cat) => cat.categoryName)
              .toList(),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 5, 6),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang'],
    'classes': {
      'Penumpang':
          (dummyTicketTypes
                  .firstWhere((ticket) => ticket.type == 'Penumpang')
                  .categories // Added missing .categories access
                  .sublist(13, 37)
                  .map((cat) => cat.categoryName)
                  .toList()
                ..shuffle()) // Proper cascade notation
              .take(8)
              .toList(),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 5, 6),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang', 'Kendaraan'], // Bisa lebih dari satu tipe
    'classes': {
      'Penumpang':
          (dummyTicketTypes
                  .firstWhere((ticket) => ticket.type == 'Penumpang')
                  .categories // Added missing .categories access
                  .sublist(13, 37)
                  .map((cat) => cat.categoryName)
                  .toList()
                ..shuffle()) // Proper cascade notation
              .take(8)
              .toList(),
      'Kendaraan': getRandomCategories('Kendaraan'),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 5, 6),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang', 'Kamar VIP'], // Bisa lebih dari satu tipe
    'classes': {
      'Penumpang':
          (dummyTicketTypes
                  .firstWhere((ticket) => ticket.type == 'Penumpang')
                  .categories // Added missing .categories access
                  .sublist(13, 37)
                  .map((cat) => cat.categoryName)
                  .toList()
                ..shuffle()) // Proper cascade notation
              .take(8)
              .toList(),
      'Kamar VIP': getRandomCategories('Kamar VIP'),
    },
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 5, 6),
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
    'departureDate': DateTime(2025, 5, 6),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': [
      'Penumpang',
      'Kendaraan',
      'Kamar VIP',
    ], // Bisa lebih dari satu tipe
    'classes': {
      'Penumpang':
          (dummyTicketTypes
                  .firstWhere((ticket) => ticket.type == 'Penumpang')
                  .categories // Added missing .categories access
                  .sublist(13, 37)
                  .map((cat) => cat.categoryName)
                  .toList()
                ..shuffle()) // Proper cascade notation
              .take(8)
              .toList(),
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
    'departureDate': DateTime(2025, 5, 6),
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
    'departureDate': DateTime(2025, 5, 6),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Kamar VIP'],
    'classes': {'Kamar VIP': getRandomCategories('Kamar VIP')},
    'price': '150.000',
  },
];
