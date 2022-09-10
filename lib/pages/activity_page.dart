import 'package:flutter/material.dart';

enum ActivityStatus {
  LIKED,
  FOLLOW,
  MESSAGE,
}

class ActivityPage extends StatefulWidget {
  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _tabBar(),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                _followingTabView(),
                _youTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _followingTabView() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'New',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 2,
            (context, index) => _sliverListItem(
              'liked your photo',
              index,
              ActivityStatus.LIKED,
              '3 min',
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Today',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 3,
            (context, index) => _sliverListItem(
              'started following you',
              index + 2,
              ActivityStatus.FOLLOW,
              '6 h',
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'This Week',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 13,
            (context, index) => _sliverListItem(
              'started following you',
              index + 5,
              ActivityStatus.MESSAGE,
              '2 days ago',
            ),
          ),
        ),
      ],
    );
  }

  Widget _youTabView() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'New',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 3,
            (context, index) => _sliverListItem(
              'started following you',
              index + 2,
              ActivityStatus.FOLLOW,
              '6 h',
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Today',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 2,
            (context, index) => _sliverListItem(
              'liked your photo',
              index,
              ActivityStatus.LIKED,
              '3 min',
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'This Week',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 13,
            (context, index) => _sliverListItem(
              'started following you',
              index + 5,
              ActivityStatus.MESSAGE,
              '2 days ago',
            ),
          ),
        ),
      ],
    );
  }

  Widget _sliverListItem(
      String text, int i, ActivityStatus status, String time) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            margin: EdgeInsets.only(right: 7),
            foregroundDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/person$i.png',
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Person $i',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(width: 5),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                time,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          Spacer(),
          _activityStatus(status, i),
        ],
      ),
    );
  }

  Widget _activityStatus(ActivityStatus status, int i) {
    switch (status) {
      case ActivityStatus.FOLLOW:
        return TextButton(
          onPressed: () {},
          child: Text(
            'Follow',
          ),
          style: TextButton.styleFrom(
            minimumSize: Size(70, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'GB',
            ),
          ),
        );

      case ActivityStatus.LIKED:
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/activity$i.png',
            width: 40,
            height: 40,
          ),
        );

      case ActivityStatus.MESSAGE:
        return OutlinedButton(
          onPressed: () {},
          child: Text('Message'),
        );

      default:
        return Container();
    }
  }

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
      indicatorColor: Theme.of(context).primaryColorDark,
      tabs: [
        Tab(
          text: 'Following',
          height: 66,
        ),
        Tab(
          text: 'You',
          height: 66,
        ),
      ],
    );
  }
}
