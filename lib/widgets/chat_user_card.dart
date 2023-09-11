// ignore_for_file: prefer_const_constructors

import 'package:chat_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatelessWidget {
  const ChatUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: mq.width * 0.04,
        vertical: 4,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(CupertinoIcons.person),
          ),
          title: Text("Raiyan"),
          subtitle: Text("Assalamo alaikom", maxLines: 1),
          trailing: Text(
            "12:56 PM",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
