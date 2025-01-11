import 'package:flutter/material.dart';

Future<DateTime?> pickData(BuildContext context) async {
  final initData = DateTime.now();
  final newData = await showDatePicker(
    context: context,
    initialDate: initData,
    firstDate: DateTime(1990),
    lastDate: DateTime(2040),
    // Ensure the date picker uses Arabic

    builder: (context, child) => Theme(
      data: ThemeData().copyWith(),
      child: child ?? const Text(""),
    ),
  );

  if (newData == null) return null;
  return newData;
}
