import 'package:flutter/material.dart';

class CustomClipDecoracao extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path();

    path.moveTo(w*0.65, 0);
    path.quadraticBezierTo(w*0.65, h, w, h);
    path.lineTo(w, 0);
    // path.quadraticBezierTo(size.width,size.height*0.4500000,size.width,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}