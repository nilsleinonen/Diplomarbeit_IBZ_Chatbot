import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getGreetingResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.hello[Random().nextInt(responselist.hello.length)],
  );
}
