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
      if (!GetUtils.isTxt(val)) {
        return "not valid $type";
      }
      break;
    case "email":
      if (!GetUtils.isEmail(val)) {
        return 'قم بأدخال بريد الالكتروني صحيح';
      }
      break;
    case "phone":
      if (!GetUtils.isPhoneNumber(val)) {
        return 'قم بإدخال الرقم بشكل صحيح';
      }
      break;

    case "password":
      if (false) {
        return 'اجعل كلمة المرور اكثر صعوبة';
      }
      break;
    default:
      return "invalid validation type";
  }

  // Input is valid
  return null;
}

String? validateUrl(String? value) {
  if (value == null || value.isEmpty) {
    return 'ادخل رابط الطلب';
  }

  final uri = Uri.tryParse(value);
  if (uri == null ||
      // Ensure the URI has a valid scheme (http or https)
      (uri.scheme != 'http' && uri.scheme != 'https') ||
      // Optionally, ensure the URL has a valid host
      uri.host.isEmpty) {
    return 'يجب ان يكون الرابط صحيح';
  }

  return null; // URL is valid
}

String? validateNotEmpty(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "يجب ان لايكون فارغ";
  }
  return null;
}

String? validateNum(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "يجب ان لايكون فارغ";
  }
  if (!GetUtils.isNum(value)) {
    return "يجب ان لا يكون نص";
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "يجب ان لايكون فارغ";
  }
  if (!GetUtils.isPhoneNumber(value)) {
    return 'قم بإدخال الرقم بشكل صحيح';
  }
  return null;
}
