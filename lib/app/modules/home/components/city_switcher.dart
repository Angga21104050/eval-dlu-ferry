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
    if (_cities.isNotEmpty) {
      homeController.setFromCity(_cities[0]);
      homeController.setToCity(_cities.length > 1 ? _cities[1] : _cities[0]);
    }
  }

  void swapCities() {
    homeController.swapCities();
  }

  void _showCitySelection(BuildContext context, bool isFromCity) {
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
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut,
              height: 800,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isFromCity
                        ? "Pilih Kota Keberangkatan"
                        : "Pilih Kota Tujuan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(color: Colors.blue),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari Pelabuhan...',
                        prefixIcon: Icon(Icons.search_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onChanged: (value) {
                        setModal(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
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
                                      (isFromCity ? homeController.fromCity.value : homeController.toCity.value) == city
                                          ? Colors.blue
                                          : Colors.black,
                                ),
                              ),
                              trailing:
                                  (isFromCity ? homeController.fromCity.value : homeController.toCity.value) == city
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                              onTap: () {
                                setState(() {
                                  if (isFromCity) {
                                    homeController.fromCity.value = city;
                                  } else {
                                    homeController.toCity.value = city;
                                  }
                                });
                                Navigator.pop(context);
                              },
                            );
                          }).toList(),
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
                        child: InkWell(
                          onTap: () => _showCitySelection(context, true),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, right: 50),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Dari',
                                border: InputBorder.none,
                              ),
                              child: Text(
                                homeController.fromCity.value,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                overflow:
                                    TextOverflow.ellipsis, // Tambahkan ini
                                maxLines: 1, // Pastikan hanya satu baris
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(
                          Icons.directions_boat_outlined,
                          size: 24,
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => _showCitySelection(context, false),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, right: 50),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Ke',
                                border: InputBorder.none,
                              ),
                              child: Text(
                                homeController.toCity.value,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                overflow:
                                    TextOverflow.ellipsis, // Tambahkan ini
                                maxLines: 1, // Pastikan hanya satu baris
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
