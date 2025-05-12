import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchInputField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Masukkan Kode Pemesanan...',
          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF0064D2),
          ), // 🔹 Warna Ikon Tetap
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none, // 🔹 Hilangkan Border Default
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF0064D2), width: 2),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
