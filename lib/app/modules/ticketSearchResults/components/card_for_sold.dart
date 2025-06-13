import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

class CardForSold extends StatelessWidget {
  const CardForSold({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.blue.withOpacity(0.1),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 100,
                      height: 163,
                      child: Image.asset(
                        'assets/img/ferry.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'KM. Kirana',
                              style: semiBold.copyWith(
                                fontSize: 16,
                                color: Color(0xFF0064D2),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Habis',
                            style: regular.copyWith(
                              fontSize: 10,
                              color: const Color(0xFF9D9D9D),
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(4),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Kolom ikon
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.directions_ferry_outlined,
                                    color: Color(0xFF0064D2),
                                    size: 18,
                                  ),
                                  Column(
                                    children: List.generate(
                                      5,
                                      (index) => Container(
                                        width: 1,
                                        height: 4,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 2,
                                        ),
                                        color: Color(0xFF0064D2),
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Color(0xFF0064D2),
                                    size: 18,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 6),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '12:00',
                                    style: medium.copyWith(
                                      fontSize: 12,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    '15:00',
                                    style: medium.copyWith(
                                      fontSize: 12,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(width: 8),
                              // Kolom teks pelabuhan
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Surabaya - Pelabuhan Tanjung Perak - SUB',
                                      style: semiBold.copyWith(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Lombok - Pelabuhan Lembar/Gilimas - LOM',
                                      style: semiBold.copyWith(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Lihat Kelas',
                            style: semiBold.copyWith(
                              fontSize: 12,
                              color: Color(0xFF0064D2),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF0064D2),
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
