import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// import 'logger.dart';

class CommonUtil {
  factory CommonUtil() {
    return _singleton;
  }

  static final CommonUtil _singleton = CommonUtil._internal();
  CommonUtil._internal() {
    // Logger.write('hello');
  }

  void keyboardHide(BuildContext context) {
    try {
      FocusScope.of(context)
          .requestFocus(FocusNode()); // not refocus to textview
      /// hides the keyboard if its already open
      //FocusScope.of(context).unfocus();  //  refocus to textview
    } catch (e) {
      e.printError();
    }
  }

  String currentDate(String from) {
    var now = DateTime.now();
    String date;
    if (from == "revers") {
      date = DateFormat("yyyy-MM-dd").format(now);
    } else {
      date = DateFormat("dd-MM-yyyy").format(now);
    }
    return date.toString();
  }

  String currentTime() {
    var now = DateTime.now();
    var time = DateFormat("H:m:s").format(now);
    return time.toString();
  }

  String currentDateTimeMilli() {
    var now = DateTime.now();
    return now.millisecondsSinceEpoch.toString();
  }

  String currentDateTime() {
    var now = DateTime.now();
    var time = DateFormat("dd-MM-yyyy hh:mm:ss").format(now);
    return time.toString();
  }

  String dateFormater(String data) {
    try {
      DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(data);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('dd MMM yyyy');
      var outputDate = outputFormat.format(inputDate);

      return outputDate.toString();
    } catch (e) {
      return data;
    }
  }

  String dateFormaterTime(String data) {
    try {
      DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(data);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('hh:mm a');
      var outputDate = outputFormat.format(inputDate);

      return outputDate.toString();
    } catch (e) {
      return data;
    }
  }

  /// accepts a double [scale] and returns scaled sized based on the screen
  /// orientation
  double getScaledSize(BuildContext context, double scale) =>
      scale *
      (MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height);

  /// accepts a double [scale] and returns scaled sized based on the screen
  /// width
  double getScaledWidth(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.width;

  /// accepts a double [scale] and returns scaled sized based on the screen
  /// height

  double getScaledHeight(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.height;
}
