import 'package:get/get.dart';

class NotificationController extends GetxController {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Laporan Survei Kepuasan Masyarakat',
      'time': DateTime(2024, 10, 15, 17, 14),
      'image': 'assets/img/chart-survey.jpg',
      'read': false,
    },
    {
      'title': 'Laporan Survei Kepuasan Masyarakat',
      'time': DateTime(2024, 10, 10, 16, 27),
      'image': 'assets/img/chart-survey.jpg',
      'read': false,
    },
    {
      'title':
          'Laporan Survei Kepuasan Masyarakat KM. Dharma Kartika VII (Periode Juli-Sept 2024)',
      'time': DateTime(2024, 10, 8, 15, 49),
      'image': 'assets/img/chart-survey.jpg',
      'read': true,
    },
    {
      'title': 'Rekap pengaduan pelanggan trimester III tahun 2024',
      'time': DateTime(2024, 10, 5, 8, 54),
      'image': 'assets/img/chart-survey.jpg',
      'read': true,
    },
    {
      'title':
          'Laporan Survey Kepuasan Masyarakat KM. Dharma Rucitra VIII Periode Juli - September 2024',
      'time': DateTime(2024, 10, 5, 8, 32),
      'image': 'assets/img/chart-survey.jpg',
      'read': true,
    },
  ];

  void markAsRead(int index) {
    notifications[index]['read'] = true;
    update();
  }
}
