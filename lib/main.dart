import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:slimy_card_example/images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Slimy Card';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              SlimyCard(
                // by default color blue
                color: Color(0xFFC41A3B),
                width: 300.0,
                // borderRadius: 0.0, // max 30
                slimeEnabled: true,
                topCardHeight: 300.0,
                bottomCardHeight: 150.0,
                topCardWidget: _topCard(
                  (snapshot.data) ? logo : logoRound,
                ),
                bottomCardWidget: _bottomCard(),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _topCard(String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100.0,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Color(0xFFFBE0E6),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Image(
            image: AssetImage(image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'The Tech Designer',
            style: TextStyle(
              color: Color(0xFFFBE0E6),
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Youtube Channel',
            style: TextStyle(
              color: Color(0xFFFBE0E6),
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomCard() {
    return Text(
      'Welcome to you \n "The Tech Designer" \n Youtube Channel',
      style: TextStyle(
        color: Color(0xFFFBE0E6),
        fontSize: 20.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
