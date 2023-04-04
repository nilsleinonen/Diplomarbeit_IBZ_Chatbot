import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getAgeResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.age[Random().nextInt(responselist.age.length)],
  );
}
