import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/text_style.dart';

class HeaderOrderTicket extends StatefulWidget {
  const HeaderOrderTicket({super.key});

  @override
  State<HeaderOrderTicket> createState() => _HeaderOrderTicketState();
}

class _HeaderOrderTicketState extends State<HeaderOrderTicket> {
  late Timer _timer;
  int _remainingSeconds = 1800;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  String get formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0064D2),
            Color(0xFF0064D2),
            Color(0xFF0064D2),
            Color(0xFF00DDFF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        image: DecorationImage(
          image: AssetImage("assets/img/map-global.png"),
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 26),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Get.back(),
                    ),
                    Text(
                      'Pesan Tiket',
                      style: semiBold.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 48, right: 20),
                  child: Text(
                    'Lengkapi detail di bawah ini untuk melanjutkan pemesanan tiket Anda.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 35,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Sisa Waktu: $formattedTime',
                style: medium.copyWith(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
