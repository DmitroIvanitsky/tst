import 'package:flutter/material.dart';

import 'main_page/viewModel/user_view_model.dart';
import 'posts_page/posts_page.dart';

class Navigation {
  Navigation();

  goToPostsPageScreen(BuildContext context, UserViewModel user) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostsPageScreen(user: user)
      )
    );


  navigateBack<T>({required BuildContext context, T? returnValue}){
    return Navigator.of(context).pop(returnValue);
  }
}