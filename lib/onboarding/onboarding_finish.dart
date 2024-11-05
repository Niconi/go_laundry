import 'package:flutter/material.dart';
import 'package:go_laundry/onboarding/onboarding_finish_content.dart';
import 'package:go_laundry/themes.dart';
import '../widgets/custom_button.dart';


class OnboardingFinish extends StatefulWidget {
  const OnboardingFinish({Key? key}) : super(key: key);

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

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
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
