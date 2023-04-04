import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getByeResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.bye[Random().nextInt(responselist.bye.length)],
  );
}
