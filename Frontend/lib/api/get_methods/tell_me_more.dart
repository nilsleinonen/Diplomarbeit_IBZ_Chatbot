import 'dart:convert';
import '../../input_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../../Message_handler.dart';

Future<Message> getTellMeMoreResponse(Message input) async {
  var lowercaseMessage = input.message.toLowerCase();
  var tellMeMore = lowercaseMessage.split('tell me more about ').join();
  var url = '$baseurl/TellMeMore/$tellMeMore';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 404) {
    // Return a message indicating that more information was not found
    return Message(
        sender: 'Nico Robin',
        message: 'Sorry, more information was not found.');
  }
  final body = json.decode(response.body);

  // Create a string by concatenating the messages in the list
  var messageString = '';
  body.forEach((json) {
    final name = json['name'];
    final bounty = json['bounty'];
    final debut = json['debut'];
    final dream = json['dream'];
    final epithet = json['epithet'];
    final position = json['position'];
    messageString +=
        '$name is also known as "$epithet"\nfirst appearance: $debut\nposition: $position\ndream: $dream\ncurrent bounty: $bounty';
  });

  // Return the message with the modified string
  return Message(sender: 'Nico Robin', message: messageString);
}
