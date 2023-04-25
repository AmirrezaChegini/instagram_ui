import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_ui/cubit/theme_cubit.dart';
import 'package:instagram_ui/utils/constants.dart';
import 'package:instagram_ui/widgets/grid_pics.dart';
import 'package:instagram_ui/widgets/profile_icon.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const Appbar(),
          const Header(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 10),
                          child: ProfileIcon(
                            size: 60,
                            image: 'icons/icon_add',
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'New',
                          style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 10,
                            fontFamily: 'GB',
                          ),
                        )
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 10),
                      child: Column(
                        children: [
                          ProfileIcon(
                            size: 60,
                            image: 'images/highlight${index - 1}',
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Highlight $index',
                            style: TextStyle(
                              color: Theme.of(context).highlightColor,
                              fontSize: 10,
                              fontFamily: 'GB',
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Tabbar(tabController: tabController),
        ];
      },
      body: TabBarView(
        controller: tabController,
        physics: const BouncingScrollPhysics(),
        children: const [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                sliver: GridPics(childCounts: 8, image: 'images/post'),
              ),
            ],
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                sliver: GridPics(childCounts: 17, image: 'images/search'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Tabbar extends StatelessWidget {
  const Tabbar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: MyTabBar(
        TabBar(
          controller: tabController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
          indicatorColor: Theme.of(context).primaryColorDark,
          tabs: [
            Tab(
              icon: Image.asset(
                'assets/icons/icon_pic.png',
                color: Theme.of(context).highlightColor,
              ),
            ),
            Tab(
              icon: Image.asset(
                'assets/icons/icon_save2.png',
                color: Theme.of(context).highlightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/images/amirreza.jpg'),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'امیررضا برنامه نویس موبایل',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 12,
                        fontFamily: 'SH',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Amirreza Chegini',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 66,
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/icons/icon_edit.png',
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/icons/icon_pin.png',
                  color: Theme.of(context).highlightColor,
                ),
                const Text(
                  '   https://github.com/AmirrezaChegini',
                  style: TextStyle(
                    color: Constants.blue,
                    fontSize: 12,
                    fontFamily: 'GB',
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/icons/icon_developer.png',
                  color: Theme.of(context).highlightColor,
                ),
                Text(
                  '   Developer',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 15),
                Image.asset(
                  'assets/icons/icon_loc.png',
                  color: Theme.of(context).highlightColor,
                ),
                Text(
                  '   Iran',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text('3', style: Theme.of(context).textTheme.titleLarge),
                Text('  post', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(width: 15),
                Text('440', style: Theme.of(context).textTheme.titleLarge),
                Text('  Followers',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(width: 15),
                Text('472', style: Theme.of(context).textTheme.titleLarge),
                Text('  Following',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context).changeTheme();
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 46),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'GB',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text('Change Theme'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/back_appbar.png',
          fit: BoxFit.fill,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(14),
        child: Container(
          height: 14,
          foregroundDecoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTabBar extends SliverPersistentHeaderDelegate {
  TabBar tabBar;
  MyTabBar(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
