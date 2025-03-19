import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'city_switcher.dart';
import 'date_picker.dart';
import 'round_trip_switch.dart';
import 'ticket_type.dart';
import 'ticket_class.dart';
import '../controllers/home_controller.dart';

// membuat form input tiket
class InputFormTicket extends StatefulWidget {
  const InputFormTicket({Key? key}) : super(key: key);

  // membuat state dari form input tiket berfungsi untuk mengatur perubahan data pada form
  @override
  _InputFormTicketState createState() => _InputFormTicketState();
}

class _InputFormTicketState extends State<InputFormTicket> {
  // mengcontrol fungsi calendar
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDepartureDate = DateTime.now();
  DateTime? _selectedReturnDate;
  bool _isRoundTrip = false; // Mengontrol Pulang Pergi
  // mengontrol fungsi jenis tiket
  List<String> _selectedTicketTypes = [];
  // mengontrol class tiket
  final HomeController homeController = Get.find<HomeController>();
  String _selectedPassengerClass = 'Semua Kelas';
  String _selectedVehicleClass = 'Semua Kelas';
  String _selectedVipRoomClass = 'Semua Kelas';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 300),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        // membuat shadow pada sisi bawah container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              CitySwitcher(),
              DatePickerWidget(
                initialDate: _selectedDate,
                labelText: "Tangal Pergi",
                onDateSelected: (DateTime newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              RoundTripSwitch(
                isRoundTrip: _isRoundTrip,
                onChanged: (bool value) {
                  setState(() {
                    _isRoundTrip = value;
                    if (value) {
                      _selectedReturnDate = _selectedDepartureDate;
                    } else {
                      _selectedReturnDate = null;
                    }
                  });
                },
              ),
              // tanggal pulang muncul jika value pulang pergi terisi
              if (_isRoundTrip)
                DatePickerWidget(
                  initialDate: _selectedReturnDate ?? _selectedDepartureDate,
                  labelText: "Tanggal Pulang",
                  onDateSelected: (DateTime newDate) {
                    setState(() {
                      _selectedReturnDate = newDate;
                    });
                  },
                ),
              // jenis tiket
              TicketType(
                selectedItemsType: _selectedTicketTypes,
                onSelectionChanged: (List<String> selected) {
                  setState(() {
                    _selectedTicketTypes = selected;
                  });
                }, // Add the required child parameter
              ),
              // membuat dropdown untuk memilih kelas
              if (_selectedTicketTypes.contains('Penumpang'))
                TicketClassDropdown(
                  label: 'Kelas Penumpang',
                  items: homeController.passengerClasses,
                  selectedValue: _selectedPassengerClass,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPassengerClass = newValue!;
                    });
                  },
                ),

              if (_selectedTicketTypes.contains('Kendaraan'))
                TicketClassDropdown(
                  label: 'Kelas Kendaraan',
                  items: homeController.vehicleClasses,
                  selectedValue: _selectedVehicleClass,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedVehicleClass = newValue!;
                    });
                  },
                ),

              if (_selectedTicketTypes.contains('Kamar VIP'))
                TicketClassDropdown(
                  label: 'Kelas Kamar VIP',
                  items: homeController.vipRoomClasses,
                  selectedValue: _selectedVipRoomClass,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedVipRoomClass = newValue!;
                    });
                  },
                ),

              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue.shade400,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Proses pemesanan tiket
                  },
                  child: Text(
                    'Cari Tiket',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
