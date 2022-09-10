import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/constants.dart';

class ProfilePage extends StatefulWidget {
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
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          _sliverAppBar(),
          _header(),
          SliverToBoxAdapter(
            child: Container(
              height: 90,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _addHighlight();
                  } else {
                    return _highlight(index - 1);
                  }
                },
              ),
            ),
          ),
          _tabBar(),
        ];
      },
      body: TabBarView(
        controller: tabController,
        children: [
          CustomScrollView(
            slivers: [
              _picTabView(),
            ],
          ),
          CustomScrollView(
            slivers: [
              _saveTabView(),
            ],
          )
        ],
      ),
    );
  }

  Widget _saveTabView() {
    return SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: 12,
          (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/search$index.png',
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }

  Widget _picTabView() {
    return SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: 8,
          (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/post$index.png',
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }

  Widget _tabBar() {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: MyTabBar(
        TabBar(
          controller: tabController,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
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

  Widget _highlight(int i) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('assets/images/highlight$i.png'),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Highlight ${i + 1}',
          style: TextStyle(
            color: Theme.of(context).highlightColor,
            fontSize: 10,
            fontFamily: 'GB',
          ),
        )
      ],
    );
  }

  Widget _addHighlight() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: Theme.of(context).highlightColor,
            ),
          ),
          child: Image.asset('assets/icons/icon_add.png'),
        ),
        SizedBox(height: 10),
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
  }

  Widget _header() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
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
                SizedBox(width: 10),
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
                    SizedBox(height: 5),
                    Text(
                      'Amirreza Chegini',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Spacer(),
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
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/icons/icon_pin.png',
                  color: Theme.of(context).highlightColor,
                ),
                Text(
                  '   https://github.com/AmirrezaChegini',
                  style: TextStyle(
                    color: Constants.blue,
                    fontSize: 12,
                    fontFamily: 'GB',
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/icons/icon_developer.png',
                  color: Theme.of(context).highlightColor,
                ),
                Text(
                  '   Developer',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(width: 15),
                Image.asset(
                  'assets/icons/icon_loc.png',
                  color: Theme.of(context).highlightColor,
                ),
                Text(
                  '   Iran',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text('3', style: Theme.of(context).textTheme.headline4),
                Text('  post', style: Theme.of(context).textTheme.headline5),
                SizedBox(width: 15),
                Text('440', style: Theme.of(context).textTheme.headline4),
                Text('  Followers',
                    style: Theme.of(context).textTheme.headline5),
                SizedBox(width: 15),
                Text('472', style: Theme.of(context).textTheme.headline4),
                Text('  Following',
                    style: Theme.of(context).textTheme.headline5),
              ],
            ),
            SizedBox(height: 32),
            OutlinedButton(
              onPressed: () {},
              child: Text('Edit Profile'),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 46),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'GB',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 160,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/back_appbar.png',
          fit: BoxFit.fill,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(14),
        child: Container(
          height: 14,
          foregroundDecoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
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
