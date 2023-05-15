import 'package:flutter/material.dart';

import '../../domain/models/post.dart';


class PostCardWidget extends StatelessWidget {
  final Post post;

  const PostCardWidget({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(28))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(child: Text(post.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 25),)),
            ),
            Center(child: Text(post.body, textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
          ],
        ),
      ),
    );
  }
}