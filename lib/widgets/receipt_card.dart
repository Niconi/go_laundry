import 'package:flutter/material.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/home/home_screen.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import '../../models/receipt_model.dart';
import 'close_button_widget.dart';
import 'receipt_header.dart';
import 'receipt_details_section.dart';
import 'dashed_divider.dart';

class ReceiptCard extends StatelessWidget {
  final ReceiptModel receipt;

  const ReceiptCard({Key? key, required this.receipt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 700),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ReceiptHeader(),
                  ReceiptDetailsSection(receipt: receipt),
                  const SizedBox(height: 40),
                  const DashedDivider(),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      text: 'Selesai',
                      color: limeGreenColor,
                      onPressed: () {
                        Navigator.of(context).push(
                          SlidePageRoute(page: const HomeScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
