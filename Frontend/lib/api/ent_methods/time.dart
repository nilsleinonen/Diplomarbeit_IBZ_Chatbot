import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';
import 'package:intl/intl.dart';

Future<Message> getTimeResponse(Message input) async {
  return Message(
      sender: 'Nico Robin',
      message: 'It\'s: ${DateFormat('H:mm').format(DateTime.now())}');
}
