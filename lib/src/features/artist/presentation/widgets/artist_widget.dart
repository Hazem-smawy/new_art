// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:newart/src/core/extensions/context_extensions.dart';

class ArtistItemWidget extends StatelessWidget {
  final String image;
  final String name;
  const ArtistItemWidget({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                color: Colors.green.withAlpha(50),
                spreadRadius: 2,
                blurRadius: 15,
              )
            ],
            border: Border.all(
              color: context.secondaryTextColor.withAlpha(50),
            ),
            color: const Color.fromARGB(255, 31, 54, 123),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        context.g12,
        Text(
          name,
          style: context.displayMedium,
        )
      ],
    );
  }
}
