import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'city_switcher.dart';
import 'date_picker.dart';
import 'round_trip_switch.dart';
import 'ticket_type.dart';
import 'ticket_class.dart';
import 'search_ticket_button.dart';
import '../controllers/home_controller.dart';
import '../../../constants/text_style.dart';

// membuat form input tiket
class InputFormTicket extends StatefulWidget {
  const InputFormTicket({Key? key}) : super(key: key);

  // membuat state dari form input tiket berfungsi untuk mengatur perubahan data pada form
  @override
  _InputFormTicketState createState() => _InputFormTicketState();
}

class _InputFormTicketState extends State<InputFormTicket> {
  // mengcontrol fungsi calendar
  DateTime _selectedDepartureDate = DateTime.now();
  DateTime? _selectedReturnDate;
  bool _isRoundTrip = false; 
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
      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Center(
                      child: Image.asset(
                        'assets/img/logo2.png',
                        width: 56,
                        height: 56,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error_outline,
                            size: 56,
                            color: Colors.red,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PT. Dharma Lautan Utama',
                        style: semiBold.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'armada pelayaran nasional',
                        style: regular.copyWith(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              const CitySwitcher(),
              Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: DatePickerWidget(
                      initialDate: _selectedDepartureDate,
                      labelText: "Pilih Tangal Pergi",
                      onDateSelected: (DateTime newDate) {
                        setState(() {
                          _selectedDepartureDate = newDate;
                          print(
                            "Tanggal Pergi dipilih: $_selectedDepartureDate",
                          );
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: RoundTripSwitch(
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
                  ),
                ],
              ),
              if (_isRoundTrip)
                DatePickerWidget(
                  initialDate: _selectedReturnDate ?? _selectedDepartureDate,
                  labelText: "Pilih Tanggal Pulang",
                  onDateSelected: (DateTime newDate) {
                    setState(() {
                      _selectedReturnDate = newDate;
                      print("Tanggal Pulang dipilih: $_selectedReturnDate");
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
                }, 
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
              // button cari tiket
              SearchTicketButton(
                onPressed: () {
                  final HomeController homeController =
                      Get.find<HomeController>();

                  // Debug: Print input sebelum filter
                  // print('Selected Departure Date: $_selectedDepartureDate');
                  // print('Selected Return Date: $_selectedReturnDate');
                  homeController.searchTickets(
                    filteredTickets: homeController.filteredTickets,
                    selectedTicketTypes: _selectedTicketTypes,
                    departureDate: _selectedDepartureDate,
                  );
                  if (homeController.filteredTickets.isNotEmpty) {
                    Get.toNamed(
                      '/ticket-search-results',
                      arguments: homeController.filteredTickets,
                    );
                  } else {
                    Get.snackbar('Oops', 'Tidak ada tiket yang sesuai.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
