import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

class MyDetailTicketSumm extends StatelessWidget {
  const MyDetailTicketSumm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('10:00', style: semiBold.copyWith(fontSize: 24)),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                  height: 1,
                                  indent: 8,
                                  endIndent: 8,
                                ),
                              ),
                            ],
                          ),

                          Positioned(
                            left: 5,
                            top: -3.3,
                            child: const Icon(
                              Icons.circle,
                              size: 8,
                              color: Colors.black,
                            ),
                          ),
                          Positioned(
                            left: 156,
                            top: -3.3,
                            child: const Icon(
                              Icons.circle,
                              size: 8,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '5j 30m',
                      style: regular.copyWith(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text('15:30', style: semiBold.copyWith(fontSize: 24)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Surabaya....',
                  style: semiBold.copyWith(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Text(
                'Lombok....',
                style: semiBold.copyWith(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
