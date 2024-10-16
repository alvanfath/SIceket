import 'package:siceket/utils/service/constant/image.dart';
import 'package:siceket/view/view.dart';
import 'package:flutter/material.dart';
import 'package:siceket/core/core.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset(
              Images.get.icOnboarding,
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 24),
            const TextWidget(
              text: 'Selamat datang di SICEKET',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              align: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const TextWidget(
              text: 'Aplikasi ini menyediakan jasa cek resi dan cek ongkir',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              align: TextAlign.center,
              color: Color(0xff71808E),
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Button(
                    title: 'Cek Resi',
                    onPressed: () {
                      context.pushNamed(CekResiPage.routeName);
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Button(
                    title: 'Cek Ongkir',
                    onPressed: () {
                      context.pushNamed(CekOngkirPage.routeName);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
