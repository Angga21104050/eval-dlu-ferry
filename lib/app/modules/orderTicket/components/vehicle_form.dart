import 'package:flutter/material.dart';

class VehicleForm extends StatefulWidget {
  const VehicleForm({super.key});

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  bool _isExpanded = false; // 🔹 Kontrol tampilan form
  String selectedVehicleType = 'Mobil';
  final TextEditingController plateNumberController = TextEditingController();
  int passengerCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // 🔹 Header - Kendaraan (Selalu Ditampilkan)
          ListTile(
            title: const Text(
              'Kendaraan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),

          // 🔹 Formulir (Ditampilkan saat dropdown terbuka)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isExpanded ? null : 0,
            padding: _isExpanded ? const EdgeInsets.all(16.0) : EdgeInsets.zero,
            child: _isExpanded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔹 Dropdown Jenis Kendaraan
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedVehicleType,
                            onChanged: (newValue) {
                              setState(() {
                                selectedVehicleType = newValue!;
                              });
                            },
                            items: ['Motor', 'Mobil', 'Bus', 'Truk']
                                .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 🔹 Input Nomor Polisi
                      TextField(
                        controller: plateNumberController,
                        decoration: InputDecoration(
                          labelText: 'Nomor Polisi',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 🔹 Jumlah Penumpang dalam Kendaraan
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Jumlah Penumpang:',
                            style: TextStyle(fontSize: 14),
                          ),
                          Row(
                            children: [
                              // Tombol "-" (Kurangi jumlah penumpang)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (passengerCount > 1) passengerCount--;
                                  });
                                },
                                icon: const Icon(Icons.remove_circle_outline),
                              ),

                              Text(
                                passengerCount.toString(),
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),

                              // Tombol "+" (Tambah jumlah penumpang)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    passengerCount++;
                                  });
                                },
                                icon: const Icon(Icons.add_circle_outline),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
