import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getHowResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.how[Random().nextInt(responselist.how.length)],
  );
}
