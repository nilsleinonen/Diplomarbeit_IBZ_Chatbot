import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getOnepieceResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message:
        responselist.onepiece[Random().nextInt(responselist.onepiece.length)],
  );
}
