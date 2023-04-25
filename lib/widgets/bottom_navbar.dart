import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_ui/cubit/navbar_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: BlocBuilder<NavbarCubit, int>(
        buildWhen: (previous, current) => current != 2,
        builder: (context, state) => BottomNavigationBar(
          currentIndex: state,
          onTap: (value) {
            BlocProvider.of<NavbarCubit>(context).changeIndex(value);
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
                  border:
                      Border.all(color: Theme.of(context).primaryColorLight),
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
      ),
    );
  }
}
