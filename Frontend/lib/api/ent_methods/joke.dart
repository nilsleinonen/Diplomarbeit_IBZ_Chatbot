import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getJokeResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.jokes[Random().nextInt(responselist.jokes.length)],
  );
}
