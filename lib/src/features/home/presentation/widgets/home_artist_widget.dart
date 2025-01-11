import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/widgets/custom_outline_btn_widget.dart';
import 'package:new_art/src/features/artist/presentation/widgets/artist_widget.dart';

class HomeArtistWidget extends StatelessWidget {
  const HomeArtistWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            context.g12,
            // Text(
            //   'كل الفنانين',
            //   style: context.bodySmall,
            //   textAlign: TextAlign.right,
            // ),
            const Spacer(),
            Text(
              'كبار الفنانين',
              style: context.titleLarge,
              textAlign: TextAlign.right,
            ),
          ],
        ).ph(16),
        context.g12,
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArtistItemWidget(
                  image: 'assets/images/face1.jpg',
                  name: 'محمد علي محمد',
                ),
                ArtistItemWidget(
                  image: 'assets/images/face3.jpg',
                  name: 'محمد علي محمد',
                ),
              ],
            ).ph(10),
            context.g20,
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: context.width / 1.2,
                child: CustomOutlineBtnWidget(
                  action: () {},
                  title: 'عرض الكل',
                ),
              ),
            )
          ],
        ).p(20)
      ],
    );
  }
}
