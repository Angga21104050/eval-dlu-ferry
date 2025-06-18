import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProfileController extends GetxController {
  final emailController = TextEditingController(text: 'airlangga@example.com');
  final identityNumberController = TextEditingController(text: '23435435242');
  final nameController = TextEditingController(text: 'anggaaa');
  final genderController = TextEditingController(text: 'Laki Laki');
  final villageAddressController = TextEditingController(text: 'Karangklesem');
  final cityController = TextEditingController(text: 'Purwokerto');
  final phoneNumberController = TextEditingController(text: '0876446788532');

  @override
  void onInit() {
    super.onInit();
  }

  void saveProfile() {
    final profileData = {
      'email': emailController.text,
      'identityNumber': identityNumberController.text,
      'name': nameController.text,
      'gender': genderController.text,
      'villageAddress': villageAddressController.text,
      'city': cityController.text,
      'phoneNumber': phoneNumberController.text,
    };

    Get.snackbar(
      'Berhasil',
      'Perubahan profil berhasil disimpan.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );

    print('Data Profil yang Disimpan: $profileData');

    Get.toNamed('/', arguments: profileData);
  }

  @override
  void onClose() {
    emailController.dispose();
    identityNumberController.dispose();
    nameController.dispose();
    genderController.dispose();
    villageAddressController.dispose();
    cityController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
