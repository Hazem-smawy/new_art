import 'package:flutter/material.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/features/home/data/models/home_model.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
    required this.newsItem,
  });

  final NewsItem newsItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      // padding: EdgeInsets.all(12),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8),
      //   border: Border.all(
      //     color: context.secondaryTextColor.withAlpha(50),
      //   ),
      // ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   padding: EdgeInsets.all(5),
              //   // decoration: BoxDecoration(
              //   //   borderRadius: BorderRadius.circular(20),
              //   //   color: context.containerColor,
              //   // ),
              //   child: Text(
              //     newsItem.startdate,
              //     style: context.bodySmall,
              //   ),
              // ),
              Expanded(
                child: Text(
                  newsItem.name,
                  textAlign: TextAlign.right,
                  style: context.titleMedium,
                ),
              ),
            ],
          ),
          if (newsItem.more.isNotEmpty) context.g4,
          if (newsItem.more.isNotEmpty)
            Text(
              newsItem.more,
              textAlign: TextAlign.right,
              style: context.bodySmall,
            ),
          context.g8,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red.withAlpha(20),
                ),
                child: Text(
                  'ينتهي : 20/2/2020',
                  style: context.bodySmall,
                ),
              ),
              context.g12,
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.withAlpha(20),
                ),
                child: Text(
                  'يبدأ : 20/2/2020',
                  style: context.bodySmall,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
