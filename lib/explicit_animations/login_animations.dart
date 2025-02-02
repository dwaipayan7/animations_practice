import 'package:flutter/material.dart';

class LoginAnimations extends StatefulWidget {
  const LoginAnimations({super.key});

  @override
  State<LoginAnimations> createState() => _LoginAnimationsState();
}

class _LoginAnimationsState extends State<LoginAnimations>
    with SingleTickerProviderStateMixin {
  late Animation<double> logoFadeAnimation;
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    slideAnimation = Tween(begin: Offset(-1, -1), end: Offset.zero).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: logoFadeAnimation,
              child: FlutterLogo(
                size: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SlideTransition(
                position: slideAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("User"),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Password"),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
