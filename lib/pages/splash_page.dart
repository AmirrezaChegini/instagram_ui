import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/sign_page.dart';
import 'package:instagram_ui/utils/constants.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goToSignPage(context);
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        _logo(),
        _subText(context),
      ],
    );
  }

  Widget _subText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: double.infinity),
        Text(
          'From',
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 12,
            fontFamily: 'GB',
          ),
        ),
        Text(
          'Expert Flutter',
          style: TextStyle(
            color: Constants.blue,
            fontSize: 12,
            fontFamily: 'GB',
          ),
        ),
        SizedBox(height: 32),
      ],
    );
  }

  Widget _logo() {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
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

  Future<void> goToSignPage(BuildContext context) async {
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignPage(),
            ));
      },
    );
  }
}
