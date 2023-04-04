import 'input_handler.dart';

//Die Grundidee von diesem Code wurde von https://github.com/khanhnwin/dash-fanclub/blob/dashbot/lib/api/chat_manager.dart kopiert.
// Die getResponse Methode wurde asynchron gemacht, da auf API zugegriffen wird

InputHandler inputhandler = InputHandler();

class MessageHandler {
  final List<Message> messages = [];

  void newMessage(Message message) {
    messages.add(message);
  }

  Future<void> getResponse(Message message) async {
    messages.add(await inputhandler.getResponseMessage(message));
  }

  void getWelcome(Message message) {
    messages.add(inputhandler.getWelcomeMessage(message));
  }
}

class Message {
  String sender;
  String message;

  Message({required this.sender, required this.message});
}
