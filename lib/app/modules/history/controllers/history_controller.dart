import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController
  final isScrolled = false.obs; // Observable boolean
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }

  void _onScroll() {
    if (scrollController.offset > 100) {
      if (!isScrolled.value) {
        isScrolled.value = true;
      }
    } else {
      if (isScrolled.value) {
        isScrolled.value = false;
      }
    }
  }

  // data history
  var ticketHistory =
      <Map<String, dynamic>>[
        {
          'id': 1,
          'transactionCode': 'S3854238',
          'transactionDate': 'Sel, 17 Sep 2024 23:30',
          'departurePort': 'Surabaya (Pel. Tanjung Perak)',
          'arrivalPort': 'Lombok (Pel. Lembar/Gilimas)',
          'ferryName': 'KM. Kirana 7',
          'status': 'TELAH TERBIT',
          'ticketType': 'Penumpang',
        },
        {
          'id': 2,
          'transactionCode': 'A1234567',
          'transactionDate': 'Rab, 18 Sep 2024 10:00',
          'departurePort': 'Jakarta (Pel. Tanjung Priok)',
          'arrivalPort': 'Batam (Pel. Batu Ampar)',
          'ferryName': 'KM. Bukit Raya',
          'status': 'BELUM TERBIT',
          'ticketType': 'Penumpang, Kendaraan',
        },
        {
          'id': 3,
          'transactionCode': 'B7890123',
          'transactionDate': 'Kam, 19 Sep 2024 15:45',
          'departurePort': 'Makassar (Pel. Soekarno-Hatta)',
          'arrivalPort': 'Balikpapan (Pel. Semayang)',
          'ferryName': 'KM. Labobar',
          'status': 'TELAH TERBIT',
          'ticketType': 'Kamar VIP, Kendaraan',
        },
        {
          'id': 4,
          'transactionCode': 'C4567890',
          'transactionDate': 'Jum, 20 Sep 2024 08:30',
          'departurePort': 'Bali (Pel. Benoa)',
          'arrivalPort': 'Surabaya (Pel. Tanjung Perak)',
          'ferryName': 'KM. Nggapulu',
          'status': 'GAGAL',
          'ticketType': 'Penumpang',
        },
        {
          'id': 5,
          'transactionCode': 'D9876543',
          'transactionDate': 'Sab, 21 Sep 2024 12:00',
          'departurePort': 'Medan (Pel. Belawan)',
          'arrivalPort': 'Batam (Pel. Batu Ampar)',
          'ferryName': 'KM. Dorolonda',
          'status': 'GAGAL',
          'ticketType': 'Kamar VIP',
        },
      ].obs;

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
