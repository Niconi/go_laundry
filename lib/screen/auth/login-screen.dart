import 'package:flutter/material.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/auth/register-screen.dart';
import 'package:go_laundry/screen/home/home-screen.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import 'package:go_laundry/widgets/custom_text_field.dart';
import 'package:go_laundry/widgets/google_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Text(
                  'Selamat Datang',
                  style: semiBoldText20,
                ),
                const SizedBox(height: 8),
                Text(
                  'Masukkan email dan password untuk melanjutkan.',
                  style: regularText14.copyWith(color: mediumGrayColor),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  title: 'Email',
                  hintText: 'Masukkan Email',
                  controller: emailController,
                  icon: const Icon(Icons.email, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: 'Password',
                  hintText: 'Masukkan Password',
                  controller: passwordController,
                  icon: const Icon(Icons.key, color: Colors.grey),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Masuk',
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context)
                        .push(SlidePageRoute(page: HomeScreen()));
                  },
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Expanded(child: Divider(color: grayColor)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'atau',
                        style: TextStyle(
                          color: grayColor,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: grayColor)),
                  ],
                ),
                const SizedBox(height: 24),
                GoogleSignInButton(
                  onPressed: () {},
                ),
                SizedBox(height: screenHeight * 0.3),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun? ',
                        style: semiBoldText14.copyWith(color: charcoalColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(SlidePageRoute(page: RegisterScreen()));
                        },
                        child: Text(
                          'Daftar Sekarang',
                          style: semiBoldText14.copyWith(color: limeGreenColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
