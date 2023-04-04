import 'dart:convert';
import '../../input_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../../Message_handler.dart';

Future<Message> getTypeResponse(Message input) async {
  var lowercaseMessage = input.message.toLowerCase();
  var type = lowercaseMessage.split('show me every ').join();

  var url = '$baseurl/Characters/$type';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = json.decode(response.body);

  var messageString = '';
  body.forEach((json) {
    final name = json['name'];

    messageString += '$name\n';
  });

  return Message(sender: 'Nico Robin', message: messageString);
}
