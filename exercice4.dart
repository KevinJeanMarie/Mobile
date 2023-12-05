// CORRECTION

import 'dart:math';

class Starter {
  String nom;
  String type;
  String caractere;

  Starter(this.nom, this.type, this.caractere);

  void getInfo() {
    print("Nom: $nom");
    print("Type: $type");
    print("Caractère: $caractere");
  }

  void attack() {
    print("$nom attaque !");

    // Message spécial en fonction du type et caractère
    if (type == "feu" && caractere == "flemmard") {
      print("LA MAISON BRULE");
    } else if (type == "eau" && caractere == "joyeux") {
      print("Encore une fuite...");
    } else if (type == "électrique" && caractere == "généreux") {
      print("Ma batterie portable est enfin pleine !");
    }
  }
}

void main() {
  // Création des Pokémon de départ
  Starter salameche = Starter("Salamèche", "feu", "flemmard");
  Starter carapuce = Starter("Carapuce", "eau", "joyeux");
  Starter pikachu = Starter("Pikachu", "électrique", "généreux");

  // Choix aléatoire d'un Pokémon de départ pour Sacha
  List<Starter> starters = [salameche, carapuce, pikachu];
  Random random = Random();
  Starter pokemonChoisi = starters[random.nextInt(starters.length)];

  // Affichage des informations du Pokémon choisi
  print("Sacha a choisi son Pokémon de départ !");
  pokemonChoisi.getInfo();

  // Simuler une attaque
  pokemonChoisi.attack();
}
