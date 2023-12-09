import 'package:flutter/material.dart';
import '/services/api.dart';

class Pokemon {
  String name;
  int order;
  List<String> types;
  String image;
  String species;
  String description;
  int baseExperience;
  int height;
  int weight;

  Pokemon(
    this.name,
    this.order,
    this.types,
    this.image,
    this.species,
    this.description,
    this.baseExperience,
    this.height,
    this.weight,
  );

  Pokemon.forInitialLoad()
      : name = 'Unknown',
        order = 0,
        types = [],
        image = '',
        species = '',
        description = '',
        baseExperience = 0,
        height = 0,
        weight = 0;

  double get heightInCm => height * 10.0; // Convertir dm en cm
  double get weightInKg => weight / 10.0; // Convertir hg en kg
}

class PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Pokemonapi.getAllPokemon(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else {
          List<Pokemon> pokemons = snapshot.data ?? [];
          return HomePage(pokemons);
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Pokemon> pokemons;

  HomePage(this.pokemons);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de Pokemon'),
        backgroundColor: Colors.blue, // Couleurfond AppBar
      ),
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              pokemons[index].name,
              style: TextStyle(color: const Color.fromARGB(255, 112, 179, 234)),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Numéro: ${pokemons[index].order}',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Types: ${pokemons[index].types.join(',')}',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
            leading: Image.network(pokemons[index].image),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonPage(pokemons[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(pokemon.image, width: 200, height: 200),
            SizedBox(height: 20),
            Text(
              'Espèce: ${pokemon.species}',
              style: TextStyle(color: Colors.green),
            ),
            Text(
              'Description: ${pokemon.description}',
              style: TextStyle(color: Colors.orange),
            ),
            Text(
              'Expérience de base: ${pokemon.baseExperience}',
              style: TextStyle(color: Colors.purple),
            ),
            Text(
              'Taille: ${pokemon.heightInCm} cm',
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Poids: ${pokemon.weightInKg} kg',
              style: TextStyle(color: Colors.red),
            ),
            Text(
              'Ordre: ${pokemon.order}',
              style: TextStyle(color: Colors.indigo),
            ),
            // Ligne horizontale colorée
            Container(
              height: 1,
              color: Colors.red,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
      ),
    );
  }
}
