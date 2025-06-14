import 'package:get/get.dart';

class HelpController extends GetxController {
  // Data asli semua kantor
  final List<Map<String, dynamic>> allContacts = [
    {
      'name': 'DLU Pontianak',
      'contact': '(0561) 765021',
      'whatsapp': '0811 562 2019',
      'address': 'Jl. Pak Kasih No. 24 F, Pontianak 7811',
    },
    {
      'name': 'DLU Baubau',
      'contact': '(0402) 2826832',
      'whatsapp': '0812 4462 9832',
      'address':
          'Jalan Moh. Husni Thamrin No. 3, Bau-Bau | Call Center : 0812 4462 9832 (whatsapp only)',
    },
    {
      'name': 'DLU Labuan Bajo',
      'contact': '(031) 5353505',
      'whatsapp': '0811 3811 0333',
      'address':
          'Jalan Soekarno Hatta, Komplek TPI Kampung Ujung, Kecamatan Komodo, Kabupaten Manggarai Barat - NTT | Call Center : 0811 3811 0333 (whatsapp only)',
    },
    {
      'name': 'DLU Gresik',
      'contact': '0315353505',
      'whatsapp': '',
      'address': 'Gresik',
    },
    {
      'name': 'DLU Ujung',
      'contact': '031-3291002',
      'whatsapp': '',
      'address': 'Jalan Kalimas Baru 194 A, Surabaya',
    },
    {
      'name': 'DLU Parepare',
      'contact': '082170708880',
      'whatsapp': '0811 429 9990',
      'address': 'Parepare | Call Center : 0811 429 9990 (whatsapp only)',
    },
    {
      'name': 'DLU Ende',
      'contact': '081337006290',
      'whatsapp': '0813 3700 6290',
      'address': 'Ende | Call Center : 0813 3700 6290 (whatsapp only)',
    },
    {
      'name': 'DLU Bawean',
      'contact': '(031) 3298777',
      'whatsapp': '',
      'address': 'Jl. Beringin No.1 Sangkapura - Jawa Timur\nBawean',
    },
  ];

  // Data yang akan ditampilkan (hasil filter)
  List<Map<String, dynamic>> contacts = [];

  @override
  void onInit() {
    super.onInit();
    contacts = List.from(allContacts); // Awalnya semua ditampilkan
  }

  // Fungsi pencarian kota
  void filterContacts(String keyword) {
    if (keyword.isEmpty) {
      contacts = List.from(allContacts);
    } else {
      contacts = allContacts.where((contact) {
        final name = contact['name'].toString().toLowerCase();
        final address = contact['address'].toString().toLowerCase();
        return name.contains(keyword.toLowerCase()) || address.contains(keyword.toLowerCase());
      }).toList();
    }
    update(); // untuk memperbarui tampilan di GetBuilder
  }
}
