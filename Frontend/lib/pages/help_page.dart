import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot Questions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Helppage(),
    );
  }
}

class Helppage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Help')),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Examples of Questions to ask the Chatbot',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Note: Everything what is colored can be replaced',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Character based Questions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: '- What is the bounty of ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Nami ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(
                              text:
                                  '?\n- Who are the current four emperors?\n- Which devilfruit has '),
                          TextSpan(
                              text: 'Brook ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(text: '?\n- Who is the captain of the '),
                          TextSpan(
                              text: 'Red Hair Pirates ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(
                              text:
                                  '?\n- Show me all characters/crews/leaders\n'),
                          TextSpan(
                              text:
                                  '- Show me every pirate/marine/revolutionary/samurai/mink'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Works only with the Straw Hat Pirates',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: '- What is ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Robins',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(text: " dream?\n- When was "),
                          TextSpan(
                              text: 'Frankys',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(text: " debut?\n- Tell me more about "),
                          TextSpan(
                              text: 'Sanji',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(
                              text:
                                  "\n- Show me every member of the Straw Hat Pirates / Strawhat Pirates"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Haki, Poneglyphs, One Piece, Devilfruits',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '- What is Haki?\n- What is a Poneglyph?\n- What is the One Piece?\n- Show me every zoan / logia / paramecia devilfruit\n- Show me all devilfruits',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Arc\s, Saga\s, Island\s etc',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: '- What happened in the ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Impel Down',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(text: ' arc?\n- In which chapters is the '),
                          TextSpan(
                              text: 'Alabasta',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(text: ' Arc?\n- Which arcs are in the '),
                          TextSpan(
                              text: 'Water Seven',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(text: ' saga?\n- Where is the '),
                          TextSpan(
                              text: 'Alabasta Kingdom',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green)),
                          TextSpan(
                              text:
                                  ' located?\n- Show me all Arcs/Sagas/Islands/Organizations'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Entertainment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '- Hi, Hello, Konnichiwa\n- Whats your name?\n- How are you?\n- Who are you?\n- I love you\n- How are you?\n- What is Today\s date?, What time is it?\n- Tell me a joke\n- Thanks\n- Whats up, Wazzup\n- Whats your favorite drink?\n- Bye, Sayonara',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }),
            ),
          ],
        )));
  }
}
