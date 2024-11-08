import 'package:flutter/material.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/auth/login-screen.dart';
import 'package:go_laundry/screen/home/home-screen.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import 'package:go_laundry/widgets/custom_text_field.dart';
import 'package:go_laundry/widgets/google_button.dart';

class RegisterScreen extends StatelessWidget {
  final Map<String, TextEditingController> controllers = {
    'namaLengkap': TextEditingController(),
    'email': TextEditingController(),
    'noHandphone': TextEditingController(),
    'alamat': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.08),
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
                  controller: controllers['namaLengkap'],
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: 'Email',
                  hintText: 'Masukkan Email',
                  controller: controllers['email'],
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: 'No Handphone',
                  hintText: '+62 | 123 456 789',
                  controller: controllers['noHandphone'],
                  inputType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: 'Alamat',
                  hintText: 'Masukkan Alamat Rumah / Kantor',
                  controller: controllers['alamat'],
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: 'Password',
                  hintText: 'Password harus dalam 8 Karakter',
                  controller: controllers['password'],
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: 'Konfirmasi Password',
                  hintText: 'Tulis ulang password Anda',
                  controller: controllers['confirmPassword'],
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Daftar',
                  color: limeGreenColor,
                  onPressed: () {
                    Navigator.of(context)
                        .push(SlidePageRoute(page: const HomeScreen()));
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
                        style: TextStyle(color: grayColor),
                      ),
                    ),
                    Expanded(child: Divider(color: grayColor)),
                  ],
                ),
                const SizedBox(height: 24),
                GoogleSignInButton(
                  onPressed: () {},
                ),
                SizedBox(height: screenHeight * 0.05),
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
                          Navigator.of(context)
                              .push(SlidePageRoute(page: LoginScreen()));
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
        ),
      ),
    );
  }
}
