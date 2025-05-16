import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

class CustomHorizontalScroll extends StatelessWidget {
  // Daftar gambar didefinisikan di dalam widget
  final List<String> imagePaths = [
    "assets/img/slider-1.jpg",
    "assets/img/slider-2.jpg",
    "assets/img/slider-3.jpg",
    "assets/img/slider-4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
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
                  margin: const EdgeInsets.only(right: 0),
                  decoration: BoxDecoration(
                    color: Color(0xFF0064D2),
                    boxShadow: [
                      BoxShadow(
                        color: Color(
                          0xFF0064D2,
                        ).withOpacity(0.3), // bayangan biru transparan
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 3), // posisi bayangan ke bawah
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 170,
            margin: EdgeInsets.only(bottom: 10),
            // Sesuaikan tinggi sesuai kebutuhan
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Container(
                  width:
                      MediaQuery.of(context).size.width *
                      0.7, // Lebar 80% dari layar
                  margin: EdgeInsets.only(
                    right: 16, // Spasi antara item
                    left: index == 0 ? 16 : 0,
                    bottom: 10, // Margin kiri hanya untuk item pertama
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(imagePaths[index]),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(
                          0xFF0064D2,
                        ).withOpacity(0.3), // bayangan biru transparan
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3), // posisi bayangan ke bawah
                      ),
                    ],
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
