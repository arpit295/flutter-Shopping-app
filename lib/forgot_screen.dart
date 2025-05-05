import 'package:flutter/material.dart';
import 'package:shopping_app/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final auth = FirebaseAuth.instance;
  String? email;
  final emailController = TextEditingController();

  Future resetPassword() async {
    await auth.sendPasswordResetEmail(email: emailController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: 'logo',
              child: Container(
                margin: EdgeInsets.only(top: 0),
                child: Image(
                  image: AssetImage('images/Screenshot 2025-05-05 071339.png'),
                  width: 250,
                  height: 300,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 350,
            child: TextField(
              controller: emailController,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Enter Your Email',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyan,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          WelcomeTwoButton(
            text: 'Reset Password',
            colour: Colors.cyan,
            onPressed: () async {
              resetPassword();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
