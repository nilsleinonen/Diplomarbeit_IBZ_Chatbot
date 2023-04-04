import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot Questions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/library_of_ohara.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 180,
            child: Image.asset('assets/one_piece_logo.png'),
            alignment: Alignment.center,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black12,
                  Color.fromARGB(255, 0, 0, 0),
                ],
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info),
                      SizedBox(width: 5),
                      Link(
                        url: 'https://onepiece.fandom.com/wiki/One_Piece_Wiki',
                        label: 'One Piece Wiki',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.tv),
                      SizedBox(width: 5),
                      Link(
                        url: 'https://onepiece-tube.com/',
                        label: 'One Piece Tube',
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Link extends StatelessWidget {
  final String url;
  final String label;

  const Link({
    required this.url,
    required this.label,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        label,
        style: TextStyle(
          color: Colors.green,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () {
        // ignore: deprecated_member_use
        launch(url);
      },
    );
  }
}
