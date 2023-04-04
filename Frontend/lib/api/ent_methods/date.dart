import 'dart:math';
import '/input_handler.dart';
import '/Message_handler.dart';
import 'package:intl/intl.dart';

Future<Message> getDateResponse(Message input) async {
  return Message(
      sender: 'Nico Robin',
      message: 'Today is ${DateFormat('EEEE, d/M/y').format(DateTime.now())}');
}
