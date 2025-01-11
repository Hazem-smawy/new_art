// import 'package:flutter/material.dart';

// class StepData {
//   final String name;
//   final String date;

//   StepData({required this.name, required this.date});
// }

// class HorizontalStepperWithNamesAndDates extends StatelessWidget {
//   final int totalSteps;
//   final int currentStep;
//   final List<StepData> steps;

//   const HorizontalStepperWithNamesAndDates({
//     super.key,
//     required this.totalSteps,
//     required this.currentStep,
//     required this.steps,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(totalSteps, (index) {
//         // Alternate top/bottom positions for name and date
//         bool isTop = index % 2 == 0;
//         return Row(
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 if (isTop)
//                   StepTitle(name: steps[index].name, date: steps[index].date),
//                 StepCircle(
//                   stepNumber: index + 1,
//                   isActive: index + 1 <= currentStep,
//                 ),
//                 if (!isTop)
//                   StepTitle(name: steps[index].name, date: steps[index].date),
//               ],
//             ),
//             if (index < totalSteps - 1)
//               StepConnector(
//                 isActive: index + 1 < currentStep,
//               ),
//           ],
//         );
//       }),
//     );
//   }
// }

// class StepTitle extends StatelessWidget {
//   final String name;
//   final String date;

//   const StepTitle({
//     super.key,
//     required this.name,
//     required this.date,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           name,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           date,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[600],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class StepCircle extends StatelessWidget {
//   final int stepNumber;
//   final bool isActive;

//   const StepCircle({
//     super.key,
//     required this.stepNumber,
//     required this.isActive,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 20,
//       height: 20,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isActive ? Colors.blue : Colors.grey[300],
//         border: Border.all(
//           color: isActive ? Colors.blue : Colors.grey,
//           width: 2,
//         ),
//       ),
//       child: Center(
//         child: Text(
//           stepNumber.toString(),
//           style: TextStyle(
//             color: isActive ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class StepConnector extends StatelessWidget {
//   final bool isActive;

//   const StepConnector({
//     super.key,
//     required this.isActive,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40,
//       height: 2,
//       color: isActive ? Colors.blue : Colors.grey[300],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';

class StepData {
  final String name;
  final String date;

  StepData({required this.name, required this.date});
}

class HorizontalStepperWithNamesAndDates extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final List<StepData> steps;

  const HorizontalStepperWithNamesAndDates({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(totalSteps, (index) {
          // Alternate positions for title (top/bottom)
          bool isTop = index % 2 == 0;

          return Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // if (isTop)
                  //   StepTitle(name: steps[index].name, date: steps[index].date),
                  // if (!isTop)
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  StepCircle(
                    stepNumber: index + 1,
                    isActive: index + 1 <= currentStep,
                  ),
                  // if (isTop)
                  // const SizedBox(
                  //   height: 45,
                  // ),
                  // if (!isTop)
                  StepTitle(name: steps[index].name, date: steps[index].date)
                      .pt(10),
                ],
              ),
              if (index < totalSteps - 1)
                Column(
                  children: [
                    StepConnector(
                      isActive: index + 1 < currentStep,
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}

class StepTitle extends StatelessWidget {
  final String name;
  final String date;

  const StepTitle({
    super.key,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: context.bodyLarge.copyWith(
            color: context.blackColor,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          date,
          style: context.bodySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8), // Space below text
      ],
    );
  }
}

class StepCircle extends StatelessWidget {
  final int stepNumber;
  final bool isActive;

  const StepCircle({
    super.key,
    required this.stepNumber,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.green : Colors.grey,
        border: Border.all(
          color: isActive ? Colors.green : Colors.grey,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          stepNumber.toString(),
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class StepConnector extends StatelessWidget {
  final bool isActive;

  const StepConnector({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 2,
      color: isActive ? Colors.green : Colors.black45,
    );
  }
}
