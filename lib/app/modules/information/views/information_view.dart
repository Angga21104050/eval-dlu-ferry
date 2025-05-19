import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/information_controller.dart';
import '../../../constants/text_style.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color(0xFF0064D2),
          elevation: 0,
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
          title: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Informasi Peraturan Pelayaran',
                style: semiBold.copyWith(fontSize: 22, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PERJANJIAN PENGANGKUTAN PELAYARAN',
              style: bold.copyWith(
                fontSize: 18,
                color: const Color(0xFF0064D2),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Penumpang dan Kendaraan yang namanya tertera di dalam tiket ini mengikatkan diri dalam perjanjian pelayaran dengan PT. DHARMA LAUTAN UTAMA dengan syarat dan ketentuan sebagai berikut:',
              style: regular.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              '• Tiket ini hanya berlaku untuk 1 (satu) kali perjalanan dan tidak dapat dipindah tangankan.\n'
              '• Penggunaan tiket oleh orang atau kendaraan yang tidak sesuai akan dibatalkan.\n'
              '• Penumpang yang terlambat tidak berhak atas pengembalian dana.\n'
              '• Penundaan kapal lebih dari 6 jam berhak mendapatkan refund penuh.\n',
              style: regular.copyWith(fontSize: 14),
            ),
            Text(
              'Pembatalan Tiket Penumpang dan Kendaraan:',
              style: medium.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 6),
            Text(
              '• 30 - 7 hari sebelum keberangkatan: Denda 25%\n'
              '• 6 - 1 hari sebelum keberangkatan: Denda 50%\n'
              '• 1 hari - 6 jam sebelum keberangkatan: Denda 75%\n'
              '• < 6 jam sebelum keberangkatan: Tiket hangus\n'
              '• Refund maksimal 20 hari kerja via transfer bank\n',
              style: regular.copyWith(fontSize: 14),
            ),
            Text(
              'Penumpang Hamil & Penyakit Kronis:',
              style: medium.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 6),
            Text(
              '• Harus membawa surat rekomendasi berlayar dari dokter (berlaku 7 hari).\n'
              '• Usia hamil 6 bulan: Tanda tangan pernyataan tanggung jawab terbatas.\n'
              '• Usia hamil 7 bulan / penyakit kronis: Tambahan surat medis max 30 hari.\n'
              '• Hamil 8-9 bulan / sakit kronis akut: Tidak diizinkan naik kapal.\n',
              style: regular.copyWith(fontSize: 14),
            ),
            Text('Peraturan Umum:', style: medium.copyWith(fontSize: 14)),
            const SizedBox(height: 6),
            Text(
              '• Bagasi gratis max 30 kg atau 0.1 m3.\n'
              '• Penumpang dilarang berjudi, mabuk, merokok di ruang AC, membawa barang terlarang.\n'
              '• Barang bawaan diluar batas akan dikenai pembatasan tergantung kelas.\n',
              style: regular.copyWith(fontSize: 14),
            ),
            Text('Barang Terlarang:', style: medium.copyWith(fontSize: 14)),
            const SizedBox(height: 6),
            Text(
              '• Bahan peledak, senjata api, narkoba, hewan, barang berbahaya.\n',
              style: regular.copyWith(fontSize: 14),
            ),
            Text('Asuransi:', style: medium.copyWith(fontSize: 14)),
            const SizedBox(height: 6),
            Text(
              '• Penumpang: Meninggal 75jt | Cacat tetap 75jt | Biaya rawat 37,5jt | P3K 2jt | Ambulans 500rb | Penguburan 7,5jt.\n'
              '• Kendaraan: Gol II (15jt) – Gol VI (420jt), Alat Berat (420jt), Barang/ton (10jt)\n',
              style: regular.copyWith(fontSize: 14),
            ),
            Text('Dokumen Kendaraan:', style: medium.copyWith(fontSize: 14)),
            const SizedBox(height: 6),
            Text(
              '• Fotokopi KTP, STNK, BPKB / surat leasing wajib dibawa.\n',
              style: regular.copyWith(fontSize: 14),
            ),
            Text(
              'PERHATIAN:',
              style: bold.copyWith(fontSize: 14, color: Colors.red),
            ),
            const SizedBox(height: 6),
            Text(
              '• Jadwal dapat berubah sewaktu-waktu tanpa pemberitahuan.\n'
              '• Disarankan tiba 2 jam sebelum keberangkatan (tanpa kendaraan), dan 6 jam untuk yang membawa kendaraan.\n',
              style: regular.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
