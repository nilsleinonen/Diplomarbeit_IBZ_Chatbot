import 'dart:convert';
import 'dart:math';
import '../ent_chat_respones.dart';
import '../../input_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../../Message_handler.dart';

Future<Message> getDevilfruitCharacterResponse(Message input) async {
  var lowercaseMessage = input.message.toLowerCase();
  var personateFruit =
      lowercaseMessage.split('which devilfruit has ').join().split('?').join();

  var url = '$baseurl/DevilfruitsCharacter/$personateFruit';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 404) {
    // Return a message indicating that the character was not found
    return Message(sender: 'Nico Robin', message: 'Character was not found.');
  }

  final body = json.decode(response.body);

  // Create a string by concatenating the messages in the list
  var messageString = '';
  body.forEach((json) {
    final name = json['name'];
    final fruittype = json['fruittype'];
    messageString += '$name, type: $fruittype';
  });

  // Return the message with the modified string
  return Message(sender: 'Nico Robin', message: messageString);
}
