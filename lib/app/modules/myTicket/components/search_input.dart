import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchInputField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Masukkan Kode Pemesanan...',
          prefixIcon: const Icon(Icons.search_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
