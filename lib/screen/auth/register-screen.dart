import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import 'package:go_laundry/widgets/custom_text_field.dart';
import 'package:go_laundry/widgets/google_button.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              'Daftar Sekarang',
              style: semiBoldText20,
            ),
            const SizedBox(height: 8),
            Text(
              'Masukkan data diri anda untuk menikmati fitur kami.',
              style: regularText14.copyWith(color: mediumGrayColor),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              title: 'Nama Lengkap',
              hintText: 'Masukkan Nama',
              controller: emailController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Email',
              hintText: 'Masukkan Email',
              controller: passwordController,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Masuk',
              color: Colors.green,
              onPressed: () {
                // Action for login button
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
              onPressed: () {
                // Action for Google sign-in button
              },
            ),
            SizedBox(height: screenHeight * 0.05),
            // Spacer to push content above
            const Spacer(),
            // "Belum punya akun? Daftar Sekarang" section
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya Akun? ',
                    style: semiBoldText14.copyWith(color: charcoalColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action for "Daftar Sekarang" link
                    },
                    child: Text(
                      'Masuk Sekarang',
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
    );
  }
}
