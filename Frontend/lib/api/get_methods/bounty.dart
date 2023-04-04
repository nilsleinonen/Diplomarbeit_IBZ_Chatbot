import 'dart:convert';
import 'dart:math';
import '../ent_chat_respones.dart';
import '../../input_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../../Message_handler.dart';

Future<Message> getBountyResponse(Message input) async {
  var lowercaseMessage = input.message.toLowerCase();
  final personWithBounty =
      lowercaseMessage.split('what is the bounty of ').join().split('?').join();

  var url = '$baseurl/Bounties/$personWithBounty';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 404) {
    // Return a message indicating that the bounty was not found
    return Message(sender: 'Nico Robin', message: 'Bounty was not found.');
  }
  final body = json.decode(response.body);

  // Create a string by concatenating the messages in the list
  var messageString = '';
  body.forEach((json) {
    final name = json['name'];
    final bounty = json['bounty'];
    messageString += 'The bounty of $name is $bounty berry';
  });

  // Return the message with the modified string
  return Message(sender: 'Nico Robin', message: messageString);
}
