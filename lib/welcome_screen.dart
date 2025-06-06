import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shopping_app/login_screen.dart';
import 'package:shopping_app/product_overview_screen.dart';
import 'package:shopping_app/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    checkUserLoginStatus();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void checkUserLoginStatus() {
    final user = auth.currentUser;
    if (user != null) {
      // User is already logged in, go directly to the product screen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductOverviewScreen()),
        );
      });
    }
    // else stay on WelcomeScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Image(
                      width: 50,
                      image:
                          AssetImage('images/Screenshot 2025-05-05 071339.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'ShopZone',
                      textStyle:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            WelcomeTwoButton(
              text: 'Log In',
              colour: Colors.cyan,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: 15,
            ),
            WelcomeTwoButton(
              text: 'Register',
              colour: Colors.orange,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class WelcomeTwoButton extends StatelessWidget {
  WelcomeTwoButton(
      {required this.text, required this.colour, required this.onPressed});

  final String text;
  final Color colour;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(330, 50),
        backgroundColor: colour,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
