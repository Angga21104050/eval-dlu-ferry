import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController identityNumberController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController villageAddressController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final Rx<File?> _profileImage = Rx<File?>(null);
  File? get profileImage => _profileImage.value;
  set profileImage(File? value) => _profileImage.value = value;

  final ImagePicker _picker = ImagePicker();

  // Rx variabel untuk menyimpan data profil
  final RxString profileName = ''.obs; // Nilai default
  final RxString profileEmail = ''.obs; // Nilai default
  final RxString profilePhone = ''.obs; // Nilai default
  final RxString profileIdentityNumber = ''.obs;
  final RxString profileGender = ''.obs;
  final RxString profileVillageAddress = ''.obs;
  final RxString profileCity = ''.obs;

  final Rx<File?> _savedProfileImage = Rx<File?>(null);
  File? get savedProfileImage => _savedProfileImage.value;
  set savedProfileImage(File? value) => _savedProfileImage.value = value;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  void loadUserProfile() {
    // Di sini Anda akan memuat data profil pengguna dari penyimpanan persisten (jika ada)
    // Untuk contoh sederhana, kita akan inisialisasi dengan nilai default atau nilai yang mungkin sudah disimpan sebelumnya
    // Contoh (setelah implementasi penyimpanan persisten):
    // final storedName = _storage.read('name');
    // profileName.value = storedName ?? 'Airlangga';
    profileName.value =
        profileName.value; // Pertahankan nilai saat ini atau default
    profileEmail.value = profileEmail.value;
    profilePhone.value = profilePhone.value;
    profileIdentityNumber.value = profileIdentityNumber.value;
    profileGender.value = profileGender.value;
    profileVillageAddress.value = profileVillageAddress.value;
    profileCity.value = profileCity.value;
    _savedProfileImage.value = _savedProfileImage.value;
  }

  

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print('Path gambar yang dipilih: ${profileImage?.path}');
    } else {
      print('Tidak ada gambar yang dipilih.');
    }
  }

  void saveProfile() async {
    String email = emailController.text;
    String identityNumber = identityNumberController.text;
    String name = nameController.text;
    String gender = genderController.text;
    String villageAddress = villageAddressController.text;
    String city = cityController.text;
    String phoneNumber = phoneNumberController.text;
    File? currentProfileImage = profileImage;

    // Update Rx variabel dengan data terbaru
    profileName.value = name;
    profileEmail.value = email;
    profilePhone.value = phoneNumber;
    profileIdentityNumber.value = identityNumber;
    profileGender.value = gender;
    profileVillageAddress.value = villageAddress;
    profileCity.value = city;
    if (currentProfileImage != null) {
      _savedProfileImage.value = currentProfileImage;
      // Di sini Anda perlu mengimplementasikan logika untuk menyimpan file gambar secara persisten
      print("Path gambar disimpan: ${currentProfileImage.path}");
    }

    // Di sini Anda juga perlu mengimplementasikan penyimpanan data teks secara persisten
    // Contoh (setelah implementasi penyimpanan persisten):
    // _storage.write('name', name);
    // _storage.write('email', email);
    // ... dan seterusnya

    Get.snackbar("Sukses", "Profil berhasil diperbarui");
    // Contoh kembali ke halaman profil: Get.back();
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
