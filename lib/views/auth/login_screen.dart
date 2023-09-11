// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_app/main.dart';
import 'package:chat_app/views/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimated = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 500), () {
      setState(() {
        _isAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome to We Chat"),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: mq.height * 0.15,
            right: _isAnimated ? mq.width * 0.25 : -mq.width * 0.5,
            width: mq.width * 0.5,
            duration: Duration(seconds: 2),
            child: Image.asset("assets/icons/message.png"),
          ),

          ///google login button
          AnimatedPositioned(
            bottom: mq.height * 0.15,
            left: _isAnimated ? mq.width * 0.05 : -mq.width * 1,
            width: mq.width * 0.9,
            height: mq.height * 0.06,
            duration: Duration(seconds: 2),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 223, 255, 187),
                shape: StadiumBorder(),
                elevation: 1,
              ),
              icon: Image.asset(
                "assets/icons/google.png",
                height: mq.height * 0.03,
              ),
              label: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(text: "Login with "),
                    TextSpan(
                      text: "Google",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
