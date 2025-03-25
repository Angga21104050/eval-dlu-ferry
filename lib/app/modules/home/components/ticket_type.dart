import 'package:flutter/material.dart';
import '../../../data/list_tiket_dummy.dart'; // Pastikan import sesuai path

class TicketType extends StatefulWidget {
  final List<String> selectedItemsType;
  final Function(List<String>) onSelectionChanged;

  const TicketType({
    Key? key,
    required this.selectedItemsType,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _TicketTypeState createState() => _TicketTypeState();
}

class _TicketTypeState extends State<TicketType> {
  List<String> _selectedItemsType = [];

  @override
  void initState() {
    super.initState();
    _selectedItemsType = List.from(widget.selectedItemsType);
  }

  void _showMultiSelectDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 350,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Pilih Jenis Tiket",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(color: Colors.blue),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children:
                          availableTicketTypes.map((type) {
                            IconData iconData;
                            switch (type) {
                              case "Penumpang":
                                iconData = Icons.person_2_outlined;
                                break;
                              case "Kendaraan":
                                iconData = Icons.directions_car_outlined;
                                break;
                              case "Kamar VIP":
                                iconData = Icons.hotel_outlined;
                                break;
                              default:
                                iconData = Icons.airplane_ticket;
                            }
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: CheckboxListTile(
                                activeColor: Colors.blue,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                title: Row(
                                  children: [
                                    Icon(iconData, color: Colors.blue),
                                    SizedBox(width: 10),
                                    Expanded(child: Text(type)),
                                  ],
                                ),
                                value: _selectedItemsType.contains(type),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      _selectedItemsType.add(type);
                                    } else {
                                      _selectedItemsType.remove(type);
                                    }
                                  });
                                },
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onSelectionChanged(_selectedItemsType);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                    ),
                    child: Text("Simpan"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 0),
      child: InkWell(
        onTap: () => _showMultiSelectDialog(context),
        child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            labelText: 'Jenis Tiket',
            labelStyle: TextStyle(color: Colors.grey.shade600),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            suffixIcon: Icon(Icons.arrow_drop_down),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Icon(
                  Icons.confirmation_num_outlined,
                  color: Colors.blue,
                  size: 25,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: RichText(
                    text: TextSpan(
                      text:
                          _selectedItemsType.isEmpty ? 'Pilih Jenis Tiket' : '',
                      style: TextStyle(color: Colors.grey.shade600),
                      children:
                          _selectedItemsType.isEmpty
                              ? []
                              : [
                                TextSpan(
                                  text: _selectedItemsType.join(', '),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
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
