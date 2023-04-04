import 'dart:convert';
import 'dart:math';
import '../ent_chat_respones.dart';
import '../../input_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../../Message_handler.dart';

Future<Message> getHakiResponse(Message input) async {
  var url = '$baseurl/Haki';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = json.decode(response.body);

  // Create a string by concatenating the messages in the list
  var messageString = '';
  body.forEach((json) {
    final description = json['description'];
    messageString += '$description\n\n';
  });

  // Return the message with the modified string
  return Message(sender: 'Nico Robin', message: messageString);
}
