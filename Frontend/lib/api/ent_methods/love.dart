import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getLoveResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.love[Random().nextInt(responselist.love.length)],
  );
}
