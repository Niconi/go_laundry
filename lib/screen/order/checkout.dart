import 'package:flutter/material.dart';
import 'package:go_laundry/appbar.dart';
import 'package:go_laundry/models/order_details_card.dart';
import 'package:go_laundry/models/payment_summary_card.dart';
import 'package:go_laundry/models/pickup_schedule_card.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/order/input_pin.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import 'package:go_laundry/widgets/service_selection_box.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 10,
          bottom: 20, 
        ),
        child: Column(
          children: [
            const ServiceSelectionBox(serviceName: 'Cuci Lipat'),
            const SizedBox(height: 16),
            const PickupScheduleCard(
              orderNumber: '1',
              pickupSchedule: '2 November 2024 [10AM - 11AM]',
              deliverySchedule: '4 November 2024 [10AM - 11AM]',
            ),
            const SizedBox(height: 16),
            const OrderDetailsCard(
              pickupAddress:
                  'Jalan abcd nomor 1, Pegadengan, Kabupaten Tangerang, Tangerang Selatan',
              orderDate: '2 November 2024',
              clothingDetails: 'Tshirt, Jeans, Jacket',
            ),
            const SizedBox(height: 16),
            const PaymentSummaryCard(
              laundryCost: 30000,
              additionalCost: 2000,
              totalPayment: 32000,
            ),
            const SizedBox(height: 16),

            const Spacer(),

            CustomButton(
              text: 'Payment',
              color: limeGreenColor,
              onPressed: () {
                Navigator.of(context).push(
                  SlidePageRoute(page: InputPin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
