import 'package:flutter/material.dart';
import 'package:new_art/src/core/types/status_response.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: CircularProgressIndicator())
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(child: Text("قم بتشغيل الانترنت "))
            : statusRequest == StatusRequest.serverfailure
                ? const Center(child: Text("خطا في السرفر"))
                : statusRequest == StatusRequest.failure
                    ? const Center(child: Text("لايوجد بيانات"))
                    : statusRequest == StatusRequest.none
                        ? const Center(child: Text("لايوجد بياsنات"))
                        : statusRequest == StatusRequest.serverException
                            ? const Center(child: Text("لايوجد "))
                            : widget;
  }
}
