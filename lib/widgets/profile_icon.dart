import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
    this.size = 64,
    required this.image,
    this.border = const Border(),
  });

  final double size;
  final String image;
  final BoxBorder border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: border,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset('assets/$image.png'),
      ),
    );
  }
}
