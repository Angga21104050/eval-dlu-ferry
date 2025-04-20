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
  List<String> eWalletMethod = [
    'GoPay',
    'OVO',
    'Dana',
    'ShopeePay',
  ];

  // State dan data untuk dropdown Credit Card
  var isExpandedCreditCard = false.obs;
  var selectedCreditCardMethod = Rxn<String>();
  List<String> creditCardMethod = [
    'Visa',
    'Mastercard',
    'American Express',
  ];

  // State dan data untuk dropdown QRIS
  var isExpandedQris = false.obs;
  var selectedQrisMethod = Rxn<String>();
  List<String> qrisMethod = [
    'QRIS',
  ];

  void toggleVirtualAccDropdown() {
    isExpandedVirtualAcc.value = !isExpandedVirtualAcc.value;
  }

  void selectVirtualAccMethod(String? method) {
    selectedVirtualAccMethod.value = method;
    isExpandedVirtualAcc.value = false;
  }

  void toggleEWalletDropdown() {
    isExpandedEWallet.value = !isExpandedEWallet.value;
  }

  void selectEWalletMethod(String? method) {
    selectedEWalletMethod.value = method;
    isExpandedEWallet.value = false;
  }

  void toggleCreditCardDropdown() {
    isExpandedCreditCard.value = !isExpandedCreditCard.value;
  }

  void selectCreditCardMethod(String? method) {
    selectedCreditCardMethod.value = method;
    isExpandedCreditCard.value = false;
  }

  void toggleQrisDropdown() {
    isExpandedQris.value = !isExpandedQris.value;
  }

  void selectQrisMethod(String? method) {
    selectedQrisMethod.value = method;
    isExpandedQris.value = false;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}