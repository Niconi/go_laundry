import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_laundry/config/api_config.dart';
import 'package:go_laundry/screen/auth/login_screen.dart';
import 'package:go_laundry/screen/home/home_screen.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import 'package:go_laundry/widgets/custom_text_field.dart';
import 'package:go_laundry/widgets/google_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatelessWidget {
  final Map<String, TextEditingController> controllers = {
    'namaLengkap': TextEditingController(),
    'email': TextEditingController(),
    'noHandphone': TextEditingController(),
    'alamat': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
  };

  RegisterScreen({super.key});

  // Fungsi untuk mendaftar menggunakan Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Error during Google Sign-In: $e");
      return null;
    }
  }

  Future<void> registerUser(BuildContext context, String provider,
      {String? email}) async {
    try {
      Map<String, dynamic> payload;

      if (provider == 'google') {
        // Jika mendaftar dengan Google, hanya kirim email dan provider
        payload = {
          "userEmail": email,
          "provider": provider,
        };
      } else {
        // Jika mendaftar dengan email, kirim semua data input pengguna
        String userName = controllers['namaLengkap']!.text;
        String userEmail = controllers['email']!.text;
        String userPhone = controllers['noHandphone']!.text;
        String userPassword = controllers['password']!.text;

        payload = {
          "userName": userName,
          "userEmail": userEmail,
          "userPhone": userPhone,
          "userPassword": userPassword,
          "provider": provider,
        };
      }

      final response = await http.post(
        Uri.parse(ApiConfig.registerEndpoint()),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(payload),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        if (responseData['ok']) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['message'])),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal mendaftar. Coba lagi!')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
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
                    registerUser(context, 'email');
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
                  onPressed: () async {
                    User? user = await signInWithGoogle();
                    if (user != null) {
                      registerUser(context, 'google',
                          email: user.email); // Menentukan provider ke 'google'
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Gagal melakukan Google Sign-In')),
                      );
                    }
                  },
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
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
