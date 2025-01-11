// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:new_art/src/core/constants/colors.dart';
// import 'package:new_art/src/core/extensions/context_extensions.dart';
// import 'package:new_art/src/core/extensions/padding_extension.dart';
// import 'package:new_art/src/core/widgets/custom_text_filed_widget.dart';
// import 'package:new_art/src/core/widgets/header_widget.dart';
// import 'package:new_art/src/core/widgets/thin_divider_widget.dart';
// import 'package:new_art/src/features/home/presentation/pages/sub_page/home_page.dart';

// import '../../../../core/constants/spaces_sizes.dart';

// class AddOrderPage extends StatelessWidget {
//   const AddOrderPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppbar(
//         nooryes: true,
//         isBack: true,
//         title: 'اضافة طلب',
//         circular: 0.0,
//         heightbar: 50.0,
//         color: context.primary,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // const HeaderWidget(title: 'اضافة طلب'),

//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: context.primary,
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(12),
//                   bottomRight: Radius.circular(12),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   const ThinDividerWidget(),
//                   context.g28,
//                   Text(
//                     'عميلنا العزيز :',
//                     textAlign: TextAlign.left,
//                     textDirection: TextDirection.rtl,
//                     style: context.bodyLarge.copyWith(
//                       color: context.whiteColor,
//                     ),
//                   ),
//                   Text(
//                     'يرجى تعبئة البيانات  كاملة والتأكد من صحتها قبل إرسالها',
//                     textAlign: TextAlign.center,
//                     style: context.displayMedium.copyWith(
//                       color: context.whiteColor,
//                     ),
//                   ),
//                   context.g28,
//                 ],
//               ),
//             ),
//             context.g16,
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SearchDropdownWidget(),
//                     context.g20,
//                     CustomTextFieldWidget(
//                       controller: TextEditingController(),
//                       label: 'اسم الطلب',
//                     ),
//                     context.g20,
//                     CustomTextFieldWidget(
//                       controller: TextEditingController(),
//                       label: 'نوع الطلب',
//                     ),
//                     context.g20,
//                     CustomTextFieldWidget(
//                       controller: TextEditingController(),
//                       label: 'اسم الفنان',
//                     ),
//                     context.g20,
//                     CustomTextFieldWidget(
//                         controller: TextEditingController(),
//                         label: 'رابط الطلب'),
//                     context.g20,
//                     CustomTextFieldWidget(
//                       controller: TextEditingController(),
//                       label: 'القصيدة',
//                     ),
//                     context.g20,
//                     CustomTextFieldWidget(
//                       controller: TextEditingController(),
//                       label: 'ملاحظة',
//                     ),
//                     context.g20,
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color: context.secondaryTextColor.withOpacity(
//                             0.2,
//                           ),
//                         ),
//                       ),
//                       width: double.infinity,
//                       height: 50,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'المرفقات الصوتية',
//                             style: context.bodyLarge,
//                           ),
//                           context.g8,
//                           FaIcon(
//                             FontAwesomeIcons.upload,
//                             color: context.secondaryTextColor,
//                             size: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     context.g20,
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryColor,
//                         elevation: 0,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: Spaces.sp16,
//                           vertical: Spaces.sp8,
//                         ),
//                         minimumSize: const Size.fromHeight(50),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           side: BorderSide(
//                             color: AppColors.containerColor.withOpacity(0.5),
//                           ),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: Text(
//                         'إرسال',
//                         style: context.titleLarge.copyWith(
//                           color: context.whiteColor,
//                         ),
//                       ),
//                     ),
//                     context.g28,
//                   ],
//                 ).ph(16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppbar({
//     super.key,
//     this.title,
//     this.nooryes,
//     this.isBack,
//     this.heightbar,
//     this.wherSerch,
//     this.circular,
//     this.color,
//   });

//   final bool? nooryes;
//   final bool? isBack;
//   final String? title;
//   final String? wherSerch;
//   final double? heightbar;
//   final double? circular;
//   final Color? color;

//   @override
//   Size get preferredSize => Size.fromHeight(heightbar!);
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       toolbarHeight: heightbar,
//       centerTitle: false,
//       automaticallyImplyLeading: false,
//       // titleSpacing: 0,
//       title: Row(
//         textDirection: TextDirection.rtl,
//         children: [
//           Visibility(
//             visible: isBack!,
//             child: IconButton(
//               onPressed: () {
//                 Get.back();
//               },
//               icon: Icon(
//                 FontAwesomeIcons.chevronRight,
//                 color: context.whiteColor,
//                 size: 20,
//               ),
//             ),
//           ),
//           context.g8,
//           Text(
//             title!,
//             style: context.titleLarge.copyWith(
//               color: context.whiteColor,
//             ),
//           ),
//           const Spacer(),
//           FaIcon(
//             FontAwesomeIcons.magnifyingGlass,
//             color: context.whiteColor,
//             size: 20,
//           ),
//           context.g12,
//           FaIcon(
//             FontAwesomeIcons.bell,
//             color: context.whiteColor,
//             size: 20,
//           ),
//         ],
//       ),
//       elevation: 0,
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(circular!),
//             bottomRight: Radius.circular(circular!),
//           ),
//         ),
//       ),
//       backgroundColor: AppColors.whiteColor,
//       systemOverlayStyle: SystemUiOverlayStyle.light,
//     );
//   }
// }

// // ignore_for_file: public_member_api_docs, sort_constructors_first

// class SearchDropdownWidget extends StatelessWidget {
//   const SearchDropdownWidget({
//     super.key,
//   });

//   // BillController billController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 55,
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: CustomDropdown<String>.search(
//           hintText: 'اسم العميل',
//           searchHintText: 'بحث ...',
//           // noResultFoundText: 'لا توجد نتائج',
//           noResultFoundBuilder: (context, e) => GestureDetector(
//             onTap: () {},
//             child: Container(
//               padding: const EdgeInsets.all(5),
//               margin: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: context.containerColor,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const FaIcon(Icons.person_add),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     'اضافة عميل',
//                     style: context.bodyMedium,
//                   )
//                 ],
//               ),
//             ),
//           ),

//           items: const ['hello', 'mon'],
//           excludeSelected: false,
//           // overlayHeight: 100,
//           decoration: CustomDropdownDecoration(
//             closedBorderRadius: BorderRadius.circular(20),
//             expandedBorderRadius: BorderRadius.circular(20),
//           ),
//           onChanged: (value) {},
//         ),
//       ),
//     );
//   }
// }
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/constants/colors.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/widgets/custom_text_filed_widget.dart';
import 'package:new_art/src/core/widgets/header_widget.dart';

import '../../../../core/constants/spaces_sizes.dart';

class AddOrderPage extends StatelessWidget {
  const AddOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(title: 'اضافة طلب'),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: context.primary,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.secondaryTextColor.withAlpha(50),
                    )),
                child: Column(
                  children: [
                    // context.g12,
                    Text(
                      'عميلنا العزيز :',
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.rtl,
                      style: context.bodyLarge.copyWith(
                        color: context.primary,
                      ),
                    ),
                    Text(
                      'يرجى تعبئة البيانات  كاملة والتأكد من صحتها قبل إرسالها',
                      textAlign: TextAlign.center,
                      style: context.displayMedium.copyWith(
                        color: context.blackColor,
                      ),
                    ),
                    // context.g8,
                  ],
                ),
              ),
              // context.g16,
              Column(
                children: [
                  const SearchDropdownWidget(),
                  context.g12,
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFieldWidget(
                          controller: TextEditingController(),
                          label: 'نوع الطلب',
                        ),
                      ),
                      context.g8,
                      Expanded(
                        child: CustomTextFieldWidget(
                          controller: TextEditingController(),
                          label: 'اسم الطلب',
                        ),
                      ),
                    ],
                  ),
                  context.g8,
                  CustomTextFieldWidget(
                    controller: TextEditingController(),
                    label: 'اسم الفنان',
                  ),
                  context.g8,
                  CustomTextFieldWidget(
                      controller: TextEditingController(), label: 'رابط الطلب'),
                  context.g8,
                  CustomTextFieldWidget(
                    controller: TextEditingController(),
                    label: 'القصيدة',
                  ),
                  context.g8,
                  CustomTextFieldWidget(
                    controller: TextEditingController(),
                    label: 'ملاحظة',
                  ),
                  context.g12,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.secondaryTextColor.withAlpha(
                          50,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'المرفقات الصوتية',
                          style: context.bodyLarge,
                        ),
                        context.g8,
                        FaIcon(
                          FontAwesomeIcons.upload,
                          color: context.secondaryTextColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  context.g16,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spaces.sp16,
                        vertical: Spaces.sp8,
                      ),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: AppColors.containerColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'إرسال',
                      style: context.titleLarge.copyWith(
                        color: context.whiteColor,
                      ),
                    ),
                  ),
                  context.g28,
                ],
              ).ph(16),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title,
    this.nooryes,
    this.isBack,
    this.heightbar,
    this.wherSerch,
    this.circular,
    this.color,
  });

  final bool? nooryes;
  final bool? isBack;
  final String? title;
  final String? wherSerch;
  final double? heightbar;
  final double? circular;
  final Color? color;

  @override
  Size get preferredSize => Size.fromHeight(heightbar!);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: heightbar,
      centerTitle: false,
      automaticallyImplyLeading: false,
      // titleSpacing: 0,
      title: Row(
        textDirection: TextDirection.rtl,
        children: [
          Visibility(
            visible: isBack!,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                FontAwesomeIcons.chevronRight,
                color: context.whiteColor,
                size: 20,
              ),
            ),
          ),
          context.g8,
          Text(
            title!,
            style: context.titleLarge.copyWith(
              color: context.whiteColor,
            ),
          ),
          const Spacer(),
          FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            color: context.whiteColor,
            size: 20,
          ),
          context.g12,
          FaIcon(
            FontAwesomeIcons.bell,
            color: context.whiteColor,
            size: 20,
          ),
        ],
      ),
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(circular!),
            bottomRight: Radius.circular(circular!),
          ),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

class SearchDropdownWidget extends StatelessWidget {
  const SearchDropdownWidget({
    super.key,
  });

  // BillController billController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomDropdown<String>.search(
          hintText: 'اسم العميل',
          searchHintText: 'بحث ...',
          // noResultFoundText: 'لا توجد نتائج',
          noResultFoundBuilder: (context, e) => GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: context.containerColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(Icons.person_add),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'اضافة عميل',
                    style: context.bodyMedium,
                  )
                ],
              ),
            ),
          ),

          items: const ['hello', 'mon'],
          excludeSelected: false,
          // overlayHeight: 100,
          decoration: CustomDropdownDecoration(
            closedBorderRadius: BorderRadius.circular(12),
            expandedBorderRadius: BorderRadius.circular(12),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
