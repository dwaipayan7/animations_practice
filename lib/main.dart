import 'package:flutter/material.dart';
import 'package:untitled/explicit_animations/loading_animation.dart';

import 'explicit_animations/list_animations.dart';
import 'explicit_animations/login_animations.dart';
import 'implicit_examples/animated_color_palette.dart';
import 'implicit_examples/animated_shopping_cart.dart';
import 'implicit_examples/animated_tween_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ListAnimations(),
      home: RadialProgressIndicator(
        progress: 0.65,
        color: Colors.blue,
      ),
    );
  }
}
