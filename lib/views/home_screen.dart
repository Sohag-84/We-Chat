// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:chat_app/api/apis.dart';
import 'package:chat_app/models/chat_user_model.dart';
import 'package:chat_app/views/profile_screen.dart';
import 'package:chat_app/widgets/chat_user_card.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser> list = [];

  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text("We Chat"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(
                    chatUser: APIs.me,
                  ),
                ),
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          onPressed: () async {
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),
      body: StreamBuilder(
        stream: APIs.getAllUser(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final data = snapshot.data?.docs;
            list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];
            return list.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    physics: BouncingScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ChatUserCard(
                        userChat: list[index],
                      );
                    },
                  )
                : Center(
                    child: Text("No Chat Found"),
                  );
          }
        },
      ),
    );
  }
}
