import 'dart:convert';
import '../../input_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../../Message_handler.dart';

Future<Message> getAllResponse(Message input) async {
  var lowercaseMessage = input.message.toLowerCase();
  var all = lowercaseMessage.split('show me all ').join();

  var url = '$baseurl/$all';
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
