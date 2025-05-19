import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/list_tiket_dummy.dart';
import '../../../constants/text_style.dart';

class VehicleForm extends StatefulWidget {
  final int vehicleCount;
  final List<Map<String, dynamic>> cart;

  const VehicleForm({Key? key, required this.vehicleCount, required this.cart})
    : super(key: key);

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  final RxBool isExpanded = false.obs;
  late List<Map<String, dynamic>> vehicleItems;
  late List<String> vehicleCategories;
  late List<String?> selectedCategories;

  @override
  void initState() {
    super.initState();
    // init kosong dulu, nanti isi di build
    vehicleItems = [];
    vehicleCategories = [];
    selectedCategories = [];
  }

  @override
  Widget build(BuildContext context) {
    // Ambil cart dari Get.arguments
    final List<Map<String, dynamic>> cart = Get.arguments ?? [];

    vehicleCategories = getVehicleCategoryNames();

    // Filter item yang kelasnya ada di vehicleCategories
    vehicleItems =
        cart.where((item) {
          return vehicleCategories.contains(item['class']);
        }).toList();

    // Siapkan list selectedCategories sebanyak jumlah kendaraan di cart
    if (selectedCategories.length != vehicleItems.length) {
      selectedCategories = List<String?>.filled(vehicleItems.length, null);
    }

    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
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
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.directions_car_outlined,
                    color: Color(0xFF0064D2),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Kendaraan',
                      style: semiBold.copyWith(
                        fontSize: 16,
                        color: Color(0xFF0064D2),
                      ),
                    ),
                    trailing: Icon(
                      isExpanded.value
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Color(0xFF0064D2),
                    ),
                    onTap: () => isExpanded.value = !isExpanded.value,
                  ),
                ),
              ],
            ),
            if (isExpanded.value)
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  children: List.generate(vehicleItems.length, (i) {
                    final vehicleClass = vehicleItems[i]['class'] ?? '';
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kendaraan ${i + 1} ($vehicleClass)',
                            style: medium.copyWith(fontSize: 14),
                          ),

                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: 'Motor',
                                      onChanged: (newValue) {},
                                      items:
                                          ['Motor', 'Mobil', 'Bus', 'Truk'].map(
                                            (value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            },
                                          ).toList(),
                                      style: regular.copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Nama Pemilik Sesuai STNK',
                                    labelStyle: regular.copyWith(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                              labelStyle: regular.copyWith(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Alamat',
                              labelStyle: regular.copyWith(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Nomor Polisi',
                              labelStyle: regular.copyWith(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
