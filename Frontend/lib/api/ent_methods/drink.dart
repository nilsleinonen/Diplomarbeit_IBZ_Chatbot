import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';

Future<Message> getDrinkResponse(Message input) async {
  return Message(
    sender: 'Nico Robin',
    message: responselist.drink[Random().nextInt(responselist.drink.length)],
  );
}
