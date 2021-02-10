import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChatListItemSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
          child: ListTile(
            contentPadding: EdgeInsets.only(right: 200),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
            ),
            title: Container(
              height: 10,
              color: Colors.grey[300],
            ),
            subtitle: Container(
              height: 10,
              color: Colors.grey[300],
            ),
          ),
        ));
  }
}
