import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_laundry/config/api_config.dart';
import 'package:go_laundry/widgets/loading_indicator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/auth/register_screen.dart';
import 'package:go_laundry/screen/home/home_screen.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import 'package:go_laundry/widgets/custom_text_field.dart';
import 'package:go_laundry/widgets/google_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  Future<User?> signInWithGoogle(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CircleLoadingIndicator();
      },
    );

    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser =
          await googleSignIn.signInSilently();

      if (googleUser == null) {
        final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
        if (googleAccount == null) {
          Navigator.of(context).pop();
          return null;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User? user = userCredential.user;

        Navigator.of(context).pop();
        return user;
      } else {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User? user = userCredential.user;

        Navigator.of(context).pop();
        return user;
      }
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error during Google Sign-In: $e"),
        backgroundColor: Colors.red,
      ));
      return null;
    }
  }

  Future<void> _login(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(context, 'Email dan Password tidak boleh kosong');
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CircleLoadingIndicator();
      },
    );

    try {
      final response = await http.post(
        Uri.parse(ApiConfig.loginEndpoint()),
        headers: ApiConfig.headers,
        body: json.encode({
          'userEmail': email,
          'userPassword': password,
        }),
      );

      Navigator.of(context).pop();

      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(
          SlidePageRoute(page: const HomeScreen()),
          (Route<dynamic> route) => false,
        );
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String message = responseData['message'] ?? 'Terjadi kesalahan';
        _showSnackBar(context, message);
      }
    } catch (e) {
      Navigator.of(context).pop();
      _showSnackBar(context, 'Terjadi kesalahan saat koneksi ke server');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    ));
  }

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
                    inputType: TextInputType.emailAddress,
                    icon: const Icon(Icons.email, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Password',
                    hintText: 'Masukkan Password',
                    controller: passwordController,
                    inputType: TextInputType.text,
                    obscureText: true,
                    icon: const Icon(Icons.key, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'Masuk',
                    color: limeGreenColor,
                    onPressed: () => _login(context),
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
                    onPressed: () async {
                      User? user = await signInWithGoogle(context);
                      if (user != null) {
                        Navigator.of(context).pushAndRemoveUntil(
                          SlidePageRoute(page: const HomeScreen()),
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Gagal melakukan Google Sign-In')),
                        );
                      }
                    },
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
                            style:
                                semiBoldText14.copyWith(color: limeGreenColor),
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
      ),
    );
  }
}
