import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dlu_project/app/routes/app_pages.dart'; // Pastikan path ini benar

class SplashView extends StatefulWidget {
  // Menggunakan StatefulWidget karena kita akan mengelola lifecycle
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Logika delay dan navigasi langsung di View (TIDAK DISARANKAN)
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 0, 61, 126),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 170,
                height: 170,
                child: Center(
                  child: Image.asset(
                    'assets/img/logo.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error_outline,
                        size: 80,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
