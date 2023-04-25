import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_ui/cubit/navbar_cubit.dart';
import 'package:instagram_ui/pages/activity_page.dart';
import 'package:instagram_ui/pages/home_page.dart';
import 'package:instagram_ui/pages/post_page.dart';
import 'package:instagram_ui/pages/profile_page.dart';
import 'package:instagram_ui/pages/search_page.dart';
import 'package:instagram_ui/widgets/bottom_navbar.dart';

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: BlocConsumer<NavbarCubit, int>(
        builder: (context, state) => IndexedStack(
          index: state,
          children: const [
            HomePage(),
            SearchPage(),
            PostPage(),
            ActivityPage(),
            ProfilePage(),
          ],
        ),
        listener: (context, state) => state == 2
            ? Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const PostPage()),
              )
            : null,
        buildWhen: (previous, current) => current != 2,
      ),
    );
  }
}
