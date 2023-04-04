import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getRobinResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.robin[Random().nextInt(responselist.robin.length)],
  );
}
