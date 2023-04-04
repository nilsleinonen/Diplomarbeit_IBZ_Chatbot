import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getWhatupResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.whatup[Random().nextInt(responselist.whatup.length)],
  );
}
