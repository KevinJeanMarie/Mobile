import 'package:flutter/material.dart';

void main() => runApp(MyAppExercice4());

class MyAppExercice4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentImage = 'image1.jpg';

  void changeImage() {
    setState(() {
      currentImage =
          (currentImage == 'image1.jpg') ? 'image2.jpg' : 'image1.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Changement d\'image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/$currentImage', width: 200, height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeImage,
              child: Text('Changer l\'image'),
            ),
          ],
        ),
      ),
    );
  }
}
