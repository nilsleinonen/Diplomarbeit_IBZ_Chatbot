import 'dart:convert';
import 'dart:math';
import '../ent_chat_respones.dart';
import '../../input_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../../Message_handler.dart';

Future<Message> getSagaResponse(Message input) async {
  var lowercaseMessage = input.message.toLowerCase();
  var saga = lowercaseMessage
      .split('which arcs are in the ')
      .join()
      .split(' saga')
      .join()
      .split('?')
      .join();

  var url = '$baseurl/Sagas/$saga';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 404) {
    // Return a message indicating that the character was not found
    return Message(sender: 'Nico Robin', message: 'Saga was not found.');
  }
  final body = json.decode(response.body);

  var messageString = '';
  body.forEach((json) {
    final name = json['name'];
    final chapters = json['chapters'];
    messageString += 'arc: $name, Chapters: $chapters\n';
  });

  // Return the message with the modified string
  return Message(sender: 'Nico Robin', message: messageString);
}
