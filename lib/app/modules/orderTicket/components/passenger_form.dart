import 'package:flutter/material.dart';

class PassengerForm extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const PassengerForm({super.key, required this.cartItems});

  @override
  State<PassengerForm> createState() => _PassengerFormState();
}

class _PassengerFormState extends State<PassengerForm> {
  bool _isExpanded = false; // 🔹 Kontrol tampilan form
  String selectedGender = 'Laki-Laki';
  String selectedIdType = 'KTP';

  List<TextEditingController> idNumberControllers = [];
  List<TextEditingController> fullNameControllers = [];
  List<TextEditingController> phoneControllers = [];
  List<String> selectedGenders = [];
  List<String> selectedIdTypes = [];

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller untuk setiap penumpang
    for (var item in widget.cartItems) {
      for (var i = 0; i < item['count']; i++) {
        idNumberControllers.add(TextEditingController());
        fullNameControllers.add(TextEditingController());
        phoneControllers.add(TextEditingController());
        selectedGenders.add('Laki-Laki');
        selectedIdTypes.add('KTP');
      }
    }
  }

  @override
  void dispose() {
    // Dispose semua controller
    for (var controller in idNumberControllers) {
      controller.dispose();
    }
    for (var controller in fullNameControllers) {
      controller.dispose();
    }
    for (var controller in phoneControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalPassengers = widget.cartItems.fold(0, (sum, item) => sum + (item['count'] as int));

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
          ListTile(
            title: Text(
              'Penumpang ($totalPassengers orang)',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isExpanded ? null : 0,
            padding: _isExpanded ? const EdgeInsets.all(16.0) : EdgeInsets.zero,
            child: _isExpanded ? _buildPassengerForms() : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPassengerForms() {
    int passengerIndex = 0;
    return Column(
      children: widget.cartItems.expand((item) {
        List<Widget> forms = [];
        for (int i = 0; i < item['count']; i++) {
          forms.add(_buildSinglePassengerForm(
            passengerIndex: passengerIndex + 1,
            classType: item['class'],
            index: passengerIndex,
          ));
          passengerIndex++;
        }
        return forms;
      }).toList(),
    );
  }

  Widget _buildSinglePassengerForm({
    required int passengerIndex,
    required String classType,
    required int index,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Penumpang $passengerIndex ($classType)',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 10),
        
        // Gender Selection
        Row(
          children: [
            _buildGenderOption('Laki-Laki', index),
            const SizedBox(width: 10),
            _buildGenderOption('Perempuan', index),
          ],
        ),
        const SizedBox(height: 16),

        // ID Type and Number
        Row(
          children: [
            // ID Type Dropdown
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedIdTypes[index],
                    onChanged: (newValue) {
                      setState(() {
                        selectedIdTypes[index] = newValue!;
                      });
                    },
                    items: ['KTP', 'SIM', 'Paspor'].map((String value) {
                      return DropdownMenuItem<String>(
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
                controller: idNumberControllers[index],
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

        // Full Name
        TextField(
          controller: fullNameControllers[index],
          decoration: InputDecoration(
            labelText: 'Nama Lengkap Sesuai ID',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Phone Number
        TextField(
          controller: phoneControllers[index],
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Nomor Ponsel',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGenderOption(String gender, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGenders[index] = gender;
        });
      },
      child: Row(
        children: [
          Radio<String>(
            value: gender,
            groupValue: selectedGenders[index],
            onChanged: (value) {
              setState(() {
                selectedGenders[index] = value!;
              });
            },
          ),
          Text(gender),
        ],
      ),
    );
  }
}
