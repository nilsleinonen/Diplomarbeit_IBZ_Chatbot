import 'package:flutter/scheduler.dart';
import 'package:ohara/bubbles.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import '../Message_handler.dart';
import 'dart:async';

// Grundidee von Github khanhnwin übernommen und leicht angepasst.https://github.com/khanhnwin/dash-fanclub/blob/main/lib/ui/chat/chat.dart
// scrollToBottom angepasst, getLink weggelassen, onSend und Timer angepasst, Textfield verändert optisch und Fokus im Textfeld behalten implementiert
// welcome message hinzugefügt, Bilder geändert

GetIt getIt = GetIt.instance;

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();
  List<Message> messages = getIt<MessageHandler>().messages;

  // changed the behaviour of scrolling, scrolling to new message automatically now
  void scrollToBottom() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void getMessages() {
    setState(() {
      messages = getIt<MessageHandler>().messages;
    });
    // scroll when message received
    SchedulerBinding.instance.addPostFrameCallback((_) => scrollToBottom());
  }

  void onSend() {
    String inputText = controller.text;
    if (inputText != '') {
      Message inputMessage = Message(sender: 'Nils', message: inputText);

      getIt<MessageHandler>().newMessage(inputMessage);
      getMessages();

      controller.clear();
      FocusScope.of(context).requestFocus(focusNode);
      // changed the duration from random, to 700ms
      Duration delay = const Duration(milliseconds: 700);

      // made the timer async
      Timer(delay, () async {
        try {
          // Call the getResponse method and wait for the result
          await getIt<MessageHandler>().getResponse(inputMessage);
        } catch (error) {
          // Handle the error
          const Text('Something went wrong');
        }

        // Retrieve the current messages
        getMessages();
      });
    }
  }

  //chechking if the home/welcomepage is shown
  bool _isWelcomeShown = false;
  //getting the welcome message from the method getWelcome
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      if (!_isWelcomeShown) {
        // added empty strings, not clear if it needed placeholders, but it works :-)
        getIt<MessageHandler>().getWelcome(Message(
          sender: '',
          message: '',
        ));
        _isWelcomeShown = true;
        setState(() {});
      }
    });
  }

  final FocusNode focusNode = FocusNode();
  bool keyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  String message = messages[index].message;

                  Widget text = messages[index].sender == 'Nico Robin'
                      ? DashBubble(message: message)
                      : UserBubble(
                          message: message, userImage: 'assets/default.jpg');

                  return text;
                }),
          ),
          GestureDetector(
            onTap: () {
              focusNode.requestFocus();
              keyboardVisible = true;
            },
            child: TextField(
              focusNode: focusNode,
              autofocus: keyboardVisible,
              controller: controller,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                suffixIcon: GestureDetector(
                  onTap: onSend,
                  child: const Icon(Icons.send),
                ),
              ),
              // allows user to send the message with pressing enter in webbrowser
              onSubmitted: (text) {
                onSend();
                if (!focusNode.hasFocus)
                  FocusScope.of(context).requestFocus(focusNode);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
