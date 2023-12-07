import 'package:flutter/material.dart';

void main() => runApp(MyAppExercice2());

class MyAppExercice2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voiture de sport"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/R.jpg', width: 300, height: 300),
            SizedBox(width: 20),
            Text('Voici une superbe Dodge SRT hellcat de couleur rouge !'),
          ],
        ),
      ),
    );
  }
}
