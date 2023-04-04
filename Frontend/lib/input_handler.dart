import 'dart:math';
import 'import_export.dart';
import 'api/ent_chat_respones.dart';
import 'Message_handler.dart';

// Grundidee von khanhnwin von Github übernommen https://github.com/khanhnwin/dash-fanclub/blob/main/lib/api/dashbot.dart
// Hier wurden Methoden entwicklet die auf API zugreifen und auf Listen die einem separaten file sind ent_chat_respones.dart
// zusötzlich wird der Input des Users automatisch auf Kleinschreibung angepasst.

EntChatResponse responselist = EntChatResponse();
var baseurl = 'https://*******************';

class InputHandler {
  final Map<String, Function(Message)> _responseMap;

  InputHandler() : _responseMap = _createResponseMap();

  Future<Message> getResponseMessage(Message input) async {
    final lowercaseMessage = input.message.toLowerCase();
    for (final keyword in _responseMap.keys) {
      if (lowercaseMessage.contains(keyword)) {
        return _responseMap[keyword]!(input);
      }
    }
    return Message(
      sender: 'Nico Robin',
      message: responselist
          .responses[Random().nextInt(responselist.responses.length)],
    );
  }

  static Map<String, Function(Message)> _createResponseMap() {
    return {
      //Serienfragen
      'bounty': getBountyResponse,
      'has': getDevilfruitCharacterResponse,
      'zoan': getDevilfruitResponse,
      'paramecia': getDevilfruitResponse,
      'logia': getDevilfruitResponse,
      'haki': getHakiResponse,
      'chapters': getArcResponse,
      'show me every pirate': getTypeResponse,
      'captain': getCaptainResponse,
      'emperors': getEmperorsResponse,
      'where': getWhereisResponse,
      'more about': getTellMeMoreResponse,
      'happened': getWhatHappenedInArcResponse,
      'poneglyph': getPoneglyphResponse,
      'arcs are in': getSagaResponse,
      'all': getAllResponse,
      'dream': getDreamResponse,
      'debut': getDebutResponse,
      'every member of the': getCrewResponse,

      //Unterhaltung (Entertainment)
      'who are you': getRobinResponse,
      'your name': getRobinResponse,
      'how are you': getHowResponse,
      'one piece': getOnepieceResponse,
      'joke': getJokeResponse,
      'i love you': getLoveResponse,
      'i like you': getLoveResponse,
      'date': getDateResponse,
      'favorite drink': getDrinkResponse,
      'time': getTimeResponse,
      'thanks': getThanksResponse,
      'thx': getThanksResponse,
      'thank you': getThanksResponse,
      'bye': getByeResponse,
      'sayonara': getByeResponse,
      'age': getAgeResponse,
      'how old are': getAgeResponse,
      'whats up': getWhatupResponse,
      'what up': getWhatupResponse,
      'wazzup': getWhatupResponse,
      'hi': getGreetingResponse,
      'hello': getGreetingResponse,
      'konnichiwa': getGreetingResponse,
    };
  }

  Message getWelcomeMessage(Message input) {
    return Message(
      sender: 'Nico Robin',
      message:
          'Hello, I am Robin! Welcome to the Chatbot. Feel free to ask me any question or have a conversation with me :-)',
    );
  }
}
