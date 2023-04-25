import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_ui/cubit/theme_cubit.dart';
import 'package:instagram_ui/utils/my_theme.dart';
import 'package:instagram_ui/cubit/navbar_cubit.dart';
import 'package:instagram_ui/cubit/sign_cubit.dart';
import 'package:instagram_ui/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => SignCubit()),
      BlocProvider(create: (context) => NavbarCubit()),
      BlocProvider(create: (context) => ThemeCubit()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: state ? ThemeMode.dark : ThemeMode.light,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        home: const SplashPage(),
      ),
    );
  }
}
