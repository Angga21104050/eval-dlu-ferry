import 'package:get/get.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController

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
        },
        {
          'id': 2,
          'transactionCode': 'A1234567',
          'transactionDate': 'Rab, 18 Sep 2024 10:00',
          'departurePort': 'Jakarta (Pel. Tanjung Priok)',
          'arrivalPort': 'Batam (Pel. Batu Ampar)',
          'ferryName': 'KM. Bukit Raya',
          'status': 'BELUM TERBIT',
        },
        {
          'id': 3,
          'transactionCode': 'B7890123',
          'transactionDate': 'Kam, 19 Sep 2024 15:45',
          'departurePort': 'Makassar (Pel. Soekarno-Hatta)',
          'arrivalPort': 'Balikpapan (Pel. Semayang)',
          'ferryName': 'KM. Labobar',
          'status': 'TELAH TERBIT',
        },
        {
          'id': 4,
          'transactionCode': 'C4567890',
          'transactionDate': 'Jum, 20 Sep 2024 08:30',
          'departurePort': 'Bali (Pel. Benoa)',
          'arrivalPort': 'Surabaya (Pel. Tanjung Perak)',
          'ferryName': 'KM. Nggapulu',
          'status': 'GAGAL',
        },
        {
          'id': 5,
          'transactionCode': 'D9876543',
          'transactionDate': 'Sab, 21 Sep 2024 12:00',
          'departurePort': 'Medan (Pel. Belawan)',
          'arrivalPort': 'Batam (Pel. Batu Ampar)',
          'ferryName': 'KM. Dorolonda',
          'status': 'GAGAL',
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
