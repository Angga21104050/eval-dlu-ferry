import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/change_password_controller.dart';
import '../../../constants/text_style.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color(0xFF0064D2),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Ganti Password',
              style: semiBold.copyWith(fontSize: 22, color: Colors.white),
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              // Password Lama
              Obx(
                () => TextFormField(
                  controller: controller.oldPasswordController,
                  obscureText: !controller.showOldPassword.value,
                  decoration: InputDecoration(
                    labelText: 'Password Lama',
                    labelStyle: light.copyWith(fontSize: 14),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.showOldPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => controller.toggleShowOldPassword(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan password lama';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Password Baru
              Obx(
                () => TextFormField(
                  controller: controller.newPasswordController,
                  obscureText: !controller.showNewPassword.value,
                  decoration: InputDecoration(
                    labelText: 'Password Baru',
                    labelStyle: light.copyWith(fontSize: 14),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.showNewPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => controller.toggleShowNewPassword(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan password baru';
                    }
                    if (value.length < 8) {
                      return 'Password minimal 8 karakter';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Konfirmasi Password Baru
              Obx(
                () => TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: !controller.showConfirmPassword.value,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Password Baru',
                    labelStyle: light.copyWith(fontSize: 14),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.showConfirmPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => controller.toggleShowConfirmPassword(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value != controller.newPasswordController.text) {
                      return 'Password tidak sama';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Submit
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0064D2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => controller.changePassword(),
                  child: Text(
                    'GANTI PASSWORD',
                    style: semiBold.copyWith(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
