import 'package:flutter/material.dart';

class MyCustomRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransition({required this.route})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) {
      return route;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      );
      return SlideTransition(
        position: tween,
        child: child,
      );
    },
  );
}