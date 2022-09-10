import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text('Instagram'),
      actions: [
        GestureDetector(
          onTap: () => showBottomSheet(context),
          child: Image.asset(
            'assets/icons/icon_direct.png',
            color: Theme.of(context).highlightColor,
          ),
        ),
      ],
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
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
                    child: _bottomSheetContent(context, scrollController),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _bottomSheetContent(
      BuildContext context, ScrollController scrollController) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: 10, bottom: 32, left: 30, right: 30),
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
                SizedBox(height: 22),
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
                SizedBox(height: 22),
                Container(
                  height: 46,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Constants.white.withOpacity(0.4),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(color: Colors.transparent),
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
        _sliverGrid(),
      ],
    );
  }

  Widget _sliverGrid() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: 18,
          (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/person$index.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 5),
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 33,
          mainAxisExtent: 97,
        ),
      ),
    );
  }

  Widget _body() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(left: 7, right: 17, top: 8),
            height: 98,
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 13,
              itemBuilder: (context, index) =>
                  index == 0 ? _iconAddStory(context) : _story(context, index),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 17, right: 17, top: 32),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => _post(context, index),
            ),
          ),
        ),
      ],
    );
  }

  Widget _post(BuildContext context, int i) {
    return Column(
      children: [
        _headerPost(context, i),
        SizedBox(height: 23),
        _contentPost(context, i),
        SizedBox(height: 32),
      ],
    );
  }

  Widget _contentPost(BuildContext context, int i) {
    return Container(
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
              padding: EdgeInsets.symmetric(horizontal: 25),
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
                            SizedBox(width: 6),
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
                            SizedBox(width: 6),
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
    );
  }

  Widget _headerPost(BuildContext context, int i) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/person$i.png'),
          ),
        ),
        SizedBox(width: 10),
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
            SizedBox(height: 5),
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
        Spacer(),
        Image.asset(
          'assets/icons/icon_more.png',
          color: Theme.of(context).highlightColor,
        ),
      ],
    );
  }

  Widget _story(BuildContext context, int i) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(2),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('assets/images/person${i - 1}.png'),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Person $i',
          style: TextStyle(
            color: Theme.of(context).highlightColor,
            fontSize: 11,
            fontFamily: 'GB',
          ),
        )
      ],
    );
  }

  Widget _iconAddStory(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              width: 2,
              color: Theme.of(context).highlightColor,
            ),
          ),
          child: Image.asset('assets/icons/icon_add.png'),
        ),
        SizedBox(height: 10),
        Text(
          'Your Story',
          style: TextStyle(
            color: Theme.of(context).highlightColor,
            fontSize: 11,
            fontFamily: 'GB',
          ),
        )
      ],
    );
  }
}
