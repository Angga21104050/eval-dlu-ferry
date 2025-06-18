import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/list_tiket_dummy.dart';

class OrderTicketController extends GetxController {
  var gender = 'Laki Laki'.obs;

  void updateGender(String value) {
    gender.value = value;
  }

  var isExpandedVirtualAcc = false.obs;
  var selectedVirtualAccMethod = Rxn<String>();
  List<String> virtualAccMethod = [
    'BRI Virtual Account',
    'BNI Virtual Account',
    'Mandiri Virtual Account',
    'BSI Virtual Account',
    'CIMB Virtual Account',
    'DANAMON Virtual Account',
    'PERMATA Virtual Account',
    'BCA Virtual Account',
  ];

  var isExpandedEWallet = false.obs;
  var selectedEWalletMethod = Rxn<String>();
  List<String> eWalletMethod = ['GoPay', 'OVO', 'Dana', 'ShopeePay'];

  var isExpandedCreditCard = false.obs;
  var selectedCreditCardMethod = Rxn<String>();
  List<String> creditCardMethod = ['Visa', 'Mastercard', 'American Express'];

  var isExpandedQris = false.obs;
  var selectedQrisMethod = Rxn<String>();
  List<String> qrisMethod = ['QRIS'];

  void showPaymentMethodChangedSnackbar(String methodName) {
    Get.snackbar(
      'Metode Pembayaran Diubah',
      'Metode pembayaran berhasil diubah menjadi $methodName',
      snackPosition: SnackPosition.TOP,
      colorText: Colors.black,
      margin: const EdgeInsets.all(16),
    );
  }

  void toggleVirtualAccDropdown() {
    isExpandedVirtualAcc.value = !isExpandedVirtualAcc.value;
    // Tutup dropdown lain jika dibuka
    if (isExpandedVirtualAcc.value) {
      isExpandedEWallet.value = false;
      isExpandedCreditCard.value = false;
      isExpandedQris.value = false;
    }
  }

  void selectVirtualAccMethod(String? method) {
    selectedVirtualAccMethod.value = method;
    isExpandedVirtualAcc.value = false;
    // Reset pilihan dari dropdown lain
    selectedEWalletMethod.value = null;
    selectedCreditCardMethod.value = null;
    selectedQrisMethod.value = null;
    if (method != null) {
      showPaymentMethodChangedSnackbar(method);
    }
  }

  void toggleEWalletDropdown() {
    isExpandedEWallet.value = !isExpandedEWallet.value;
    // Tutup dropdown lain jika dibuka
    if (isExpandedEWallet.value) {
      isExpandedVirtualAcc.value = false;
      isExpandedCreditCard.value = false;
      isExpandedQris.value = false;
    }
  }

  void selectEWalletMethod(String? method) {
    selectedEWalletMethod.value = method;
    isExpandedEWallet.value = false;
    // Reset pilihan dari dropdown lain
    selectedVirtualAccMethod.value = null;
    selectedCreditCardMethod.value = null;
    selectedQrisMethod.value = null;
    if (method != null) {
      showPaymentMethodChangedSnackbar(method);
    }
  }

  void toggleCreditCardDropdown() {
    isExpandedCreditCard.value = !isExpandedCreditCard.value;
    if (isExpandedCreditCard.value) {
      isExpandedVirtualAcc.value = false;
      isExpandedEWallet.value = false;
      isExpandedQris.value = false;
    }
  }

  void selectCreditCardMethod(String? method) {
    selectedCreditCardMethod.value = method;
    isExpandedCreditCard.value = false;
    selectedVirtualAccMethod.value = null;
    selectedEWalletMethod.value = null;
    selectedQrisMethod.value = null;
    if (method != null) {
      showPaymentMethodChangedSnackbar(method);
    }
  }

  void toggleQrisDropdown() {
    isExpandedQris.value = !isExpandedQris.value;
    if (isExpandedQris.value) {
      isExpandedVirtualAcc.value = false;
      isExpandedEWallet.value = false;
      isExpandedCreditCard.value = false;
    }
  }

  void selectQrisMethod(String? method) {
    selectedQrisMethod.value = method;
    isExpandedQris.value = false;
    selectedVirtualAccMethod.value = null;
    selectedEWalletMethod.value = null;
    selectedCreditCardMethod.value = null;
    if (method != null) {
      showPaymentMethodChangedSnackbar(method);
    }
  }

  String getImagePathForMethod(String method) {
    if (method.contains('BRI Virtual')) {
      return 'assets/img/briva.png';
    } else if (method.contains('BNI Virtual')) {
      return 'assets/img/bniva.png';
    } else if (method.contains('Mandiri Virtual')) {
      return 'assets/img/mandiriva.png';
    } else if (method.contains('BSI Virtual')) {
      return 'assets/img/bsiva.png';
    } else if (method.contains('CIMB Virtual')) {
      return 'assets/img/cimbva.png';
    } else if (method.contains('DANAMON Virtual')) {
      return 'assets/img/danamonva.png';
    } else if (method.contains('PERMATA Virtual')) {
      return 'assets/img/permatava.png';
    } else if (method.contains('BCA Virtual')) {
      return 'assets/img/bcava.png';
    } else if (method.contains('GoPay')) {
      return 'assets/img/gopay.png';
    } else if (method.contains('OVO')) {
      return 'assets/img/ovo.png';
    } else if (method.contains('Dana')) {
      return 'assets/img/dana.png';
    } else if (method.contains('ShopeePay')) {
      return 'assets/img/shopeepay.png';
    } else if (method.contains('Visa')) {
      return 'assets/img/visa.png';
    } else if (method.contains('Mastercard')) {
      return 'assets/img/mastercard.png';
    } else if (method.contains('American Express')) {
      return 'assets/img/amex.png';
    } else if (method.contains('QRIS')) {
      return 'assets/img/qris-logo.png';
    }
    return 'assets/images/default.png'; 
  }

  final isScrolled = false.obs;
  final scrollController = ScrollController();
  final cart = Rx<List<Map<String, dynamic>>>(Get.arguments ?? []);
  final passengerCount = 0.obs;
  final vipRoomCount = 0.obs;
  final vehicleCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    updateCounts();
    ever(cart, (_) => updateCounts()); 
    scrollController.addListener(() {
      if (scrollController.offset > 100 && !isScrolled.value) {
        isScrolled.value = true;
      } else if (scrollController.offset <= 100 && isScrolled.value) {
        isScrolled.value = false;
      }
    });
  }

  void updateCounts() {
    passengerCount.value = cart.value
        .where((item) => dummyTicketTypes
            .firstWhere((t) => t.type == 'Penumpang')
            .categories
            .any((cat) => cat.categoryName == item['class']))
        .fold(0, (sum, item) => sum + (item['count'] as int));

    vipRoomCount.value = cart.value
        .where((item) => dummyTicketTypes
            .firstWhere((t) => t.type == 'Kamar VIP')
            .categories
            .any((cat) => cat.categoryName == item['class']))
        .fold(0, (sum, item) => sum + (item['count'] as int));

    vehicleCount.value = cart.value
        .where((item) => dummyTicketTypes
            .firstWhere((t) => t.type == 'Kendaraan')
            .categories
            .any((cat) => cat.categoryName == item['class']))
        .fold(0, (sum, item) => sum + (item['count'] as int));
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
