import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/routes/app_pages.dart';

class HomeOurRecentWorkWidget extends StatelessWidget {
  const HomeOurRecentWorkWidget({
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
            //   'كل الاعمال',
            //   style: context.bodySmall,
            //   textAlign: TextAlign.right,
            // ),
            const Spacer(),
            Text(
              'احدث اعمالنا ',
              style: context.titleLarge,
              textAlign: TextAlign.right,
            ),
          ],
        ).ph(16),
        context.g12,
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 16),
            reverse: true,
            children: [
              Container(
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: context.secondaryTextColor.withAlpha(50),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const Spacer(),
                        FaIcon(
                          Icons.music_note_outlined,
                          size: 30,
                          color: context.secondaryTextColor,
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'ست البنات',
                              style: context.bodyLarge.copyWith(
                                color: context.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              context.g12,
              Container(
                width: 180,
                // height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/s2.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ست البنات',
                      style: context.displayLarge.copyWith(
                        color: context.whiteColor,
                      ),
                    ).p(10),
                  ],
                ),
              ),
              context.g12,
              Container(
                width: 80,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/face1.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Column(
                  children: [
                    // const HomeFooterWidget(),
                  ],
                ),
              ),
              context.g12,
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.NEW_WORK_PAGE,
                  );
                },
                child: Container(
                  width: 35,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: context.secondary,
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      color: context.whiteColor,
                    ),
                  ),
                ),
              ),
              context.g16,
            ],
          ),
        ),
      ],
    );
  }
}
