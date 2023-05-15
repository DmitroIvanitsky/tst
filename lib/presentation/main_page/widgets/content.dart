import 'package:flutter/material.dart';

import '../viewModel/user_view_model.dart';
import 'user_card.dart';

class Content extends StatelessWidget {
  final List<UserViewModel> models;

  Content({required this.models, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: models.length,
        itemBuilder: (BuildContext context, int index) {
          return UserCardWidget(models[index]);
        });
  }
}
