import 'package:flutter/material.dart';
import 'package:go_laundry/components/wallet.dart';
import 'package:go_laundry/content/service_list.dart';
import 'package:go_laundry/models/wallet_button_model.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/notification/notification_screen.dart';
import 'package:go_laundry/screen/order/order_customization.dart';
import 'package:go_laundry/screen/wallet/top_up_screen.dart';
import 'package:go_laundry/screen/wallet/transaction_screen.dart';
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

  void _navigateToTransactionScreen(BuildContext context) {
    Navigator.of(context).push(
      SlidePageRoute(
        page: const TransactionScreen(),
      ),
    );
  }

  void _navigateToTopUpScreen(BuildContext context) {
    Navigator.of(context).push(
      SlidePageRoute(
        page: const TopUpScreen(),
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
                  icon: const Stack(
                    children: [
                      Icon(Icons.notifications, size: 28, color: grayColor),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(page: NotificationScreen()),
                    );
                  },
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
                  onTap: () {
                    _navigateToTopUpScreen(context);
                  },
                ),
                WalletButtonModel(
                  title: 'History',
                  iconPath: 'assets/icons/history.png',
                  onTap: () {
                    _navigateToTransactionScreen(context);
                  },
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
