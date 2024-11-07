import 'package:flutter/material.dart';
import 'package:go_laundry/onboarding/onboarding_finish.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/auth/register-screen.dart';
import 'package:go_laundry/themes.dart';
import '../widgets/custom_button.dart';
import '../widgets/indicator_dot.dart';
import 'onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding1.png',
      'title': 'Layanan Laundry Cepat & Praktis',
      'description':
          'Tidak perlu repot, cukup pesan lewat aplikasi dan kami akan urus semuanya untuk Anda',
    },
    {
      'image': 'assets/images/onboarding2.png',
      'title': 'Kualitas Cuci yang Pasti Terjamin',
      'description':
          'Kami menggunakan produk berkualitas dan tenaga profesional agar pakaian tetap bersih, wangi, dan terawat.',
    },
    {
      'image': 'assets/images/onboarding3.png',
      'title': 'Layanan Antar - Jemput Gratis',
      'description':
          'Pesan, kami ambil, dan antar langsung ke pintu Anda. Nikmati kenyamanan maksimal!',
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushReplacement(
        context,
        SlidePageRoute(page: OnboardingFinish()),
      );
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
              itemBuilder: (context, index) => OnboardingContent(
                image: onboardingData[index]['image']!,
                title: onboardingData[index]['title']!,
                description: onboardingData[index]['description']!,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => IndicatorDot(isActive: _currentPage == index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                CustomButton(
                  text: 'Lanjutkan',
                  color: limeGreenColor,
                  onPressed: _nextPage,
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      SlidePageRoute(page: OnboardingFinish()),
                    );
                  },
                  child: Text(
                    'Lewati',
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
