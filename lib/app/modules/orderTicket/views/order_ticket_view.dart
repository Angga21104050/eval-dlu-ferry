import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';
import '../../myTicket/components/secondary_appbar.dart';
import '../components/custom_text_form_field.dart';
import '../components/gender_selection.dart';
import '../components/ticket_card.dart';
import '../components/passenger_form.dart';
import '../components/vehicle_form.dart';

class OrderTicketView extends GetView<OrderTicketController> {
  const OrderTicketView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cart = Get.arguments ?? [];
    return Scaffold(
      appBar: const SecCustomAppBar(page: 'Pesan Tiket'),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0064D2), Colors.white, Colors.white],
              ),
              image: DecorationImage(
                image: AssetImage("assets/img/map-global.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            children: [
              TicketCard(
                ferryName: 'KM Kirana',
                departureTime: '08:00',
                arrivalTime: '12:00',
                duration: '4j 0m',
                date: 'Kamis, 29 Maret',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent.withOpacity(
                                0.3,
                              ), // Shadow biru
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Detail Pemesanan',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GenderSelection(controller: controller),
                              const SizedBox(height: 10),
                              const CustomTextFormField(
                                label: 'Nama LengkapSesuai KTP/Paspor',
                              ),
                              const SizedBox(height: 10),
                              const CustomTextFormField(
                                label: 'Nomor Ponsel',
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 10),
                              const CustomTextFormField(
                                label: 'Alamat Email',
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Kontak ini untuk e-tiket dan kebutuhan rescheduling',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      PassengerForm(cartItems: cart),
                      const VehicleForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
