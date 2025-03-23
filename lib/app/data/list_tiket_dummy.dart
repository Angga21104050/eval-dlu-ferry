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

List<Map<String, dynamic>> ferryTickets = [
  {
    'imageUrl': 'https://picsum.photos/seed/ferry1/200/200',
    'ferryName': 'KM. Kirana 7',
    'departurePort': 'Surabaya (Pel. Tanjung Perak)',
    'arrivalPort': 'Lombok (Pel. Lembar/Gilimas)',
    'departureDate': DateTime(2025, 3, 24),
    'departureTime': '08:00',
    'arrivalTime': '18:00',
    'duration': '10j 00m',
    // memanggil ticket type
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),

    // memanggil category sesuai tickettype
    'price': '150.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry2/200/200',
    'ferryName': 'KM. Dharma Kencana',
    'departurePort': 'Makassar (Pel. Soekarno Hatta)',
    'arrivalPort': 'Balikpapan (Pel. Semayang)',
    'departureTime': '12:00',
    'arrivalTime': '22:30',
    'duration': '10j 30m',
    'ticketType': 'Kendaraan',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kendaraan')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '300.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry3/200/200',
    'ferryName': 'KM. Bukit Siguntang',
    'departurePort': 'Tanjung Priok (Jakarta)',
    'arrivalPort': 'Belawan (Medan)',
    'departureTime': '15:00',
    'arrivalTime': '10:00 (H+1)',
    'duration': '19j 00m',
    'ticketType': 'Kamar VIP',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kamar VIP')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '1.200.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry4/200/200',
    'ferryName': 'KM. Pelita Jaya',
    'departurePort': 'Bali (Pelabuhan Benoa)',
    'arrivalPort': 'Labuan Bajo (Nusa Tenggara Timur)',
    'departureTime': '10:00',
    'arrivalTime': '20:00',
    'duration': '10j 00m',
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '250.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry5/200/200',
    'ferryName': 'KM. Nusantara Indah',
    'departurePort': 'Padang (Teluk Bayur)',
    'arrivalPort': 'Batam (Pelabuhan Batu Ampar)',
    'departureTime': '14:00',
    'arrivalTime': '08:00 (H+1)',
    'duration': '18j 00m',
    'ticketType': 'Kendaraan',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kendaraan')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '500.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry6/200/200',
    'ferryName': 'KM. Rajawali',
    'departurePort': 'Semarang (Tanjung Mas)',
    'arrivalPort': 'Pontianak (Pelabuhan Dwikora)',
    'departureTime': '17:00',
    'arrivalTime': '09:00 (H+1)',
    'duration': '16j 00m',
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '350.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry7/200/200',
    'ferryName': 'KM. Ciremai',
    'departurePort': 'Surabaya (Tanjung Perak)',
    'arrivalPort': 'Makassar (Soekarno Hatta)',
    'departureTime': '13:00',
    'arrivalTime': '07:00 (H+1)',
    'duration': '18j 00m',
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '400.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry2/200/200',
    'ferryName': 'KM. Dharma Kencana',
    'departurePort': 'Makassar (Pel. Soekarno Hatta)',
    'arrivalPort': 'Balikpapan (Pel. Semayang)',
    'departureTime': '12:00',
    'arrivalTime': '22:30',
    'duration': '10j 30m',
    'ticketType': 'Kendaraan',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kendaraan')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '300.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry3/200/200',
    'ferryName': 'KM. Bukit Siguntang',
    'departurePort': 'Tanjung Priok (Jakarta)',
    'arrivalPort': 'Belawan (Medan)',
    'departureTime': '15:00',
    'arrivalTime': '10:00 (H+1)',
    'duration': '19j 00m',
    'ticketType': 'Kamar VIP',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kamar VIP')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '1.200.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry4/200/200',
    'ferryName': 'KM. Pelita Jaya',
    'departurePort': 'Bali (Pelabuhan Benoa)',
    'arrivalPort': 'Labuan Bajo (Nusa Tenggara Timur)',
    'departureTime': '10:00',
    'arrivalTime': '20:00',
    'duration': '10j 00m',
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '250.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry5/200/200',
    'ferryName': 'KM. Nusantara Indah',
    'departurePort': 'Padang (Teluk Bayur)',
    'arrivalPort': 'Batam (Pelabuhan Batu Ampar)',
    'departureTime': '14:00',
    'arrivalTime': '08:00 (H+1)',
    'duration': '18j 00m',
    'ticketType': 'Kendaraan',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kendaraan')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '500.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry6/200/200',
    'ferryName': 'KM. Rajawali',
    'departurePort': 'Semarang (Tanjung Mas)',
    'arrivalPort': 'Pontianak (Pelabuhan Dwikora)',
    'departureTime': '17:00',
    'arrivalTime': '09:00 (H+1)',
    'duration': '16j 00m',
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '350.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry7/200/200',
    'ferryName': 'KM. Ciremai',
    'departurePort': 'Surabaya (Tanjung Perak)',
    'arrivalPort': 'Makassar (Soekarno Hatta)',
    'departureTime': '13:00',
    'arrivalTime': '07:00 (H+1)',
    'duration': '18j 00m',
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '400.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry8/200/200',
    'ferryName': 'KM. Samudra Jaya',
    'departurePort': 'Baubau (Pel. Murhum)',
    'arrivalPort': 'Kupang (Pel. Tenau)',
    'departureTime': '09:00',
    'arrivalTime': '21:00',
    'duration': '12j 00m',
    'ticketType': 'Kendaraan',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kendaraan')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '600.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry9/200/200',
    'ferryName': 'KM. Laut Nusantara',
    'departurePort': 'Gresik',
    'arrivalPort': 'Benoa',
    'departureTime': '11:00',
    'arrivalTime': '23:00',
    'duration': '12j 00m',
    'ticketType': 'Penumpang',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Penumpang')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '320.000',
  },
  {
    'imageUrl': 'https://picsum.photos/seed/ferry10/200/200',
    'ferryName': 'KM. Bahari Jaya',
    'departurePort': 'Parepare (Pel. Nusantara)',
    'arrivalPort': 'Ende (Pel. Ippi)',
    'departureTime': '07:00',
    'arrivalTime': '19:00',
    'duration': '12j 00m',
    'ticketType': 'Kamar VIP',
    'classes':
        dummyTicketTypes
            .firstWhere((ticket) => ticket.type == 'Kamar VIP')
            .categories
            .map((cat) => cat.categoryName)
            .toList(),
    'price': '900.000',
  },
];
