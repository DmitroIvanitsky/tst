import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/locale_keys.g.dart';
import '../viewModel/user_view_model.dart';
import 'thumb_image.dart';
import '../../navigation.dart';


class UserCardWidget extends StatelessWidget{
  final UserViewModel user;
  UserCardWidget(this.user);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> RepositoryProvider.of<Navigation>(context).goToPostsPageScreen(context, user),
      child: Container(
        height: 150,
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.background,
            ),
            borderRadius: BorderRadius.all(Radius.circular(28))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ThumbImage(imageUrl: user.thumbnailUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(user.name, style: Theme.of(context).textTheme.displayLarge),
                  Text(LocaleKeys.unique_posts.tr() + user.uniquePosts.length.toString(), style: Theme.of(context).textTheme.displayMedium).tr(),
                  if (user.duplicatePostsCount > 0) Text(LocaleKeys.duplicates.tr() + user.duplicatePostsCount.toString()).tr()
                ],
              ),
            ),
            Icon(Icons.arrow_right, size: 50, color: Colors.grey,)
          ],
        ),
      ),
    );
  }

}