import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/sign_page.dart';
import 'package:instagram_ui/utils/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    goToSignPage(context);
    return Scaffold(
      body: Stack(
        children: const [
          Logo(),
          SubText(),
        ],
      ),
    );
  }
}

class SubText extends StatelessWidget {
  const SubText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: double.infinity),
        Text(
          'From',
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 12,
            fontFamily: 'GB',
          ),
        ),
        const Text(
          'Expert Flutter',
          style: TextStyle(
            color: Constants.blue,
            fontSize: 12,
            fontFamily: 'GB',
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/back_splash.png'),
          repeat: ImageRepeat.repeat,
          opacity: 0.2,
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/splash_logo.png',
          height: 77,
          width: 155,
        ),
      ),
    );
  }
}

Future<void> goToSignPage(BuildContext context) async {
  Future.delayed(
    const Duration(seconds: 2),
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignPage()),
      );
    },
  );
}
