// ignore_for_file: prefer_const_constructors

import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat_user_model.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatelessWidget {
  final ChatUser userChat;
  const ChatUserCard({super.key, required this.userChat});

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
            child: Image.network(userChat.image),
          ),
          title: Text(userChat.name),
          subtitle: Text(userChat.about, maxLines: 1),
          trailing: Text(
            "12:56 PM",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
