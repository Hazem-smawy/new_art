import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../constants/colors.dart';

extension CustomImage on Image {
  // static Widget memoryWithError(Uint8List? imageData,
  //     {double? w,
  //     double? h,
  //     BoxFit? fit,
  //     BoxDecoration decoration = const BoxDecoration(
  //       shape: BoxShape.circle,
  //       color: AppColors.whiteColor,
  //     )}) {
  //   return SizedBox(
  //     width: w,
  //     height: h,
  //     child: imageData != null
  //         ? Image.memory(
  //             fit: fit ?? BoxFit.cover,
  //             width: w ?? double.infinity,
  //             height: h ?? double.infinity,
  //             imageData,
  //             errorBuilder:
  //                 (BuildContext context, Object error, StackTrace? stackTrace) {
  //               return Container(
  //                 width: w,
  //                 height: h,
  //                 decoration: decoration,
  //               );
  //             },
  //           )
  //         : Container(
  //             width: w,
  //             height: h,
  //             decoration: decoration,
  //           ),
  //   );
  // }
  static Widget memoryWithError(Uint8List? imageData,
      {double? w,
      double? h,
      BoxFit? fit,
      BoxDecoration decoration = const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteColor,
      )}) {
    return SizedBox(
      width: w,
      height: h,
      child: imageData != null
          ? Builder(
              builder: (context) {
                try {
                  return Image.memory(
                    imageData,
                    fit: fit ?? BoxFit.cover,
                    width: w ?? double.infinity,
                    height: h ?? double.infinity,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Container(
                        height: h,
                        width: w ?? double.infinity,
                        decoration: decoration,
                        child:
                            const Icon(Icons.broken_image, color: Colors.grey),
                      );
                    },
                  );
                } catch (e) {
                  // If there is an exception during decoding, return the error container
                  return Container(
                    width: w ?? double.infinity,
                    height: h,
                    decoration: decoration,
                    child: const Icon(Icons.broken_image, color: Colors.red),
                  );
                }
              },
            )
          : Container(
              width: w ?? double.infinity,
              height: h,
              decoration: decoration,
              child: const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
    );
  }

  static Widget memoryWithErorrAndLoading(Uint8List? imageData,
      {required ImageProvider fallbackImage, double w = 50, double h = 50}) {
    return SizedBox(
      width: w,
      height: h,
      child: FutureBuilder<Uint8List>(
        future: Future.value(imageData ?? Uint8List(0)),
        builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Image(image: fallbackImage);
          } else {
            return Image.memory(
              snapshot.data!,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Image(image: fallbackImage);
              },
            );
          }
        },
      ),
    );
  }
}
