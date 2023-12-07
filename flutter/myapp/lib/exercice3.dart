import 'package:flutter/material.dart';

void main() => runApp(MyAppExercice3());

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

class MyAppExercice3 extends StatelessWidget {
  final List<Person> people = [
    Person('John', 25),
    Person('Jane', 30),
    Person('Doe', 22),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(people),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Person> people;

  MyHomePage(this.people);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de personnes'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(people[index].name),
            subtitle: Text('Age: ${people[index].age} ans'),
          );
        },
      ),
    );
  }
}
