import 'package:flip_animation/components.dart';
import 'package:flutter/material.dart';

class HalfCircleClipper extends CustomClipper<Path> {
  HalfCircleClipper({required this.side});
  final CircleSide side;

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
