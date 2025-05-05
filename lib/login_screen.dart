import 'package:flutter/material.dart';
import 'package:shopping_app/forgot_screen.dart';
import 'package:shopping_app/product_overview_screen.dart';
import 'package:shopping_app/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  String? email;
  String? password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Image(
                      image:
                          AssetImage('images/Screenshot 2025-05-05 071339.png'),
                      width: 250,
                      height: 300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: TextField(
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
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter Your Password',
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
                height: 6,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotScreen()));
                  },
                  child: Text(
                    'Forgot Password ? ',
                    style: TextStyle(
                        color: Colors.cyan, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 6,
              ),
              WelcomeTwoButton(
                text: 'Log In',
                colour: Colors.cyan,
                onPressed: () async {
                  if (email == null ||
                      email!.isEmpty ||
                      password == null ||
                      password!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                        content: Text(
                          'Please enter email and password.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                    return; // stop execution here
                  }

                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await auth.signInWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductOverviewScreen()));
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                          content: Text(
                            'Invalid email or password.',
                            style: TextStyle(color: Colors.white),
                          )),
                    );
                  } finally {
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
              )
            ],
          ),
          if (showSpinner)
            Center(
              child: CircularProgressIndicator(color: Colors.cyan),
            ),
        ],
      ),
    );
  }
}
