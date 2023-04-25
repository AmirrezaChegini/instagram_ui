import 'package:flutter/material.dart';
import 'package:instagram_ui/widgets/grid_pics.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    sliver: SliverToBoxAdapter(
                      child: Header(),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverToBoxAdapter(
                      child: MainPic(),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    sliver: GridPics(
                      childCounts: 8,
                      image: 'images/post',
                    ),
                  ),
                ],
              ),
            ),
            BottomContainer(),
          ],
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Take',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}

class MainPic extends StatelessWidget {
  const MainPic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset('assets/images/post9.png'),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Post',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(width: 15),
        Image.asset(
          'assets/icons/icon_arrowdown.png',
          color: Theme.of(context).highlightColor,
        ),
        const Spacer(),
        Text(
          'Next',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(width: 15),
        Image.asset(
          'assets/icons/icon_next.png',
          color: Theme.of(context).highlightColor,
        ),
      ],
    );
  }
}
