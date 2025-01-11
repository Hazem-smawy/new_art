String? validateNumber(String? value, bool isRequired) {
  if (value == null || value.isEmpty) {
    return isRequired ? 'هذا الحقل مطلوب' : null;
  } else {
    final RegExp numberRegExp = RegExp(r'^\d+(\.\d+)?$');

    if (!numberRegExp.hasMatch(value)) {
      return 'ادخل الرقم بشكل صحيح';
    }
  }

  // Regular expression to match numbers with optional decimal points

  return null; // If the input is valid, return null (no error)
}
