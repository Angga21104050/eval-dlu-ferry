import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleForm extends StatelessWidget {
  final int vehicleCount;

  const VehicleForm({super.key, required this.vehicleCount});

  @override
  Widget build(BuildContext context) {
    final RxBool isExpanded = false.obs;

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
                  ), // Tambahkan icon penumpang di sini
                ),
                Expanded(
                  child: ListTile(
                    title: const Text(
                      'Kendaraan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
                  children: List.generate(vehicleCount, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: .0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kendaraan ${i + 1}'),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
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
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 5,
                                child: TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: 'Nama Pemilik Sesuai STNK',
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Alamat',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Nomor Polisi',
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
