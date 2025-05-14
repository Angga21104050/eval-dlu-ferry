import 'package:flutter/material.dart';

class HeaderOrderTicket extends StatelessWidget{
  const HeaderOrderTicket({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0064D2), Color(0xFF0064D2), Colors.cyan],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              image: DecorationImage(
                image: AssetImage("assets/img/map-global.png"),
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pesan Tiket',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Lengkapi detail di bawah ini untuk melanjutkan pemesanan tiket Anda.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}