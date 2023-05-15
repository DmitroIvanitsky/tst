import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/loading_indicator.dart';

class ThumbImage extends StatelessWidget {
  final String imageUrl;

  const ThumbImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => const Padding(
          padding: EdgeInsets.all(25.0),
          child: LoadingIndicator(),
        ),
        errorWidget: (context, url, error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
