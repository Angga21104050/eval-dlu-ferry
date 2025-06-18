import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';
import 'gender_selection.dart';
import '../../../data/list_tiket_dummy.dart';
import '../../../constants/text_style.dart';

class PassengerForm extends StatefulWidget {
  final int passengerCount;
  final OrderTicketController controller;
  final List<Map<String, dynamic>> cart;

  const PassengerForm({
    super.key,
    required this.passengerCount,
    required this.controller,
    required this.cart,
  });

  @override
  State<PassengerForm> createState() => _PassengerFormState();
}

class _PassengerFormState extends State<PassengerForm> {
  final RxBool isExpanded = false.obs;
  late List<Map<String, dynamic>> passengerItems;

  @override
  void initState() {
    super.initState();
    final List<String> passengerCategories = getPassengerCategoryNames();
    passengerItems =
        widget.cart
            .where((item) => passengerCategories.contains(item['class']))
            .toList();
  }

  final RxString selectedIdType = 'KTP'.obs;

  void _showIdTypePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        final List<String> idTypes = ['KTP', 'PASSPORT', 'SIM', 'KK'];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pilih Tipe ID', style: semiBold.copyWith(fontSize: 24)),
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
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: const Color(
                  0xFF0064D2,
                ).withOpacity(0.35),
                blurRadius: 6,
                offset: const Offset(
                  0,
                  4,
                ), 
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
                    Icons.person_2_outlined,
                    color: Color(0xFF0064D2),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Penumpang',
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: List.generate(passengerItems.length, (i) {
                    final passenger = passengerItems[i];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Penumpang ${i + 1} (${passenger['class']})',
                            style: medium.copyWith(fontSize: 14),
                          ),
                          GenderSelection(controller: widget.controller),

                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () => _showIdTypePicker(context),
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
                                    keyboardType: TextInputType.number,
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
                                        ),
                                      ),
                                      labelText: 'Nomor ID',
                                      labelStyle: regular.copyWith(
                                        fontSize: 14,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Color(0xFF9D9D9D),
                                        ),
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
                                  ), 
                                ),
                                labelText: 'Nama Lengkap Sesuai ID',
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
                              keyboardType: TextInputType.phone,
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
                                  ), 
                                ),
                                labelText: 'Nomor Ponsel',
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
                              keyboardType: TextInputType.text,
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
                                  ),
                                ),
                                labelText: 'Kota',
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
                                  'Tarif Penumpang',
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
                                  'Pass Penumpang',
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
