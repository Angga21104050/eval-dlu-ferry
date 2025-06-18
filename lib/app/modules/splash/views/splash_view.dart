import 'package:dlu_project/app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dlu_project/app/routes/app_pages.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF0064D2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 16),
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
              Container(
                margin: EdgeInsets.only(bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Center(
                        child: Image.asset(
                          'assets/img/logo-footer.png',
                          width: 60,
                          height: 60,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.error_outline,
                              size: 60,
                              color: Colors.red,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          Text(
                            'Mobile App',
                            style: regular.copyWith(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'PT. Dharma Lautan Utama',
                            style: regular.copyWith(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
