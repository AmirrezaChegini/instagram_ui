import 'dart:ui';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_ui/cubit/sign_cubit.dart';
import 'package:instagram_ui/pages/main_application.dart';
import 'package:instagram_ui/utils/constants.dart';
import 'package:instagram_ui/widgets/edt_text.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: const [
        BackImage(),
        EdtTextConatiner(),
        AcceptAccount(),
      ],
    ));
  }
}

class AcceptAccount extends StatelessWidget {
  const AcceptAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignCubit, bool>(
      builder: (context, state) => AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        reverseDuration: const Duration(milliseconds: 300),
        crossFadeState:
            state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: const SizedBox(
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
                  const SizedBox(height: 32),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/amirreza.jpg',
                      height: 129,
                      width: 129,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Amirahmad',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainApplication(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size(129, 46),
                    ),
                    child: const Text('Confirm'),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<SignCubit>(context).pressedLogin(false);
                    },
                    child: Text(
                      'Switch Account',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackImage extends StatelessWidget {
  const BackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2 + 30,
          decoration: const BoxDecoration(
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

class EdtTextConatiner extends StatelessWidget {
  const EdtTextConatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: DelayedWidget(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: 20,
                    fontFamily: 'GB',
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 44, right: 44, top: 20, bottom: 10),
                  child: EdtText(
                    label: 'Email',
                    inputType: TextInputType.emailAddress,
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 44, right: 44, top: 20, bottom: 20),
                  child: EdtText(
                    label: 'Password',
                    inputType: TextInputType.visiblePassword,
                    isObsecure: true,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<SignCubit>(context).pressedLogin(true);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(129, 46),
                  ),
                  child: const Text('Log in'),
                ),
                const SizedBox(height: 20),
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
            ),
          ),
        ),
      ],
    );
  }
}
