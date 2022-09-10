import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/activity_page.dart';
import 'package:instagram_ui/pages/home_page.dart';
import 'package:instagram_ui/pages/post_page.dart';
import 'package:instagram_ui/pages/profile_page.dart';
import 'package:instagram_ui/pages/search_page.dart';

class MainApplication extends StatefulWidget {
  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: _body().elementAt(currentIndex),
    );
  }

  Widget _bottomNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          value == 2
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPage(),
                  ))
              : setState(() {
                  currentIndex = value;
                });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icon_home.png',
              color: Theme.of(context).primaryColorLight,
            ),
            activeIcon: Image.asset(
              'assets/icons/icon_home.png',
              color: Theme.of(context).primaryColorDark,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icon_search.png',
              color: Theme.of(context).primaryColorLight,
            ),
            activeIcon: Image.asset(
              'assets/icons/icon_search.png',
              color: Theme.of(context).primaryColorDark,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icon_addpost.png',
              color: Theme.of(context).primaryColorLight,
            ),
            activeIcon: Image.asset(
              'assets/icons/icon_addpost.png',
              color: Theme.of(context).primaryColorDark,
            ),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icon_heart.png',
              color: Theme.of(context).primaryColorLight,
            ),
            activeIcon: Image.asset(
              'assets/icons/icon_heart.png',
              color: Theme.of(context).primaryColorDark,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Theme.of(context).primaryColorLight),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/images/amirreza.jpg',
                ),
              ),
            ),
            activeIcon: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Theme.of(context).primaryColorDark),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/images/amirreza.jpg',
                ),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  List<Widget> _body() {
    return [
      HomePage(),
      SearchPage(),
      PostPage(),
      ActivityPage(),
      ProfilePage(),
    ];
  }
}
