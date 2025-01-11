import 'package:get/get.dart';

// validInput(String val, int min, int max, String type) {
//   if (type == "username") {
//     if (!GetUtils.isUsername(val)) {
//       return "not valid username";
//     }
//   }
//   if (type == "firstName") {
//     if (!GetUtils.isUsername(val)) {
//       return "not valid firstName";
//     }
//   }
//   if (type == "lastName") {
//     if (!GetUtils.isUsername(val)) {
//       return "not valid lastName";
//     }
//   }
//   if (type == "email") {
//     if (!GetUtils.isEmail(val)) {
//       return "not valid email";
//     }
//   }

//   if (type == "phone") {
//     if (!GetUtils.isPhoneNumber(val)) {
//       return "not valid phone";
//     }
//   }

//   if (val.isEmpty) {
//     return "يجب ان لايكون فارغ";
//   }

//   if (val.length < min) {
//     return "can't be less than $min";
//   }

//   if (val.length > max) {
//     return "can't be larger than $max";
//   }
// }
import 'package:get/get.dart';

String? validInput(String val, int min, int max, String type) {
  // Check for empty input
  if (val.isEmpty) {
    return "يجب ان لايكون فارغ";
  }

  // Validate length constraints
  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > max) {
    return "can't be larger than $max";
  }

  // Type-specific validation
  switch (type) {
    case "username":
    case "firstName":
    case "lastName":
      if (!GetUtils.isUsername(val)) {
        return "not valid $type";
      }
      break;
    case "email":
      if (!GetUtils.isEmail(val)) {
        return "not valid email";
      }
      break;
    case "phone":
      if (!GetUtils.isPhoneNumber(val)) {
        return "not valid phone";
      }
      break;
    default:
      return "invalid validation type";
  }

  // Input is valid
  return null;
}
