import 'package:flutter/material.dart';
import 'pages/list.dart';
import 'widgets/app_wraper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppWrapper(
        child: PokemonList(),
      ),
    );
  }
}
