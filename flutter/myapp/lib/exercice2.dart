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
        title: Text('Image et Texte côte à côte'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/your_image.png', width: 100, height: 100),
            SizedBox(width: 20),
            Text('Votre texte ici'),
          ],
        ),
      ),
    );
  }
}
