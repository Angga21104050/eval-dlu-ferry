import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTicketController extends GetxController {
  // Properti untuk menyimpan gender yang dipilih
  var gender = 'Laki Laki'.obs;

  // Fungsi untuk memperbarui gender saat pengguna memilih opsi
  void updateGender(String value) {
    gender.value = value;
  }

  

  // State dan data untuk dropdown Virtual Account
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

  // State dan data untuk dropdown E-Wallet
  var isExpandedEWallet = false.obs;
  var selectedEWalletMethod = Rxn<String>();
  List<String> eWalletMethod = ['GoPay', 'OVO', 'Dana', 'ShopeePay'];

  // State dan data untuk dropdown Credit Card
  var isExpandedCreditCard = false.obs;
  var selectedCreditCardMethod = Rxn<String>();
  List<String> creditCardMethod = ['Visa', 'Mastercard', 'American Express'];

  // State dan data untuk dropdown QRIS
  var isExpandedQris = false.obs;
  var selectedQrisMethod = Rxn<String>();
  List<String> qrisMethod = ['QRIS'];

  // Fungsi untuk menampilkan snackbar
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
    // Tutup dropdown lain jika dibuka
    if (isExpandedCreditCard.value) {
      isExpandedVirtualAcc.value = false;
      isExpandedEWallet.value = false;
      isExpandedQris.value = false;
    }
  }

  void selectCreditCardMethod(String? method) {
    selectedCreditCardMethod.value = method;
    isExpandedCreditCard.value = false;
    // Reset pilihan dari dropdown lain
    selectedVirtualAccMethod.value = null;
    selectedEWalletMethod.value = null;
    selectedQrisMethod.value = null;
    if (method != null) {
      showPaymentMethodChangedSnackbar(method);
    }
  }

  void toggleQrisDropdown() {
    isExpandedQris.value = !isExpandedQris.value;
    // Tutup dropdown lain jika dibuka
    if (isExpandedQris.value) {
      isExpandedVirtualAcc.value = false;
      isExpandedEWallet.value = false;
      isExpandedCreditCard.value = false;
    }
  }

  void selectQrisMethod(String? method) {
    selectedQrisMethod.value = method;
    isExpandedQris.value = false;
    // Reset pilihan dari dropdown lain
    selectedVirtualAccMethod.value = null;
    selectedEWalletMethod.value = null;
    selectedCreditCardMethod.value = null;
    if (method != null) {
      showPaymentMethodChangedSnackbar(method);
    }
  }

  // Fungsi untuk menentukan path gambar berdasarkan nama metode
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
    return 'assets/images/default.png'; // Default return statement
  }

  final isScrolled = false.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    
    scrollController.addListener(() {
      if (scrollController.offset > 100 && !isScrolled.value) {
        isScrolled.value = true;
      } else if (scrollController.offset <= 100 && isScrolled.value) {
        isScrolled.value = false;
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
