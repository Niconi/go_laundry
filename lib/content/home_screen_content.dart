import 'package:flutter/material.dart';
import 'package:go_laundry/components/wallet.dart';
import 'package:go_laundry/content/service_list.dart';
import 'package:go_laundry/helper/user_helper.dart';
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

  bool isProfileComplete({
    required String name,
    required String email,
    required String phone,
  }) {
    return name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty;
  }

  void _navigateToOrderCustomization(
      BuildContext context, String serviceName, bool profileComplete) {
    if (profileComplete) {
      Navigator.of(context).push(
        SlidePageRoute(
          page: OrderCustomization(serviceName: serviceName),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lengkapi profil Anda sebelum memilih layanan.'),
        ),
      );
    }
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

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Selamat Pagi,';
    } else if (hour >= 12 && hour < 15) {
      return 'Selamat Siang,';
    } else if (hour >= 15 && hour < 18) {
      return 'Selamat Sore,';
    } else {
      return 'Selamat Malam,';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
      future: UserHelper.getUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: Text('Gagal memuat data pengguna.'),
          );
        }

        final userName = snapshot.data?['user_name'] ?? 'Pengguna';
        final userEmail = snapshot.data?['user_email'] ?? '';
        final userPhone = snapshot.data?['user_phone'] ?? '';
        final userBalance = snapshot.data?['balance'] ?? '0.00';

        final profileComplete = isProfileComplete(
          name: userName,
          email: userEmail,
          phone: userPhone,
        );

        return Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                          getGreetingMessage(),
                          style: semiBoldText14.copyWith(color: charcoalColor),
                        ),
                        Text(
                          userName,
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
                      icon: const Icon(Icons.notifications,
                          size: 28, color: grayColor),
                      onPressed: () {
                        Navigator.push(
                          context,
                          SlidePageRoute(page: const NotificationScreen()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Wallet(
                  balance: 'Rp $userBalance',
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
                        _navigateToOrderCustomization(
                            context, serviceName, profileComplete),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
