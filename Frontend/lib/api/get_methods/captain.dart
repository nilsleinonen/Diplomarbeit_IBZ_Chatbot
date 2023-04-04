import 'dart:convert';
import 'dart:math';
import '../ent_chat_respones.dart';
import '../../input_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../../Message_handler.dart';

Future<Message> getCaptainResponse(Message input) async {
  var lowercaseMessage = input.message.toLowerCase();
  var captain = lowercaseMessage
      .split('who is the captain of the ')
      .join()
      .split('?')
      .join();

  var url = '$baseurl/Captains/$captain';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 404) {
    // Return a message indicating that the Captain was not found
    return Message(sender: 'Nico Robin', message: 'Captain was not found.');
  }
  final body = json.decode(response.body);

  return Message(
      sender: 'Nico Robin',
      message: body.map<String>((json) {
        final name = json['name'];

        return 'The captain is $name ';
      }).join());
}
