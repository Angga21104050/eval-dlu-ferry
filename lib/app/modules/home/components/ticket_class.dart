import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

class TicketClassDropdown extends StatefulWidget {
  final String label;
  final List<String> items;
  final String selectedValue;
  final ValueChanged<String> onChanged;

  const TicketClassDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TicketClassDropdownState createState() => _TicketClassDropdownState();
}

class _TicketClassDropdownState extends State<TicketClassDropdown> {
  static const Set<String> _passengerClasses = {
    'Kelas I',
    'Kelas II',
    'Kelas III',
    'Ekonomi',
    'Ekonomi Tidur',
    'Ekonomi Duduk',
    'Executive Seat',
    'Ekonomi - Non Seat',
    'Cabin',
    'Single Cabin',
    'Double Cabin',
    'Vip Suites',
  };

  static const Set<String> vehicleKeywords = {
    'Sepeda',
    'Sepeda Motor',
    'Kend.',
    'Truk',
    'Alat Berat',
  };

  IconData _getIcon(String value) {
    if (_isPassengerClass(value)) {
      return Icons.airline_seat_recline_extra_rounded; // Ikon untuk penumpang
    } else if (_isVehicleClass(value)) {
      return Icons.directions_car_filled_outlined; // Ikon untuk kendaraan
    } else if (value.contains('VIP')) {
      return Icons.local_hotel_outlined;
    } else {
      return Icons.all_inclusive; // Ikon default untuk "Semua Kelas"
    }
  }

  bool _isPassengerClass(String value) {
    return _passengerClasses.contains(value);
  }

  bool _isVehicleClass(String value) {
    return vehicleKeywords.any((keyword) => value.contains(keyword));
  }

  // membuat pop up
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Agar efek lebih halus
      barrierColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: Duration(milliseconds: 500), // Durasi animasi
      ),
      builder: (context) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500), // Animasi transisi
          curve: Curves.easeOut, // Efek animasi lebih halus
          height: 500, // Tinggi modal kalender
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pilih ${widget.label}",
                    style: semiBold.copyWith(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    String item = widget.items[index];
                    return ListTile(
                      title: Text(
                        item,
                        style: medium.copyWith(
                          fontSize: 16,
                          color:
                              widget.selectedValue == item
                                  ? Color(0xFF0064D2)
                                  : Colors.black,
                        ),
                      ),
                      trailing:
                          widget.selectedValue == item
                              ? Icon(Icons.check, color: Color(0xFF0064D2))
                              : null,
                      onTap: () {
                        widget.onChanged(item);
                        Navigator.pop(context);
                      },
                    );
                  },
                  separatorBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: const Divider(
                          height: 1,
                          color: Color(0xFFD0CBCB),
                        ),
                      ),
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
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: InkWell(
        onTap:
            () => _showBottomSheet(context), // Menggunakan modal bottom sheet
        borderRadius: BorderRadius.circular(10), // Efek ripple saat diklik
        child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            labelText: widget.label,
            labelStyle: regular.copyWith(
              fontSize: 14,
              color: Color(0xFF757575),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: const Color(0xFFD0CBCB), width: 1),
            ),
            suffixIcon: Icon(Icons.arrow_drop_down),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Icon(
                  _getIcon(widget.selectedValue), // Panggil method _getIcon
                  color: Color(0xFF0064D2),
                  size: 25,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text.rich(
                    TextSpan(
                      text:
                          widget.selectedValue == 'Semua Kelas'
                              ? widget.selectedValue
                              : '',
                      children:
                          widget.selectedValue == 'Semua Kelas'
                              ? []
                              : [
                                TextSpan(
                                  text: widget.selectedValue,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                      style: medium.copyWith(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
