import 'package:flutter/material.dart';
import 'package:go_laundry/models/onboarding_finish_content.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/auth/register_screen.dart';
import 'package:go_laundry/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/custom_button.dart';

class OnboardingFinish extends StatefulWidget {
  const OnboardingFinish({super.key});

  @override
  _OnboardingFinishState createState() => _OnboardingFinishState();
}

class _OnboardingFinishState extends State<OnboardingFinish> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding4.png',
      'title': 'Nikmati Waktu dengan Pakaian Bersih dan Rapi',
      'description':
          'Buat akun atau masuk untuk memesan layanan laundry terbaik dan jadikan waktu luang Anda lebih bermakna!',
    },
  ];

  void _nextPage() async {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_completed', true);

      Navigator.of(context)
          .pushReplacement(SlidePageRoute(page: RegisterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => OnboardingFinishContent(
                title: onboardingData[index]['title']!,
                description: onboardingData[index]['description']!,
                image: onboardingData[index]['image']!,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                CustomButton(
                  text: 'Buat Akun',
                  color: limeGreenColor,
                  onPressed: _nextPage,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    _nextPage();
                  },
                  child: Text(
                    'Masuk',
                    style: semiBoldText14.copyWith(color: limeGreenColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
