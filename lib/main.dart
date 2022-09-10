import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_ui/config/my_theme.dart';
import 'package:instagram_ui/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: SplashPage(),
    );
  }
}
