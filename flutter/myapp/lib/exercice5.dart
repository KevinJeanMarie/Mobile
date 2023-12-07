import 'package:flutter/material.dart';

void main() => runApp(MyAppExercice5());

class Game {
  String name;
  String image;

  Game(this.name, this.image);
}

class MyAppExercice5 extends StatelessWidget {
  final List<Game> games = [
    Game('Game 1', 'fruit1.jpg'),
    Game('Game 2', 'fruit2.jpg'),
    // Add more games as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(games),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Game> games;

  HomePage(this.games);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de jeux vidéo'),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(games[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GamePage(games[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class GamePage extends StatelessWidget {
  final Game game;

  GamePage(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: Center(
        child: Image.asset('assets/${game.image}', width: 200, height: 200),
      ),
    );
  }
}
