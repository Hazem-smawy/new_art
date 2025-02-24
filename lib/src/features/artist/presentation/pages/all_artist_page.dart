import 'package:flutter/material.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/features/artist/presentation/widgets/artist_widget.dart';

class AllArtistPage extends StatelessWidget {
  const AllArtistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(title: 'كل الفنانين'),
            context.g20,
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return const ArtistItemWidget(
                      image: 'assets/images/face1.jpg',
                      name: 'محمد احمد السعيد',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
