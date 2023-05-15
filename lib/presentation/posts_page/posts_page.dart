import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../l10n/locale_keys.g.dart';
import '../main_page/viewModel/user_view_model.dart';
import 'post_card.dart';
import 'pic_header.dart';

class PostsPageScreen extends StatelessWidget {
  const PostsPageScreen({Key? key, required this.user}) : super(key: key);
  final UserViewModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.list_of_posts.tr()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: PicHeaderWidget(imageUrl: user.url),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: user.uniquePosts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostCardWidget(post: user.uniquePosts[index]);
                }),
          )
        ],
      )
    );
  }
}
