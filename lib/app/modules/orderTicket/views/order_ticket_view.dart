import 'package:dlu_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';
import '../../myTicket/components/secondary_appbar.dart';
import '../components/custom_text_form_field.dart';
import '../components/gender_selection.dart';
import '../components/summary_card.dart';
import '../components/payment_methode.dart';
import '../../../data/list_tiket_dummy.dart';

class OrderTicketView extends GetView<OrderTicketController> {
  const OrderTicketView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cart = Get.arguments ?? [];
    print('🛒 CART: $cart');
    String ferryName = cart.isNotEmpty ? cart.first['ferryName'] : 'Nama Ferry';
    String departureTime =
        cart.isNotEmpty ? cart.first['departureTime'] : 'Waktu Berangkat';
    String arrivalTime =
        cart.isNotEmpty ? cart.first['arrivalTime'] : 'Waktu Tiba';
    String departurePort =
        cart.isNotEmpty ? cart.first['departurePort'] : 'Pelabuhan Berangkat';
    String arrivalPort =
        cart.isNotEmpty ? cart.first['arrivalPort'] : 'Pelabuhan Tujuan';
    String duration = cart.isNotEmpty ? cart.first['duration'] : 'Durasi';
    String date = cart.isNotEmpty ? cart.first['date'] : 'Tanggal';

    int passengerCount = 0;
    for (var item in cart) {
      if (dummyTicketTypes
          .firstWhere((t) => t.type == 'Penumpang')
          .categories
          .any((cat) => cat.categoryName == item['class'])) {
        passengerCount += (item['count'] as int);
      }
    }

    int vipRoomCount = 0;
    for (var item in cart) {
      if (dummyTicketTypes
          .firstWhere((t) => t.type == 'Kamar VIP')
          .categories
          .any((cat) => cat.categoryName == item['class'])) {
        vipRoomCount += (item['count'] as int);
      }
    }

    int vehicleCount = 0;
    for (var item in cart) {
      if (dummyTicketTypes
          .firstWhere((t) => t.type == 'Kendaraan')
          .categories
          .any((cat) => cat.categoryName == item['class'])) {
        vehicleCount += (item['count'] as int);
      }
    }

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
              OrderSummaryCard(
                ferryName: ferryName,
                departureTime: departureTime,
                arrivalTime: arrivalTime,
                duration: duration,
                date: date,
                cart: cart,
                departurePort: departurePort,
                arrivalPort: arrivalPort,
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
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.1,
                              ), // Warna shadow dengan sedikit transparansi
                              blurRadius: 6, // Tingkat keburaman shadow
                              offset: const Offset(
                                0,
                                2,
                              ), // Offset shadow (horizontal, vertical)
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

                      // Form penumpang (berulang)
                      if (passengerCount > 0)
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // Warna shadow dengan sedikit transparansi
                                blurRadius: 6, // Tingkat keburaman shadow
                                offset: const Offset(
                                  0,
                                  2,
                                ), // Offset shadow (horizontal, vertical)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Penumpang',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (var i = 0; i < passengerCount; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Penumpang ${i + 1}'),
                                        GenderSelection(controller: controller),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            // ID Type Dropdown
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                    ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    value: 'KTP',
                                                    onChanged: (newValue) {
                                                      print(
                                                        'Nilai dropdown berubah menjadi: $newValue',
                                                      );
                                                    },
                                                    items:
                                                        [
                                                          'KTP',
                                                          'SIM',
                                                          'Paspor',
                                                        ].map((String value) {
                                                          return DropdownMenuItem<
                                                            String
                                                          >(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),

                                            // ID Number
                                            Expanded(
                                              flex: 5,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText: 'Nomor ID',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),

                                        // Full Name
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Nama Lengkap Sesuai ID',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        // Phone Number
                                        TextField(
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            labelText: 'Nomor Ponsel',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),

                      // Form type kendaraan (berulang)
                      if (vehicleCount > 0)
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // Warna shadow dengan sedikit transparansi
                                blurRadius: 6, // Tingkat keburaman shadow
                                offset: const Offset(
                                  0,
                                  2,
                                ), // Offset shadow (horizontal, vertical)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Kendaraan',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (var i = 0; i < vehicleCount; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Kendaraan ${i + 1}'),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                    ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    value: 'Motor',
                                                    onChanged: (newValue) {},
                                                    items:
                                                        [
                                                          'Motor',
                                                          'Mobil',
                                                          'Bus',
                                                          'Truk',
                                                        ].map((String value) {
                                                          return DropdownMenuItem<
                                                            String
                                                          >(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              flex: 5,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Nama Pemilik Sesuai STNK',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Kota/Kabupaten',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Alamat',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Nomor Polisi',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),

                      // Form kamar vip (berulang)
                      if (vipRoomCount > 0)
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // Warna shadow dengan sedikit transparansi
                                blurRadius: 6, // Tingkat keburaman shadow
                                offset: const Offset(
                                  0,
                                  2,
                                ), // Offset shadow (horizontal, vertical)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Kamar VIP',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (var i = 0; i < vipRoomCount; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Penumpang VIP ${i + 1}'),
                                        GenderSelection(controller: controller),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            // ID Type Dropdown
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                    ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    value: 'KTP',
                                                    onChanged: (newValue) {},
                                                    items:
                                                        [
                                                          'KTP',
                                                          'SIM',
                                                          'Paspor',
                                                        ].map((String value) {
                                                          return DropdownMenuItem<
                                                            String
                                                          >(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),

                                            // ID Number
                                            Expanded(
                                              flex: 5,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText: 'Nomor ID',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),

                                        // Full Name
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Nama Lengkap Sesuai ID',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        // Phone Number
                                        TextField(
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            labelText: 'Nomor Ponsel',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      PaymentMethodeDropdown(),
                      Container(
                        margin: EdgeInsets.all(16.0),
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0064D2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            if (controller.selectedVirtualAccMethod.value !=
                                null) {
                              Get.toNamed(Routes.PAYMENT, arguments: cart);
                            } else if (controller.selectedEWalletMethod.value !=
                                null) {
                              Get.toNamed(Routes.PAYMENT, arguments: cart);
                            } else if (controller
                                    .selectedCreditCardMethod
                                    .value !=
                                null) {
                              Get.toNamed(Routes.PAYMENT, arguments: cart);
                            } else if (controller.selectedQrisMethod.value !=
                                null) {
                              Get.toNamed(Routes.PAYMENT, arguments: cart);
                            } else {
                              Get.snackbar(
                                'Peringatan',
                                'Silakan pilih metode pembayaran terlebih dahulu.',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.blue,
                                colorText: Colors.white,
                                margin: const EdgeInsets.all(16),
                              );
                            }
                          },
                          child: const Text(
                            'Lanjutkan Pembayaran',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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
