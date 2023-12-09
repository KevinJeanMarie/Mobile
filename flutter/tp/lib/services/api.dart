import 'dart:convert';
import 'package:dio/dio.dart';
import '/pages/list.dart';

class Pokemonapi {
  static String baseUrl = "https://pokeapi.co/api/v2";

  static Future<List<Pokemon>> getAllPokemon(
      {int offset = 0, int limit = 20}) async {
    try {
      var res = await Dio().get("$baseUrl/pokemon?offset=$offset&limit=$limit");
      if (res.statusCode == 200) {
        List<Pokemon> pokemonList = [];
        var data = res.data;
        for (var pokemonData in data['results']) {
          var details = await getPokemonDetails(pokemonData['url']);

          if (details != null) {
            List<String> types = (details['types'] as List)
                .map<String>((type) => type['type']['name'].toString())
                .toList();

            Pokemon pokemon = Pokemon(
              pokemonData['name'],
              details['order'] ?? 0,
              types,
              details['sprites']['other']['official-artwork']['front_default']
                      ?.toString() ??
                  '',
              details['species']?['name']?.toString() ?? '',
              details['description']?.toString() ?? '',
              details['base_experience'] ?? 0,
              details['height'] ?? 0,
              details['weight'] ?? 0,
            );

            pokemonList.add(pokemon);
          }
        }
        return pokemonList;
      } else {
        return Future.error("Erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Future<Map<String, dynamic>?> getPokemonDetails(String url) async {
    try {
      var res = await Dio().get(url);
      if (res.statusCode == 200) {
        return res.data;
      } else {
        return null;
      }
    } catch (err) {
      return null;
    }
  }
}
