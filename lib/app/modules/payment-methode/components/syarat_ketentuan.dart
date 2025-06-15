// lib/app/modules/orderTicket/components/terms_and_conditions_card.dart

import 'package:flutter/material.dart';
import 'package:dlu_project/app/constants/text_style.dart'; // Pastikan path ini benar

class TermsAndConditionsCard extends StatelessWidget {
  const TermsAndConditionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xFF0064D2,
            ).withOpacity(0.35), // Warna shadow dengan sedikit transparansi
            blurRadius: 6, // Tingkat keburaman shadow
            offset: const Offset(0, 4), // Offset shadow (horizontal, vertical)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Syarat dan ketentuan!',
            style: semiBold.copyWith(fontSize: 8, color: Colors.black),
          ),
          _buildBulletPoint(
            'Pastikan DATA PENUMPANG DAN DATA KENDARAAN yang berangkat di isi sesuai dengan ID PENUMPANG dan NO. STNK KENDARAAN yang masih berlaku.',
          ),
          _buildBulletPoint(
            'Bagi PENUMPANG yang sedang dalam keadaan HAMIL DIATAS 6 BULAN KEATAS dan SAKIT KRONIS, penumpang WAJIB menyertakan surat rekomendasi dari dokter untuk berlayar yang berlaku selama 7 HARI dan DIWAJIBKAN juga menandatangani SURAT PERNYATAAN PERTANGGUNG JAWABAN TERBATAS pada saat check in.',
          ),
          _buildBulletPoint(
            'Untuk masa Kehamilan 8 - 9 Bulan dan anda yang sedang SAKIT KRONIS, TIDAK DIIZINKAN untuk melakukan pelayaran bersama armada kapal PT. Dharma Lautan Utama meskipun anda telah menyertakan surat keterangan dokter.',
          ),
          _buildBulletPoint(
            'BOARDING PASS yang sudah tercetak tidak bisa dibatalkan.',
          ),
          _buildBulletPoint(
            'Pelanggan yang tidak membawa kendaraan harus berada di TERMINAL PENUMPANG selambat-lambatnya 2(dua) jam sebelum keberangkatan jadwal kapal, dan bagi pelanggan tiket kendaraan pribadi (R2 & R4) diharapkan kehadirannya 6 (enam) jam sebelum keberangkatan jadwal kapal sudah berada di PELABUHAN KEBERANGKATAN.',
          ),
          _buildBulletPoint(
            'Nilai pertanggungan ASURANSI untuk PENUMPANG: Meninggal Dunia 75jt (Maks) | Cacat Tetap 75jt (Maks) | Biaya Perawatan 37,5jt (Maks) | Biaya P3K 2jt (Maks) | Biaya Ambulans atau Kendaraan 500rb (Maks) | Biaya Penguburan 7,5jt (untuk korban yang tidak memiliki ahli waris).',
          ),
          _buildBulletPoint(
            'Nilai pertanggungan ASURANSI untuk KENDARAAN: Gol II (15jt) | Gol III (200jt) | Gol IV (300jt) | Gol V (360jt) | Gol VI (420jt) | Alat Berat (420jt) | Barang (Per Ton) (10jt).',
          ),
          _buildBulletPoint(
            'Apabila anda ingin menambah nilai proteksi untuk kendaraan anda, maka anda dapat menghubungi loket tiket kantor cabang PT. Dharma Lautan Utama terdekat.',
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: regular.copyWith(fontSize: 8, color: Colors.black87),
          ),
          Expanded(
            child: Text(
              text,
              style: regular.copyWith(fontSize: 8, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
