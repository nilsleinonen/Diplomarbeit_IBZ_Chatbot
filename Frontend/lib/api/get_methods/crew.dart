import 'dart:convert';
import '../../input_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../../Message_handler.dart';

Future<Message> getCrewResponse(Message input) async {
  var lowercaseMessage = input.message.toLowerCase();
  var crew = lowercaseMessage.split('show me every member of the ').join();

  var url = '$baseurl/Crews/$crew';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = json.decode(response.body);

  var messageString = '';
  body.forEach((json) {
    final name = json['name'];
    final epithet = json['epithet'];
    final bounty = json['bounty'];
    final position = json['position'];

    messageString +=
        '$name\nalso known as: $epithet\nbounty: $bounty\nposition: $position\n\n';
  });

  return Message(sender: 'Nico Robin', message: messageString);
}
