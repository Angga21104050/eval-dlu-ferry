import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatelessWidget {
  final double height; // Tinggi carousel
  final double horizontalMargin; // Margin horizontal
  final double verticalMargin; // Margin vertikal
  final double borderRadius; // Border radius
  final BoxShadow shadow; // Shadow

  // Daftar gambar didefinisikan di dalam widget
  final List<String> imagePaths = [
    "assets/img/iklan_1.png",
    "assets/img/iklan_2.png",
    "assets/img/contoh.jpeg",
  ];

  CustomCarousel({
    super.key,
    this.height = 250,
    this.horizontalMargin = 20,
    this.verticalMargin = 20,
    this.borderRadius = 16.0,
    this.shadow = const BoxShadow(
      color: Colors.grey,
      offset: Offset(0, 5),
      blurRadius: 10,
      spreadRadius: 0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CarouselSlider(
        options: CarouselOptions(
          height: height,
          autoPlay: true,
          viewportFraction: 1.0,
          enlargeCenterPage: true,
        ),
        items:
            imagePaths.map((imagePath) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalMargin,
                  vertical: verticalMargin,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: Colors.grey.shade300),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
