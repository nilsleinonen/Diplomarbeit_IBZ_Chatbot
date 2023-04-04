import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getThanksResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.thanks[Random().nextInt(responselist.thanks.length)],
  );
}
