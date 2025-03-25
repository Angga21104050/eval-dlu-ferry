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
List<Map<String, dynamic>> ferryTickets = [
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 24),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang'],
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 24),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang', 'Kendaraan'], // Bisa lebih dari satu tipe
    'classes': {
      'Penumpang':
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Penumpang')
              .categories
              .map((cat) => cat.categoryName)
              .toList(),
      'Kendaraan':
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Kendaraan')
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
    'departureDate': DateTime(2025, 3, 24),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Penumpang', 'Kamar VIP'], // Bisa lebih dari satu tipe
    'classes': {
      'Penumpang':
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Penumpang')
              .categories
              .map((cat) => cat.categoryName)
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
    'departureDate': DateTime(2025, 3, 24),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Kamar VIP', 'Kendaraan'], // Bisa lebih dari satu tipe
    'classes': {
      'Kamar VIP':
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Kamar VIP')
              .categories
              .map((cat) => cat.categoryName)
              .toList(),
      'Kendaraan':
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Kendaraan')
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
    'departureDate': DateTime(2025, 3, 24),
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
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Penumpang')
              .categories
              .map((cat) => cat.categoryName)
              .toList(),
      'Kendaraan':
          dummyTicketTypes
              .firstWhere((ticket) => ticket.type == 'Kendaraan')
              .categories
              .map((cat) => cat.categoryName)
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
    'departureDate': DateTime(2025, 3, 24),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': ['Kendaraan'],
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kendaraan')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya - Pelabuhan Tanjung Perak - SUB',
    'arrivalPort': 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
    'departureDate': DateTime(2025, 3, 24),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    'ticketType': 'Kamar VIP',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kamar VIP')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry2/200/200',
    'ferryName': 'KM. Dharma Kencana',
    'departurePort': 'Semarang - Pelabuhan Tanjung Emas - SRG',
    'arrivalPort': 'Pontianak - Pelabuhan Dwikora - PNK',
    'departureDate': DateTime(2025, 3, 26),
    'departureTime': '10:00',
    'arrivalTime': '22:00',
    'duration': '12j 00m',
    'ticketType': 'Kendaraan',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kendaraan')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '200.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry3/200/200',
    'ferryName': 'KM. Wilis',
    'departurePort': 'Makassar - Pelabuhan Soekarno Hatta - MAK',
    'arrivalPort': 'Baubau - Pelabuhan Murhum - BUW',
    'departureDate': DateTime(2025, 3, 28),
    'departureTime': '14:00',
    'arrivalTime': '04:00',
    'duration': '14j 00m',
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '180.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry4/200/200',
    'ferryName': 'KM. Egon',
    'departurePort': 'Kupang - Pelabuhan Tenau - KOE',
    'arrivalPort': 'Ende - Pelabuhan Ippi - ENE',
    'departureDate': DateTime(2025, 3, 30),
    'departureTime': '06:00',
    'arrivalTime': '16:00',
    'duration': '10j 00m',
    'ticketType': 'Kamar VIP',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kamar VIP')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '500.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry5/200/200',
    'ferryName': 'KM. Kelimutu',
    'departurePort': 'Labuan Bajo - Pelabuhan Wae Kelambu - LBO',
    'arrivalPort': 'Waingapu - Pelabuhan Waingapu - WGP',
    'departureDate': DateTime(2025, 4, 2),
    'departureTime': '07:30',
    'arrivalTime': '17:30',
    'duration': '10j 00m',
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '160.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry6/200/200',
    'ferryName': 'KM. Nggapulu',
    'departurePort': 'Benoa - BNA',
    'arrivalPort': 'Batulicin - Pelabuhan Samudra - BTW',
    'departureDate': DateTime(2025, 4, 5),
    'departureTime': '09:00',
    'arrivalTime': '23:00',
    'duration': '14j 00m',
    'ticketType': 'Kendaraan',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kendaraan')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '210.000',
  },
];
