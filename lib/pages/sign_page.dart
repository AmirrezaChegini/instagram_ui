import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/main_application.dart';
import 'package:instagram_ui/utils/constants.dart';

class SignPage extends StatefulWidget {
  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  FocusNode edtEmailFocus = FocusNode();
  bool isFocused = false;
  bool logInVisible = false;

  @override
  void initState() {
    super.initState();
    edtEmailFocus.addListener(() {
      setState(() {
        isFocused = !isFocused;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _image(),
        _container(),
        _acceptAccount(),
      ],
    );
  }

  Widget _acceptAccount() {
    return AnimatedCrossFade(
      duration: Duration(seconds: 1),
      crossFadeState:
          logInVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: Container(
        width: 340,
        height: 352,
      ),
      secondChild: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Container(
            width: 340,
            height: 352,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.white.withOpacity(0.5),
                  Constants.white.withOpacity(0.2),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 32),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/amirreza.jpg',
                    height: 129,
                    width: 129,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Amirahmad',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainApplication(),
                        ));
                  },
                  child: Text('Confirm'),
                  style: TextButton.styleFrom(
                    minimumSize: Size(129, 46),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      logInVisible = false;
                    });
                  },
                  child: Text(
                    'Switch Account',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _container() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: _content(),
        ),
      ],
    );
  }

  Widget _content() {
    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          'Login to your account',
          style: TextStyle(
            color: Theme.of(context).highlightColor,
            fontSize: 20,
            fontFamily: 'GB',
          ),
        ),
        SizedBox(height: 36),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            focusNode: edtEmailFocus,
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'GM',
                color: isFocused
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColorLight,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Theme.of(context).highlightColor,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorDark,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'GM',
                color: Theme.of(context).primaryColorLight,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Theme.of(context).highlightColor,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 32),
        TextButton(
          onPressed: () {
            setState(() {
              logInVisible = true;
            });
          },
          child: Text('Log in'),
          style: TextButton.styleFrom(
            minimumSize: Size(129, 46),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'don\'t have a account ? /',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            Text(
              ' Sign up',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Theme.of(context).highlightColor,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _image() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2 + 30,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff323A99),
                Color(0xffF98BFC),
              ],
            ),
          ),
          child: Image.asset(
            'assets/images/back_sign.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
