import 'package:flutter/material.dart';

class CitySwitcher extends StatefulWidget {
  const CitySwitcher({super.key});

  @override
  _CitySwitcherState createState() => _CitySwitcherState();
}

class _CitySwitcherState extends State<CitySwitcher> {
  String _fromCity = 'Jakarta';
  String _toCity = 'Bandung';

  void swapCities() {
    setState(() {
      String temp = _fromCity;
      _fromCity = _toCity;
      _toCity = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Column(
                children: [
                  // Dropdown Kota Keberangkatan
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(
                          Icons.directions_boat_outlined,
                          size: 24,
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6, right: 10),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Dari',
                              border: InputBorder.none,
                            ),
                            value: _fromCity,
                            items: [
                              DropdownMenuItem(
                                value: 'Jakarta',
                                child: Text('Jakarta'),
                              ),
                              DropdownMenuItem(
                                value: 'Bandung',
                                child: Text('Bandung'),
                              ),
                              DropdownMenuItem(
                                value: 'Surabaya',
                                child: Text('Surabaya'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                _fromCity = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade300, // Warna garis
                    thickness: 1, // Ketebalan garis
                    height: 1, // Mengurangi ruang kosong di atas & bawah garis
                  ),
                  // Dropdown Kota Tujuan
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(
                          Icons.directions_boat_outlined,
                          size: 24,
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6, right: 10),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Ke',
                              border: InputBorder.none,
                            ),
                            value: _toCity,
                            items: [
                              DropdownMenuItem(
                                value: 'Jakarta',
                                child: Text('Jakarta'),
                              ),
                              DropdownMenuItem(
                                value: 'Bandung',
                                child: Text('Bandung'),
                              ),
                              DropdownMenuItem(
                                value: 'Surabaya',
                                child: Text('Surabaya'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                _toCity = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Tombol Tukar Posisi di Tengah
              Positioned(
                right: 50,
                // Posisikan tombol di tengah kedua dropdown
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(44)),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.swap_vert, color: Colors.black),
                    iconSize: 22,
                    onPressed: swapCities,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
