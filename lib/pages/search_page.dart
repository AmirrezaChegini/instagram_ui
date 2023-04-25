import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static const List<String> chipsTitle = [
    'All',
    'Account',
    'Hashtag',
    'Caption',
    'Story',
    'Common',
    'Shop',
    'Game',
    'Movie',
    'Favorite',
  ];

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            sliver: SliverToBoxAdapter(
              child: SearchBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 23,
              child: ChoicChips(chipsTitle: chipsTitle),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
            sliver: GridPosts(),
          ),
        ],
      ),
    );
  }
}

class GridPosts extends StatelessWidget {
  const GridPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: 17,
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
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const [
          QuiltedGridTile(2, 1),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
    );
  }
}

class ChoicChips extends StatelessWidget {
  const ChoicChips({
    super.key,
    required this.chipsTitle,
  });

  final List<String> chipsTitle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 60,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            chipsTitle[index],
            style: TextStyle(
              color: Theme.of(context).highlightColor,
              fontSize: 10,
              fontFamily: 'GB',
            ),
          ),
        );
      },
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.background,
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
          suffixIcon: Image.asset(
            'assets/icons/icon_scan.png',
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
    );
  }
}
