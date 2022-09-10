import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                _top(context),
                _mainPic(),
                _sliverGrid(),
              ],
            ),
          ),
          _bottomContainer(context)
        ],
      ),
    );
  }

  Widget _sliverGrid() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: 8,
          (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/post$index.png'),
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

  Widget _mainPic() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset('assets/images/post9.png'),
        ),
      ),
    );
  }

  Widget _top(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(
              'Post',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(width: 15),
            Image.asset(
              'assets/icons/icon_arrowdown.png',
              color: Theme.of(context).highlightColor,
            ),
            Spacer(),
            Text(
              'Next',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(width: 15),
            Image.asset(
              'assets/icons/icon_next.png',
              color: Theme.of(context).highlightColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomContainer(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Draft',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 16,
                fontFamily: 'GB',
              ),
            ),
            Text(
              'Gallery',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Take',
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }
}
