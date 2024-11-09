import 'package:flutter/material.dart';
import 'package:go_laundry/appbar.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/order/checkout.dart';
import 'package:go_laundry/themes.dart';
import 'package:intl/intl.dart';
import 'package:go_laundry/widgets/custom_button.dart';

class SetSchedule extends StatefulWidget {
  const SetSchedule({super.key});

  @override
  _SetScheduleState createState() => _SetScheduleState();
}

class _SetScheduleState extends State<SetSchedule> {
  final TextEditingController _dateTimeController = TextEditingController();
  String? _selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        final DateTime endDateTime =
            selectedDateTime.add(const Duration(hours: 1));

        setState(() {
          _dateTimeController.text =
              DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
          _selectedDateTime =
              "Laundry akan dijemput pada ${DateFormat('EEEE, dd MMMM yyyy, HH:mm').format(selectedDateTime)} - ${DateFormat('HH:mm').format(endDateTime)}";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(title: 'Atur Jadwal'),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 20, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _selectDateTime(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: _dateTimeController,
                  decoration: InputDecoration(
                    labelText: 'Pilih Tanggal dan Waktu Penjemputan',
                    hintText: 'Pilih Tanggal dan Waktu Penjemputan Laundry',
                    prefixIcon: const Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_selectedDateTime != null)
              Text(
                _selectedDateTime!,
                style: mediumText14,
              ),
            const Spacer(),
            CustomButton(
              text: 'Atur Jadwal',
              color: limeGreenColor,
              onPressed: () {
                Navigator.of(context)
                    .push(SlidePageRoute(page: const Checkout()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
