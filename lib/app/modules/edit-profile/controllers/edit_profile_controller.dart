import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProfileController extends GetxController {
  final emailController = TextEditingController();
  final identityNumberController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final villageAddressController = TextEditingController();
  final cityController = TextEditingController();
  final phoneNumberController = TextEditingController();

  // Variabel Rx untuk menyimpan nilai input
  final profileEmail = RxString('');
  final profileIdentityNumber = RxString('');
  final profileName = RxString('');
  final profileGender = RxString('');
  final profileVillageAddress = RxString('');
  final profileCity = RxString('');
  final profilePhone = RxString('');

  // ... (kode pickImage Anda jika ada)

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi nilai dari controller teks ke variabel Rx (opsional, tergantung kebutuhan)
    profileEmail.value = emailController.text;
    profileIdentityNumber.value = identityNumberController.text;
    profileName.value = nameController.text;
    profileGender.value = genderController.text;
    profileVillageAddress.value = villageAddressController.text;
    profileCity.value = cityController.text;
    profilePhone.value = phoneNumberController.text;
  }

  void saveProfile() {
    final profileData = {
      'email': profileEmail.value,
      'identityNumber': profileIdentityNumber.value,
      'name': profileName.value,
      'gender': profileGender.value,
      'villageAddress': profileVillageAddress.value,
      'city': profileCity.value,
      'phoneNumber': profilePhone.value,
      // Tambahkan data lain yang ingin Anda kirim
    };

    print('Data Profil yang Disimpan: $profileData');

    // Navigasi ke halaman lain dengan mengirim arguments
    Get.toNamed('/halaman-tujuan', arguments: profileData);
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
