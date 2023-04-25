import 'package:flutter/material.dart';

class GridPics extends StatelessWidget {
  const GridPics({
    super.key,
    required this.childCounts,
    required this.image,
  });
  final int childCounts;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: childCounts,
        (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/$image$index.png',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
    );
  }
}
