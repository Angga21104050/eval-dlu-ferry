import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../home/controllers/home_controller.dart';
import '../../../constants/text_style.dart';

class DateSelectorWidget extends StatelessWidget {
  final HomeController homeController;

  const DateSelectorWidget({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final today = DateTime.now();
      final selectedDate = homeController.departureDate.value;

      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border(
            bottom: BorderSide(
              color: Colors.grey, // Warna border
              width: 1.0,
            ),
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 14,
          itemBuilder: (context, index) {
            final date = today.add(Duration(days: index));
            final isSelected =
                DateFormat('yyyy-MM-dd').format(date) ==
                DateFormat('yyyy-MM-dd').format(selectedDate);

            return GestureDetector(
              onTap: () {
                homeController.departureDate.value = date;
                homeController.searchTickets(
                  filteredTickets: homeController.filteredTickets,
                  selectedTicketTypes: [],
                  departureDate: date,
                );
              },
              child: Container(
                width: 70,
                margin: const EdgeInsets.only(right: 38),
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('E', 'id_ID').format(date),
                          style: medium.copyWith(
                            fontSize: 14,
                            color:
                                isSelected
                                    ? Color(0xFF0064D2)
                                    : Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '-',
                          style: medium.copyWith(
                            fontSize: 14,
                            color:
                                isSelected
                                    ? Color(0xFF0064D2)
                                    : Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          DateFormat('d', 'id_ID').format(date),
                          style: medium.copyWith(
                            fontSize: 14,
                            color:
                                isSelected
                                    ? Color(0xFF0064D2)
                                    : Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    if (isSelected)
                      Container(
                        height: 2,
                        width: 56,
                        decoration: BoxDecoration(
                          color: Color(0xFF0064D2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
