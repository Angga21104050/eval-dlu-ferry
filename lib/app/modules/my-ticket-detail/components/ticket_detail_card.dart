import 'package:dlu_project/app/modules/myTicket/components/half_circle.dart';
import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

class TicketDetailCard extends StatelessWidget {
  final String ferryName;
  final String price;
  final String className;
  final String paymentStatus;
  final String passengerName;
  final String ticketNumber;
  final String departurePort;
  final String arrivalPort;
  final String bookingCode;
  final String barcodeAssetPath;

  const TicketDetailCard({
    Key? key,
    required this.ferryName,
    required this.price,
    required this.className,
    required this.paymentStatus,
    required this.passengerName,
    required this.ticketNumber,
    required this.departurePort,
    required this.arrivalPort,
    required this.bookingCode,
    required this.barcodeAssetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'KM. Kirana 7',
                        style: bold.copyWith(
                          fontSize: 24,
                          color: Color(0xFF0064D2),
                        ),
                      ),
                      Text(
                        price,
                        style: semiBold.copyWith(
                          fontSize: 14,
                          color: const Color(0xFF9D9D9D),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        className,
                        style: semiBold.copyWith(
                          fontSize: 14,
                          color: const Color(0xFF9D9D9D),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          passengerName,
                          style: semiBold.copyWith(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        ticketNumber,
                        style: regular.copyWith(
                          fontSize: 14,
                          color: const Color(0xFF9D9D9D),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(color: Colors.blue.shade50),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          departurePort,
                          textAlign: TextAlign.start,
                          style: medium.copyWith(
                            fontSize: 14,
                            color: Color(0xFF0064D2),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: const Color(0xFF9D9D9D),
                        size: 18,
                      ),
                      Flexible(
                        child: Text(
                          arrivalPort,
                          textAlign: TextAlign.end,
                          style: medium.copyWith(
                            fontSize: 14,
                            color: Color(0xFF0064D2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          31,
                          (index) => Container(
                            width: 6,
                            height: 2,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: -20,
                        top: -14,
                        child: HalfCircle(
                          color: Colors.grey.shade100,
                          radius: 10,
                          height: 30,
                          isLeft: true,
                        ),
                      ),
                      Positioned(
                        right: -20,
                        top: -14,
                        child: HalfCircle(
                          color: Colors.grey.shade100,
                          radius: 10,
                          height: 30,
                          isLeft: false,
                        ),
                      ),
                    ],
                  ),
                ),

                // Booking Code
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'Kode Booking',
                    style: semiBold.copyWith(
                      fontSize: 14,
                      color: const Color(0xFF9D9D9D),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bookingCode,
                        style: semiBold.copyWith(
                          fontSize: 26,
                          color: Color(0xFF0064D2),
                        ),
                      ),
                      Text(
                        paymentStatus,
                        style: semiBold.copyWith(
                          fontSize: 15,
                          color: Color(0xFF9D9D9D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
