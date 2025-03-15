import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../components/app_bar.dart';
import 'input_form_ticket.dart';
import '../components/navigation_bar.dart' as custom;

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 4, 75, 174),
              Colors.blue.shade700,
              Colors.blue.shade50,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            // Tambahkan Container untuk memastikan background full
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(
                    context,
                  ).size.height, // Pastikan tinggi sesuai layar
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  // container 1 AppBar
                  CustomAppBar(
                    greeting: "Selamat Malam",
                    userName: "Airlangga Maulana Anwar",
                  ),
                  // container 2 form ticket
                  InputFormTicket(),
                  // container iklan
                  Container(
                    height: 200,
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      image: DecorationImage(
                        image: AssetImage('assets/img/iklan_2.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 5),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // memanggil widget NavigationBar
      ),
      bottomNavigationBar: custom.NavigationBar(),
    );
  }
}
