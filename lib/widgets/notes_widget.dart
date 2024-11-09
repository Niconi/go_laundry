import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      constraints: const BoxConstraints(minHeight: 200),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/notes.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text('CATATAN', style: regularText14),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: grayColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: TextField(
              maxLines: null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                hintText: 'Masukkan detail catatan pencucian pakaian anda.',
                hintStyle: regularText14.copyWith(color: grayColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
