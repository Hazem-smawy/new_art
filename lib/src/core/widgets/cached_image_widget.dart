import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';

class CachedImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;

  const CachedImageWidget({
    super.key,
    this.imageUrl,
    this.width = double.infinity,
    this.height = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            // placeholder: (context, url) => Center(
            //   child: SizedBox(
            //     width: 30,
            //     height: 30,
            //     child: CircularProgressIndicator(),
            //   ),
            // ),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, size: 50, color: Colors.red),
            width: width,
            height: height,
            fit: BoxFit.cover,
          )
        : Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: context.secondaryTextColor.withAlpha(50))),
            child: Icon(
              Icons.image,
              size: 50,
              color: context.secondary,
            ),
          );
  }
}
