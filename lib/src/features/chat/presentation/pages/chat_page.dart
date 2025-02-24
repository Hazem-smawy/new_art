import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/features/chat/presentation/getX/chat_controller.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  ChatController chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light yellow background
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(title: 'المحادثة'),
            // Chat Messages
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    id: chatController.messages[index].id,
                  );
                },
              ),
            ),
            // Input Field
            context.g4,
            TextFieldInputWidget(),
            context.g8,
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.id});
  final int id;
  ChatController chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    final message = chatController.messages.firstWhere((m) => m.id == id);
    final isMe = message.isMe;
    final regex = RegExp(r'\*\*Sources:\*\*\s*(.+)', dotAll: true);
    final match = regex.firstMatch(message.msg);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            const Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.black54,
                child: FaIcon(
                  FontAwesomeIcons.user,
                  size: 17,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
          ],
          Obx(
            () => CustomPaint(
              painter: ChatBubblePainter(
                senderColor: context.secondary,
                reciverColor: context.containerColor,
                isMe: isMe,
                message: chatController.messages.firstWhere(
                  (msg) => msg.id == message.id,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 12,
                  right: 12,
                  bottom: 12,
                  left: isMe ? 12 : 20,
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                child: message.status == MessageStatus.error
                    ? Text('error',
                        style: context.bodySmall.copyWith(
                          color: context.secondary,
                        ))
                    : message.status == MessageStatus.loading
                        ? SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              color: context.secondary.withOpacity(0.5),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                match != null
                                    ? message.msg
                                        .replaceFirst(match.group(0)!, '')
                                        .trim()
                                    : message.msg,
                                textAlign: detectLanguage(message.msg) == 'ar'
                                    ? TextAlign.right
                                    : TextAlign.left,
                                textDirection:
                                    detectLanguage(message.msg) == 'ar'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                style: TextStyle(
                                  color: isMe
                                      ? context.whiteColor
                                      : context.blackColor,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldInputWidget extends StatelessWidget {
  TextFieldInputWidget({super.key});

  final ChatController chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () {
          final isLoading = chatController.status.value.isLoading;
          final isTextFieldEmpty =
              chatController.textController.value.text.isEmpty;

          return Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: TextField(
                  controller: chatController.textController.value,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: context.bodyLarge.copyWith(
                    color: context.secondaryTextColor,
                  ),
                  decoration: InputDecoration(
                    hintText: 'رسالة',
                    hintStyle: context.bodySmall.copyWith(
                      color: context.secondaryTextColor,
                    ),
                    filled: true,
                    fillColor: context.secondary.withAlpha(50),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    // Force the UI to update when the text changes
                    chatController.textController.value.text = value;
                    chatController.textController.refresh();
                  },
                ),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  if (isTextFieldEmpty) {
                    // chatController.uploadFile();
                  } else {
                    // isLoading ? null : chatController.handleSubmitted();
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  // padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: context.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Icon(
                        isLoading
                            ? FontAwesomeIcons.pause
                            // : isTextFieldEmpty
                            // ? FontAwesomeIcons.filePdf
                            : Icons.send,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

String detectLanguage(String text) {
  int arabicCount = 0;
  int englishCount = 0;

  for (int i = 0; i < text.length; i++) {
    int charCode = text.codeUnitAt(i);

    // Check if the character is Arabic
    if ((charCode >= 0x0600 && charCode <= 0x06FF) ||
        (charCode >= 0x0750 && charCode <= 0x077F)) {
      arabicCount++;
    }
    // Check if the character is English
    else if ((charCode >= 0x0041 && charCode <= 0x005A) ||
        (charCode >= 0x0061 && charCode <= 0x007A)) {
      englishCount++;
    }
  }

  if (arabicCount > englishCount) {
    return "ar";
  } else if (englishCount > arabicCount) {
    return "en";
  } else {
    return "mx";
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first

class ChatBubblePainter extends CustomPainter {
  final bool isMe;
  final Message message;

  final Color senderColor;
  final Color reciverColor;

  ChatBubblePainter({
    required this.isMe,
    required this.message,
    required this.senderColor,
    required this.reciverColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isMe
          ? senderColor
          : message.status == MessageStatus.loading
              ? Colors.transparent
              : reciverColor
      ..style = PaintingStyle.fill;

    const bubbleRadius = 25.0;
    final path = Path();

    if (isMe) {
      // Right-side bubble with a tail
      path.addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width, size.height),
        topLeft: const Radius.circular(bubbleRadius),
        topRight: const Radius.circular(bubbleRadius),
        bottomLeft: const Radius.circular(bubbleRadius),
        bottomRight: const Radius.circular(bubbleRadius),
      ));
      // path.moveTo(size.width - 10, size.height); // Starting point of tail
      // path.lineTo(size.width + 10, size.height - 10); // Tail point
      // path.lineTo(size.width - 10, size.height - 20); // Closing the triangle
    } else {
      // Left-side bubble with a tail
      path.addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(10, 0, size.width, size.height),
        topLeft: const Radius.circular(bubbleRadius),
        topRight: const Radius.circular(bubbleRadius),
        bottomLeft: const Radius.circular(0),
        bottomRight: const Radius.circular(bubbleRadius),
      ));
      path.moveTo(10, size.height - 20); // Starting point of tail
      path.lineTo(-10, size.height - 10); // Tail point
      path.lineTo(10, size.height); // Closing the triangle
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

//new
