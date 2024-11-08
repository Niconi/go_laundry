import 'package:flutter/material.dart';
import 'package:go_laundry/components/wallet.dart';
import 'package:go_laundry/content/service_list.dart';
import 'package:go_laundry/models/wallet_button_model.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/order/order_customization.dart';
import 'package:go_laundry/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  void _navigateToOrderCustomization(BuildContext context, String serviceName) {
    Navigator.of(context).push(
      SlidePageRoute(
        page: OrderCustomization(serviceName: serviceName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Pagi,',
                      style: semiBoldText14.copyWith(color: charcoalColor),
                    ),
                    Text(
                      'Anda',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: charcoalColor,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Stack(
                    children: [
                      const Icon(Icons.notifications,
                          size: 28, color: Colors.grey),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: redColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            Wallet(
              balance: 'Rp 100.000',
              walletIconPath: 'assets/icons/Wallet.png',
              buttons: [
                WalletButtonModel(
                  title: 'Top Up',
                  iconPath: 'assets/icons/plus.png',
                ),
                WalletButtonModel(
                  title: 'History',
                  iconPath: 'assets/icons/history.png',
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Layanan Kami',
              style: boldText16,
            ),
            SizedBox(
              height: 400,
              child: ServiceList(
                onServiceSelected: (serviceName) =>
                    _navigateToOrderCustomization(context, serviceName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
