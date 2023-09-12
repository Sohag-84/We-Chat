// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
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
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(mq.height * 0.3),
            child: CachedNetworkImage(
              width: mq.height * 0.055,
              height: mq.height * 0.055,
              imageUrl: userChat.image,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          title: Text(userChat.name),
          subtitle: Text(userChat.about, maxLines: 1),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.greenAccent.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // trailing: Text(
          //   "12:56 PM",
          //   style: TextStyle(color: Colors.black54),
          // ),
        ),
      ),
    );
  }
}
