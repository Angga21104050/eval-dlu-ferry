import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final showOldPassword = false.obs;
  final showNewPassword = false.obs;
  final showConfirmPassword = false.obs;

  void toggleShowOldPassword() => showOldPassword.toggle();
  void toggleShowNewPassword() => showNewPassword.toggle();
  void toggleShowConfirmPassword() => showConfirmPassword.toggle();

  Future<void> changePassword() async {
    if (formKey.currentState!.validate()) {
      try {        
        Get.back();
        Get.snackbar(
          'Berhasil',
          'Password berhasil diubah',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          'Gagal',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}