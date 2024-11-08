import 'package:flutter/material.dart';
import 'package:go_laundry/appbar.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/order/set_schedule.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import 'package:go_laundry/widgets/notes_widget.dart';
import 'package:go_laundry/widgets/service_selection_box.dart';
import 'package:go_laundry/widgets/service_type_box.dart';

class OrderCustomization extends StatelessWidget {
  final String serviceName;

  const OrderCustomization({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(title: 'Kostumisasi Pesanan'),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ServiceSelectionBox(serviceName: serviceName),
                      ServiceTypeBox(serviceName: serviceName),
                      const SizedBox(height: 10),
                      const NotesWidget(),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'PILIH JADWAL',
                color: limeGreenColor,
                onPressed: () {
                  Navigator.of(context).push(
                    SlidePageRoute(page: const SetSchedule()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
