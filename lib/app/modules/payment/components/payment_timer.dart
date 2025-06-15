import 'package:flutter/material.dart';
import 'dart:async';
import '../../../constants/text_style.dart';

class PaymentTimer extends StatefulWidget {
  const PaymentTimer({super.key});

  @override
  State<PaymentTimer> createState() => _PaymentTimerState();
}

class _PaymentTimerState extends State<PaymentTimer> {
  Duration _duration = const Duration(hours: 1); // Ubah durasi menjadi 1 jam
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration = _duration - const Duration(seconds: 1);
        } else {
          _timer?.cancel();
          // Tambahkan logika ketika waktu habis di sini
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String minutes = twoDigits(duration.inMinutes.remainder(60));
    final String seconds = twoDigits(duration.inSeconds.remainder(60));
    final String hours = twoDigits(duration.inHours);
    return '$hours : $minutes : $seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 0, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sisa Waktu Pembayaran :',
            style: medium.copyWith(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeSegment(
                _formatDuration(
                  Duration(
                    hours: _duration.inHours,
                    minutes: _duration.inMinutes.remainder(60),
                    seconds: _duration.inSeconds.remainder(60),
                  ),
                ).split(':')[0].trim(),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(':', style: medium.copyWith(color: Colors.white)),
              ),
              _buildTimeSegment(
                _formatDuration(
                  Duration(
                    hours: _duration.inHours,
                    minutes: _duration.inMinutes.remainder(60),
                    seconds: _duration.inSeconds.remainder(60),
                  ),
                ).split(':')[1].trim(),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(':', style: medium.copyWith(color: Colors.white)),
              ),
              _buildTimeSegment(
                _formatDuration(
                  Duration(
                    hours: _duration.inHours,
                    minutes: _duration.inMinutes.remainder(60),
                    seconds: _duration.inSeconds.remainder(60),
                  ),
                ).split(':')[2].trim(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSegment(String time) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 0.6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          time,
          style: medium.copyWith(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
