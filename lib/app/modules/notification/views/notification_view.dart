import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/notification_controller.dart';
import '../../../constants/text_style.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          leading: IconButton(
            // Menggunakan IconButton untuk tombol back
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ), // Atur warna ikon
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: const Color(0xFF0064D2),
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Text(
              'Informasi Notifikasi',
              style: semiBold.copyWith(fontSize: 22, color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          centerTitle: false,
        ),
      ),

      // Di dalam NotificationView...
      body: GetBuilder<NotificationController>(
        builder: (controller) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              final notification = controller.notifications[index];
              final timeFormat = DateFormat('dd-MM-yyyy HH:mm:ss');

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:
                      notification['read']
                          ? Colors.grey[100]
                          : const Color(0xFFC9E3FF),
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0064D2).withOpacity(0.15),
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Gambar/Icon Notifikasi
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0064D2).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            notification['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Konten Notifikasi
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification['title'],
                              style: (notification['read'] ? regular : semiBold)
                                  .copyWith(
                                    fontSize: 14,
                                    color:
                                        notification['read']
                                            ? Colors.grey[800]
                                            : Colors.black,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              timeFormat.format(notification['time']),
                              style: regular.copyWith(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Titik indikator belum dibaca
                      if (!notification['read'])
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
