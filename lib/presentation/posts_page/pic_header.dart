import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/widgets/loading_indicator.dart';

class PicHeaderWidget extends StatelessWidget {
  final String imageUrl;

  const PicHeaderWidget({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)
        ),
        child: CachedNetworkImage(
          fit: BoxFit.fitWidth,
          imageUrl: imageUrl,
          placeholder: (context, url) => const Padding(
            padding: EdgeInsets.all(25.0),
            child: LoadingIndicator(),
          ),
          errorWidget: (context, url, error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}