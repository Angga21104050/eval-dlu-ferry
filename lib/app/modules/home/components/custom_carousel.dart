import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

class CustomHorizontalScroll extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      "image": "assets/img/slider-1.jpg",
      "title": "Dharma Lautan Utama: Waspada Modus Penipuan Tiket!",
      "desc":
          "PT. Dharma Lautan Utama mengimbau pelanggan untuk waspada terhadap penipuan tiket.",
    },
    {
      "image": "assets/img/slider-4.jpg",
      "title": "Peta Layanan PT. Dharma Lautan Utama",
      "desc": "Lihat rute pelayaran kami yang mencakup seluruh Indonesia.",
    },
    {
      "image": "assets/img/slider-3.jpg",
      "title": "Dirgahayu PT. Dharma Lautan Utama",
      "desc":
          "Nikmati kemudahan memesan tiket secara online hanya di aplikasi resmi kami.",
    },
    {
      "image": "assets/img/slider-2.jpg",
      "title": "Layanan Premium untuk Penumpang",
      "desc": "Kami menyediakan layanan kelas VIP dan kabin nyaman.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Berita Informasi',
                  style: semiBold.copyWith(fontSize: 16),
                ),
                Container(
                  height: 0.8,
                  margin: const EdgeInsets.only(top: 4),
                  color: Color(0xFF0064D2),
                ),
              ],
            ),
          ),

          // Slider horizontal
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final item = newsList[index];

                return Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: 16),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    shadowColor: Colors.black26,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.asset(
                            item['image']!,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Judul
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
                          child: Text(
                            item['title']!,
                            style: semiBold.copyWith(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Deskripsi
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            item['desc']!,
                            style: light.copyWith(
                              fontSize: 10,
                              color: const Color.fromARGB(137, 0, 0, 0),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
