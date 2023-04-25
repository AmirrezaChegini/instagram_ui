import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/constants.dart';
import 'package:instagram_ui/widgets/profile_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        actions: [
          GestureDetector(
            onTap: () => showBottomSheet(context),
            child: Image.asset(
              'assets/icons/icon_direct.png',
              color: Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 13,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (context, index) => index == 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              ProfileIcon(
                                image: 'icons/icon_add',
                                border: Border.all(
                                  color: Theme.of(context).highlightColor,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Add',
                                style: TextStyle(
                                  color: Theme.of(context).highlightColor,
                                  fontSize: 11,
                                  fontFamily: 'GB',
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              ProfileIcon(
                                image: 'images/person${index - 1}',
                                border: Border.all(
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Person $index',
                                style: TextStyle(
                                  color: Theme.of(context).highlightColor,
                                  fontSize: 11,
                                  fontFamily: 'GB',
                                ),
                              )
                            ],
                          ),
                        )),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) => Post(i: index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: DraggableScrollableSheet(
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Constants.white.withOpacity(0.5),
                          Constants.white.withOpacity(0.2),
                        ],
                      ),
                    ),
                    child: BottomSheetContent(scrollCtrl: scrollController),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key, required this.scrollCtrl});
  final ScrollController scrollCtrl;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: scrollCtrl,
      slivers: [
        SliverPadding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 32, left: 30, right: 30),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: 63,
                  height: 5,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Constants.white,
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 24,
                        fontFamily: 'GB',
                      ),
                    ),
                    Image.asset(
                      'assets/icons/icon_up.png',
                      color: Theme.of(context).highlightColor,
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                SizedBox(
                  height: 46,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Constants.white.withOpacity(0.4),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      prefixIcon: Image.asset(
                        'assets/icons/icon_search.png',
                        color: Theme.of(context).highlightColor,
                      ),
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 12,
                        fontFamily: 'GB',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 18,
              (context, index) {
                return Column(
                  children: [
                    ProfileIcon(
                      image: 'images/person$index',
                      size: 64,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'person $index',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 12,
                        fontFamily: 'GB',
                      ),
                    ),
                  ],
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 33,
              mainAxisExtent: 97,
            ),
          ),
        ),
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ProfileIcon(
              image: 'images/person$i',
              size: 40,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Person$i',
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: 12,
                    fontFamily: 'GB',
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'برنامه نویس موبایل',
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: 12,
                    fontFamily: 'SH',
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/icons/icon_more.png',
              color: Theme.of(context).highlightColor,
            ),
          ],
        ),
        const SizedBox(height: 23),
        SizedBox(
          height: 425,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/search$i.png',
                    height: 394,
                    width: 394,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Image.asset('assets/icons/icon_video.png'),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 40, sigmaY: 30),
                      child: Container(
                        height: 46,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Constants.white.withOpacity(0.5),
                              Constants.white.withOpacity(0.2),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/icons/icon_heartfill.png'),
                                const SizedBox(width: 6),
                                Text(
                                  '2.6 k',
                                  style: TextStyle(
                                    color: Theme.of(context).highlightColor,
                                    fontSize: 14,
                                    fontFamily: 'GB',
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icon_comment.png',
                                  color: Theme.of(context).highlightColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '300',
                                  style: TextStyle(
                                    color: Theme.of(context).highlightColor,
                                    fontSize: 14,
                                    fontFamily: 'GB',
                                  ),
                                )
                              ],
                            ),
                            Image.asset(
                              'assets/icons/icon_send.png',
                              color: Theme.of(context).highlightColor,
                            ),
                            Image.asset(
                              'assets/icons/icon_save.png',
                              color: Theme.of(context).highlightColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
