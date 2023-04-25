import 'package:flutter/material.dart';

enum ActivityStatus { liked, follow, message }

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

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
          TopTabbar(tabController: tabController),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const BouncingScrollPhysics(),
              children: const [
                FollowTabView(),
                YouTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FollowTabView extends StatelessWidget {
  const FollowTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'New',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 2,
            (context, index) => ItemList(
              text: 'liked your photo',
              i: index,
              status: ActivityStatus.liked,
              time: '3 min',
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Today',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 3,
            (context, index) => ItemList(
              text: 'started following you',
              i: index + 2,
              status: ActivityStatus.follow,
              time: '6 h',
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'This Week',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 13,
            (context, index) => ItemList(
              text: 'started following you',
              i: index + 5,
              status: ActivityStatus.message,
              time: '2 days ago',
            ),
          ),
        ),
      ],
    );
  }
}

class YouTabView extends StatelessWidget {
  const YouTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'New',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 3,
            (context, index) => ItemList(
              text: 'started following you',
              i: index,
              status: ActivityStatus.follow,
              time: '6 h',
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Today',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 2,
            (context, index) => ItemList(
              text: 'liked your photo',
              i: index,
              status: ActivityStatus.liked,
              time: '3 min',
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 22, top: 30, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'This Week',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 13,
            (context, index) => ItemList(
              text: 'send a message to you',
              i: index + 3,
              status: ActivityStatus.message,
              time: '2 days ago',
            ),
          ),
        ),
      ],
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.text,
    required this.i,
    required this.status,
    required this.time,
  });
  final String text;
  final int i;
  final ActivityStatus status;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            margin: const EdgeInsets.only(right: 7),
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
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Person $i',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                time,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const Spacer(),
          _activityStatus(status, i),
        ],
      ),
    );
  }
}

Widget _activityStatus(ActivityStatus status, int i) {
  switch (status) {
    case ActivityStatus.follow:
      return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          minimumSize: const Size(70, 36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          textStyle: const TextStyle(
            fontSize: 12,
            fontFamily: 'GB',
          ),
        ),
        child: const Text(
          'Follow',
        ),
      );

    case ActivityStatus.liked:
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/activity$i.png',
          width: 40,
          height: 40,
        ),
      );

    case ActivityStatus.message:
      return OutlinedButton(
        onPressed: () {},
        child: const Text('Message'),
      );

    default:
      return Container();
  }
}

class TopTabbar extends StatelessWidget {
  const TopTabbar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      physics: const BouncingScrollPhysics(),
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
      indicatorColor: Theme.of(context).primaryColorDark,
      tabs: const [
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
