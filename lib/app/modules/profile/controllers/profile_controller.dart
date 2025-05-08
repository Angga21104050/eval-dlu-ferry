import 'package:get/get.dart';

import '../../edit-profile/controllers/edit_profile_controller.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final EditProfileController editProfileController = Get.put(
    EditProfileController(),
  );

  @override
  void onInit() {
    super.onInit();
    // Muat data saat ProfileController diinisialisasi
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
