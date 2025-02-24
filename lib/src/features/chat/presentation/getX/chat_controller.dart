import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MessageStatus { empty, loading, success, error }

class Message {
  int id;
  String msg;
  bool isMe;
  MessageStatus status;
  DateTime date;
  Message({
    this.id = 0,
    required this.msg,
    required this.isMe,
    this.status = MessageStatus.empty,
    required this.date,
  });

  // Convert a drift row to a Message object

  // Convert a Message object to a drift companion
}

class ChatController extends GetxController {
  RxString message = ''.obs;

  final orginal = 0.obs;
  final pdfUpload = false.obs;
  final textController = TextEditingController().obs;
  final status = RxStatus.empty().obs;
  final pdfUploadStatus = RxStatus.empty().obs;
  final messages = [].obs;
  int id = 0;

  @override
  onInit() {
    super.onInit();
    messages.value = [
      Message(
          id: 2,
          msg: 'وعليكم السلا كيف يكنني مساعدتك',
          isMe: false,
          date: DateTime.now()),
      Message(
          id: 1,
          msg: 'السلام عليكم ورحة الله وبركاتة',
          isMe: true,
          date: DateTime.now()),
    ];
  }

  MessageStatus get currentStatus {
    if (status.value.isEmpty) return MessageStatus.empty;
    if (status.value.isLoading) return MessageStatus.loading;
    if (status.value.isSuccess) return MessageStatus.success;
    if (status.value.isError) return MessageStatus.error;
    return MessageStatus.empty; // Default to empty
  }

  MessageStatus get currentPdfUploadStatus {
    if (pdfUploadStatus.value.isEmpty) return MessageStatus.empty;
    if (pdfUploadStatus.value.isLoading) return MessageStatus.loading;
    if (pdfUploadStatus.value.isSuccess) return MessageStatus.success;
    if (pdfUploadStatus.value.isError) return MessageStatus.error;
    return MessageStatus.empty; // Default to empty
  }
}
