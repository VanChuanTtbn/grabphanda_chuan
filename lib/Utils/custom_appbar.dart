import 'package:flutter/material.dart';

class CustomAppBar extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height - 280);
    // path.quadraticBezierTo(size.width /2, size.height,
    //   size.width, size.height - 50,);
    path.lineTo(size.width + 1000, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}