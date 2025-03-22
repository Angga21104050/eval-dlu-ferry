import 'package:flutter/material.dart';

class PassengerForm extends StatefulWidget {
  const PassengerForm({super.key});

  @override
  State<PassengerForm> createState() => _PassengerFormState();
}

class _PassengerFormState extends State<PassengerForm> {
  bool _isExpanded = false; // 🔹 Kontrol tampilan form
  String selectedGender = 'Laki-Laki';
  String selectedIdType = 'KTP';

  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
          // 🔹 Header - Penumpang (Selalu Ditampilkan)
          ListTile(
            title: const Text(
              'Penumpang 1 (Dewasa)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              _isExpanded
                  ? Icons
                      .keyboard_arrow_up // Jika terbuka, tampilkan ikon atas
                  : Icons.keyboard_arrow_down, // Jika tertutup, ikon bawah
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),

          // 🔹 Formulir (Ditampilkan saat dropdown terbuka)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Animasi smooth
            height: _isExpanded ? null : 0, // Jika tertutup, tinggi = 0
            padding:
                _isExpanded
                    ? const EdgeInsets.all(16.0)
                    : EdgeInsets.zero, // Tambahkan padding jika terbuka
            child:
                _isExpanded
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Gender Selection
                        Row(
                          children: [
                            _buildGenderOption('Laki-Laki'),
                            const SizedBox(width: 10),
                            _buildGenderOption('Perempuan'),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Dropdown Tipe ID & Nomor ID
                        Row(
                          children: [
                            // Dropdown Tipe ID
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
                                    value: selectedIdType,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedIdType = newValue!;
                                      });
                                    },
                                    items:
                                        ['KTP', 'SIM', 'Paspor']
                                            .map<DropdownMenuItem<String>>(
                                              (String value) =>
                                                  DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  ),
                                            )
                                            .toList(),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),

                            // Input Nomor ID
                            Expanded(
                              flex: 5,
                              child: TextField(
                                controller: idNumberController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Nomor ID',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Nama Lengkap
                        TextField(
                          controller: fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Nama Lengkap Sesuai ID',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Nomor Ponsel
                        TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Nomor Ponsel',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    )
                    : null, // Jangan render widget jika form tertutup
          ),
        ],
      ),
    );
  }

  // 🔹 Widget Gender Selection
  Widget _buildGenderOption(String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Row(
        children: [
          Radio<String>(
            value: gender,
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          Text(gender),
        ],
      ),
    );
  }
}
