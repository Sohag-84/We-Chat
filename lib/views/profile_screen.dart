// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/api/apis.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat_user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser chatUser;
  const ProfileScreen({super.key, required this.chatUser});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.redAccent,
          onPressed: () async {
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          },
          icon: Icon(Icons.logout),
          label: Text("Logout"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(mq.height * 0.1),
                child: CachedNetworkImage(
                  width: mq.height * 0.2,
                  height: mq.height * 0.2,
                  fit: BoxFit.fill,
                  imageUrl: widget.chatUser.image,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: mq.height * 0.02),
            Text(
              widget.chatUser.email,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            SizedBox(height: mq.height * 0.03),
            TextFormField(
              initialValue: widget.chatUser.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.person),
                hintText: "eg. Abdullah Al Raiyan",
                label: Text("Name"),
              ),
            ),
            SizedBox(height: mq.height * 0.03),
            TextFormField(
              initialValue: widget.chatUser.about,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.info_outline),
                hintText: "eg. Feeling Happy",
                label: Text("About"),
              ),
            ),
            SizedBox(height: mq.height * 0.05),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                "Update",
                style: TextStyle(fontSize: 16),
              ),
              icon: Icon(Icons.edit,size: 28),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                minimumSize: Size(mq.width * 0.5, mq.height * 0.055),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
