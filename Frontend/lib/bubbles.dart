import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

// Code wurde von https://github.com/khanhnwin/dash-fanclub/blob/dashbot/lib/ui/chat/bubbles.dart übernommen und lediglich die Bilder geändert

class DashBubble extends StatelessWidget {
  const DashBubble({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    Widget textBubble = Expanded(
      child: BubbleNormal(
        text: message,
        isSender: false,
        color: const Color.fromARGB(255, 228, 228, 228),
        tail: true,
      ),
    );

    Widget text = Row(children: [
      SizedBox(
          width: 50,
          child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/robin.jpg',
                fit: BoxFit.cover,
              ))),
      textBubble,
    ]);

    return text;
  }
}

class UserBubble extends StatelessWidget {
  const UserBubble({
    Key? key,
    required this.message,
    required this.userImage,
  }) : super(key: key);

  final String message;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    Widget textBubble = Expanded(
      child: BubbleNormal(
        text: message,
        isSender: true,
        color: const Color.fromARGB(255, 38, 195, 247),
        tail: true,
      ),
    );

    Widget text = Row(children: [
      textBubble,
      SizedBox(
          width: 50,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              child: Image.asset(
                'assets/default.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )),
    ]);

    return text;
  }
}
