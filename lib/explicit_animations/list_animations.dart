import 'package:flutter/material.dart';

class ListAnimations extends StatefulWidget {
  const ListAnimations({super.key});

  @override
  State<ListAnimations> createState() => _ListAnimationsState();
}

class _ListAnimationsState extends State<ListAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  // late Animation<Offset> slideAnimation;
  List<Animation<Offset>> animations = [];
  final itemCount = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    // slideAnimation = Tween(begin: Offset(-1, 0), end: Offset.zero).animate(controller);

    animations = List.generate(
      itemCount,
      (index) => Tween(begin: Offset(-1, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(index * (1 / itemCount), 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Animations"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: animations[index],
            child: ListTile(
              title: Text("Dwaipayan Biswas", semanticsLabel: index.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        child: Icon(
          Icons.done,
        ),
      ),
    );
  }
}
