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

  final RxString selectedIdType = 'Sepeda'.obs;

  void _showIdTypeVehicle(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        final List<String> idTypes = [
          'Sepeda',
          'Sepeda Motor',
          'Mobil',
          'Truck',
          'Bus',
        ];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih Tipe Kendaraan',
                style: semiBold.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 12),
              ...idTypes.map(
                (type) => Column(
                  children: [
                    ListTile(
                      title: Text(type, style: medium.copyWith(fontSize: 16)),
                      onTap: () {
                        selectedIdType.value = type;
                        Navigator.pop(context);
                      },
                    ),
                    const Divider(height: 1),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
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
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: const Color(
                  0xFF0064D2,
                ).withOpacity(0.35), // Warna shadow dengan sedikit transparansi
                blurRadius: 6, // Tingkat keburaman shadow
                offset: const Offset(
                  0,
                  4,
                ), // Offset shadow (horizontal, vertical)
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
                        fontSize: 18,
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
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: List.generate(vehicleItems.length, (i) {
                    final vehicleClass = vehicleItems[i]['class'] ?? '';
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
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
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () => _showIdTypeVehicle(context),
                                    child: Container(
                                      height: 47,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: const Color(0xFF9D9D9D),
                                          width: 0.8,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            selectedIdType.value,
                                            style: medium.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFF0064D2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 47,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFF0064D2),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      floatingLabelStyle: light.copyWith(
                                        fontSize: 14,
                                        color: Color(
                                          0xFF0064D2,
                                        ), // warna label saat fokus
                                      ),
                                      labelText: 'Nama Pemilik Sesuai STNK',
                                      labelStyle: regular.copyWith(
                                        fontSize: 14,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 47,
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFF0064D2),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                floatingLabelStyle: light.copyWith(
                                  fontSize: 14,
                                  color: Color(
                                    0xFF0064D2,
                                  ), // warna label saat fokus
                                ),
                                labelText: 'Kota/Kabupaten',
                                labelStyle: regular.copyWith(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 47,
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFF0064D2),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                floatingLabelStyle: light.copyWith(
                                  fontSize: 14,
                                  color: Color(
                                    0xFF0064D2,
                                  ), // warna label saat fokus
                                ),
                                labelText: 'Alamat',
                                labelStyle: regular.copyWith(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 47,
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFF0064D2),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                floatingLabelStyle: light.copyWith(
                                  fontSize: 14,
                                  color: Color(
                                    0xFF0064D2,
                                  ), // warna label saat fokus
                                ),
                                labelText: 'Nomor Polisi',
                                labelStyle: regular.copyWith(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tarif Kendaraan',
                                  style: medium.copyWith(
                                    fontSize: 12,
                                    color: Color(0xFF757575),
                                  ),
                                ),
                                Text(
                                  '300.000',
                                  style: semiBold.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pass Kendaraan',
                                  style: medium.copyWith(
                                    fontSize: 12,
                                    color: Color(0xFF757575),
                                  ),
                                ),
                                Text(
                                  '30.000',
                                  style: semiBold.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Subtotal Berangkat',
                                  style: medium.copyWith(
                                    fontSize: 12,
                                    color: Color(0xFF757575),
                                  ),
                                ),
                                Text(
                                  '330.000',
                                  style: semiBold.copyWith(fontSize: 12),
                                ),
                              ],
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
