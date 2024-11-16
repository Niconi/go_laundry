import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_laundry/config/api_config.dart';
import 'package:go_laundry/screen/auth/login_screen.dart';
import 'package:go_laundry/screen/home/home_screen.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import 'package:go_laundry/widgets/custom_snack_bar.dart';
import 'package:go_laundry/widgets/custom_text_field.dart';
import 'package:go_laundry/widgets/google_button.dart';
import 'package:go_laundry/widgets/loading_indicator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Map<String, TextEditingController> controllers = {
    'namaLengkap': TextEditingController(),
    'email': TextEditingController(),
    'noHandphone': TextEditingController(),
    'alamat': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
  };

  bool isLoading = false;

  final Map<String, bool> _fieldValidations = {
    'namaLengkap': true,
    'email': true,
    'noHandphone': true,
    'alamat': true,
    'password': true,
    'confirmPassword': true,
  };

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
      CustomSnackbar.show(context, "Error during Google Sign-In: $e",
          backgroundColor: Colors.red);
      return null;
    }
  }

  Future<void> registerUser(BuildContext context, String provider,
      {String? email}) async {
    try {
      setState(() {
        isLoading = true;
      });

      Map<String, dynamic> payload;

      if (provider == 'google') {
        payload = {
          "userEmail": email,
          "provider": provider,
        };
      } else {
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
        headers: ApiConfig.headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        if (responseData['ok']) {
          _clearFields();
          CustomSnackbar.show(context, "Pendaftaran berhasil!",
              backgroundColor: Colors.green);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          CustomSnackbar.show(context, responseData['message'],
              backgroundColor: Colors.red);
        }
      } else {
        CustomSnackbar.show(context, 'Gagal mendaftar. Coba lagi!',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      CustomSnackbar.show(context, 'Terjadi kesalahan: $e',
          backgroundColor: Colors.red);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _clearFields() {
    for (var controller in controllers.values) {
      controller.clear();
    }
  }

  void _validateAndRegister(BuildContext context) {
    bool isValid = true;
    String? errorMessage;

    setState(() {
      controllers.forEach((key, controller) {
        if (controller.text.isEmpty) {
          _fieldValidations[key] = false;
          isValid = false;
          if (errorMessage == null) {
            switch (key) {
              case 'namaLengkap':
                errorMessage = 'Nama Lengkap tidak boleh kosong.';
                break;
              case 'email':
                errorMessage = 'Email tidak boleh kosong.';
                break;
              case 'noHandphone':
                errorMessage = 'No Handphone tidak boleh kosong.';
                break;
              case 'alamat':
                errorMessage = 'Alamat tidak boleh kosong.';
                break;
              case 'password':
                errorMessage = 'Password tidak boleh kosong.';
                break;
              case 'confirmPassword':
                errorMessage = 'Konfirmasi Password tidak boleh kosong.';
                break;
            }
          }
        } else {
          _fieldValidations[key] = true;
        }
      });
    });

    if (!isValid) {
      CustomSnackbar.show(context, errorMessage!, backgroundColor: Colors.red);
      return;
    }

    final password = controllers['password']!.text;
    final confirmPassword = controllers['confirmPassword']!.text;

    if (password != confirmPassword) {
      CustomSnackbar.show(
          context, 'Password dan Konfirmasi Password tidak sama',
          backgroundColor: Colors.red);
      return;
    }

    if (!RegExp(r'^(?=.*[A-Z]).{8,20}$').hasMatch(password)) {
      CustomSnackbar.show(
        context,
        'Password harus memiliki panjang 8-20 karakter dan setidaknya 1 huruf besar',
        backgroundColor: Colors.red,
      );
      return;
    }

    // Jika semua validasi lolos, lanjutkan registrasi
    registerUser(context, 'email');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          GestureDetector(
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
                      borderColor: _fieldValidations['namaLengkap']!
                          ? grayColor
                          : redColor,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      title: 'Email',
                      hintText: 'Masukkan Email',
                      controller: controllers['email'],
                      inputType: TextInputType.emailAddress,
                      borderColor:
                          _fieldValidations['email']! ? grayColor : redColor,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      title: 'No Handphone',
                      hintText: '+62 | 123 456 789',
                      controller: controllers['noHandphone'],
                      inputType: TextInputType.phone,
                      borderColor: _fieldValidations['noHandphone']!
                          ? grayColor
                          : redColor,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      title: 'Alamat',
                      hintText: 'Masukkan Alamat Rumah / Kantor',
                      controller: controllers['alamat'],
                      inputType: TextInputType.text,
                      borderColor:
                          _fieldValidations['alamat']! ? grayColor : redColor,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      title: 'Password',
                      hintText: 'Password harus dalam 8 Karakter',
                      controller: controllers['password'],
                      obscureText: true,
                      borderColor:
                          _fieldValidations['password']! ? grayColor : redColor,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      title: 'Konfirmasi Password',
                      hintText: 'Tulis ulang password Anda',
                      controller: controllers['confirmPassword'],
                      obscureText: true,
                      borderColor: _fieldValidations['confirmPassword']!
                          ? grayColor
                          : redColor,
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: 'Daftar',
                      color: limeGreenColor,
                      onPressed: () {
                        _validateAndRegister(context);
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
                          registerUser(context, 'google', email: user.email);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Gagal melakukan Google Sign-In')),
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
                            style:
                                semiBoldText14.copyWith(color: charcoalColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'Masuk Sekarang',
                              style: semiBoldText14.copyWith(
                                  color: limeGreenColor),
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
          if (isLoading) const CircleLoadingIndicator(),
        ],
      ),
    );
  }
}
