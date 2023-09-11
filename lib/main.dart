import 'package:chat_app/views/auth/login_screen.dart';
import 'package:flutter/material.dart';

///global object for accessing device screen size
late Size mq;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
