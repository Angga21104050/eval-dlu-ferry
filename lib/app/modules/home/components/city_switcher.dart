import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/port_city.dart';
import '../controllers/home_controller.dart';

class CitySwitcher extends StatefulWidget {
  const CitySwitcher({super.key});

  @override
  _CitySwitcherState createState() => _CitySwitcherState();
}

class _CitySwitcherState extends State<CitySwitcher> {
  final HomeController homeController = Get.find();
  final List<String> _cities = portCityList;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    print('CitySwitcherState: initState dijalankan');
    if (_cities.isNotEmpty) {
      homeController.setFromCity(_cities[0]);
      homeController.setToCity(_cities.length > 1 ? _cities[1] : _cities[0]);
      print(
        'CitySwitcherState: Kota awal diatur - Dari: ${homeController.fromCity.value}, Ke: ${homeController.toCity.value}',
      );
    }
  }

  void swapCities() {
    print(
      'CitySwitcherState: swapCities dipanggil - Sebelum swap - Dari: ${homeController.fromCity.value}, Ke: ${homeController.toCity.value}',
    );
    homeController.swapCities();
    print(
      'CitySwitcherState: swapCities selesai - Setelah swap - Dari: ${homeController.fromCity.value}, Ke: ${homeController.toCity.value}',
    );
  }

  void _showCitySelection(BuildContext context, bool isFromCity) {
    print(
      'CitySwitcherState: _showCitySelection dipanggil - isFromCity: $isFromCity',
    );
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        print('CitySwitcherState: _showCitySelection - Builder dijalankan');
        return StatefulBuilder(
          builder: (context, setModal) {
            List<String> filteredCities =
                _cities
                    .where(
                      (city) => city.toLowerCase().contains(
                        _searchQuery.toLowerCase(),
                      ),
                    )
                    .toList();
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              height: 800,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8,
                    ),
                    child: Text(
                      isFromCity
                          ? "Pilih Kota Keberangkatan"
                          : "Pilih Kota Tujuan",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 32,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          print(
                            'CitySwitcherState: _showCitySelection - Tombol Back ditekan, bottom sheet ditutup',
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari Pelabuhan...',
                              prefixIcon: const Icon(Icons.search_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: Color(0xFF5F00D2),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setModal(() {
                                _searchQuery = value;
                                print(
                                  'CitySwitcherState: _showCitySelection - Search query diubah: $_searchQuery',
                                );
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ), // Warna latar belakang card
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // Membuat sudut melengkung
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                              0.3,
                            ), // Warna shadow lebih samar
                            spreadRadius: 1, // Penyebaran shadow lebih kecil
                            blurRadius: 3, // Keburaman shadow lebih halus
                            offset: Offset(
                              0,
                              2,
                            ), // Offset shadow sedikit ke bawah
                          ),
                        ],
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children:
                            filteredCities.map((String city) {
                              return ListTile(
                                title: Text(
                                  city,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        (isFromCity
                                                    ? homeController
                                                        .fromCity
                                                        .value
                                                    : homeController
                                                        .toCity
                                                        .value) ==
                                                city
                                            ? Color(0xFF5F00D2)
                                            : Colors.black,
                                  ),
                                ),
                                trailing:
                                    (isFromCity
                                                ? homeController.fromCity.value
                                                : homeController
                                                    .toCity
                                                    .value) ==
                                            city
                                        ? const Icon(
                                          Icons.check,
                                          color: Color(0xFF5F00D2),
                                        )
                                        : null,
                                onTap: () {
                                  print(
                                    'CitySwitcherState: _showCitySelection - Kota dipilih: $city, isFromCity: $isFromCity',
                                  );
                                  setState(() {
                                    if (isFromCity) {
                                      homeController.fromCity.value = city;
                                      print(
                                        'CitySwitcherState: _showCitySelection - Kota keberangkatan diubah menjadi: ${homeController.fromCity.value}',
                                      );
                                    } else {
                                      homeController.toCity.value = city;
                                      print(
                                        'CitySwitcherState: _showCitySelection - Kota tujuan diubah menjadi: ${homeController.toCity.value}',
                                      );
                                    }
                                  });
                                  Navigator.pop(context);
                                  print(
                                    'CitySwitcherState: _showCitySelection - Bottom sheet ditutup',
                                  );
                                },
                              );
                            }).toList(),
                      ),
                    ),
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
    print(
      'CitySwitcherState: build dijalankan - Dari: ${homeController.fromCity.value}, Ke: ${homeController.toCity.value}',
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(
                          Icons.directions_boat_outlined,
                          size: 24,
                          color: Color(0xFF0064D2),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print('CitySwitcherState: InkWell (Dari) ditekan');
                            _showCitySelection(context, true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, right: 50),
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                labelText: 'Dari',
                                border: InputBorder.none,
                              ),
                              child: Obx(
                                () => Text(
                                  homeController.fromCity.value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(
                          Icons.directions_boat_outlined,
                          size: 24,
                          color: Color(0xFF0064D2),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print('CitySwitcherState: InkWell (Ke) ditekan');
                            _showCitySelection(context, false);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, right: 50),
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                labelText: 'Ke',
                                border: InputBorder.none,
                              ),
                              child: Obx(
                                () => Text(
                                  homeController.toCity.value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 15,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(44)),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.swap_vert, color: Color(0xFF5F00D2)),
                    iconSize: 24,
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
