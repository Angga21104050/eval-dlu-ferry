import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../home/controllers/home_controller.dart';

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
          color: const Color(0xFF0064D2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
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
                width: 60,
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
                          style: TextStyle(
                            fontSize: 14,
                            color: isSelected ? Colors.white : Colors.black54,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '-',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          DateFormat('d', 'id_ID').format(date),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    if (isSelected)
                      Container(
                        height: 2,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
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
