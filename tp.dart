import 'dart:io';
import 'dart:math';

// classe Métier pour les statistiques d'une classe de personnage
class Metier {
  int pointsDeVie;
  int degats;

  Metier(this.pointsDeVie, this.degats);
}

// Classe pour le joueur
class Personnage {
  String nom;
  String sexe;
  Metier metier;
  int pointsDeVieActuels;
  bool potionUtilisee;

  // Constructeur qui initialise les propriétés du personnage
  Personnage(this.nom, this.sexe, this.metier)
      : pointsDeVieActuels = metier.pointsDeVie,
        potionUtilisee = false;

  // Fonction (méthode) pour attaquer un ennemi
  void attaquer(Ennemi ennemi) {
    ennemi.subirDegats(metier.degats);
  }

  // Fonction (méthode) pour utiliser une potion et récupéret des points de vie
  void utiliserPotion() {
    if (!potionUtilisee) {
      pointsDeVieActuels += 15;
      if (pointsDeVieActuels > metier.pointsDeVie) {
        pointsDeVieActuels = metier.pointsDeVie;
      }
      potionUtilisee = true;
      print("Vous avez utilisé une potion et récupéré 15 points de vie.");
    } else {
      print("La potion est déjà utilisée.");
    }
  }

  // Fonction (méthode) pour savoir si le personnage est en vie
  bool estEnVie() {
    return pointsDeVieActuels > 0;
  }
}

// Classe pour les ennemis du joueur
class Ennemi {
  String nom;
  String sexe;
  int pointsDeVie;
  int degats;

  // Constructeur qui initialise les propriétés de l'ennemi
  Ennemi(this.nom, this.sexe, this.pointsDeVie, this.degats);

  // Fonction (méthode) pour faire subir des dégâts à l'ennemi
  void subirDegats(int degats) {
    pointsDeVie -= degats;
    print("$nom subit $degats points de dégâts.");

    if (pointsDeVie <= 0) {
      print("$nom a été vaincu !");
    }
  }

  // Fonction (méthode) pour faire attaquer l'ennemi au personnage
  void attaquer(Personnage personnage) {
    personnage.pointsDeVieActuels -= degats;
    print("$nom attaque et inflige $degats points de dégats.");

    if (!personnage.estEnVie()) {
      print("Vous avez été vaincu par $nom. Game over.");
      // Terminer le programme
      exit(0);
    }
  }
}

// Fonction principal du jeu
//(Final pour déclarer une variable qui ne peut être réassignée une fois initialisée).
void main() {
  final guerrier = Metier(50, 8);
  final mage = Metier(25, 16);
  final archer = Metier(35, 13);

  // Création du personnage du joueur avec la classe guerrier par défaut
  final joueur = Personnage("Joueur", "M", guerrier);

  // Création de la liste d'ennemis
  final ennemis = [
    Ennemi("Dracula", "M", 30, 5),
    Ennemi("Miss Pacman", "F", 15, 3),
    Ennemi("Star Fox", "M", 17, 6),
  ];

  // initialiser le générateur de nombre aléatoire
  final random = Random();

  // boucle principale du jeu
  while (true) {
    // Sélection aléatoire d'un ennemi
    final ennemi = ennemis[random.nextInt(ennemis.length)];
    print("Vous rencontrez un redoutable ennemi : ${ennemi.nom}!");

    // Boucle pour le combat entre le joueur et l'ennemi
    while (joueur.estEnVie() && ennemi.pointsDeVie > 0) {
      // Affichage des options de combat
      print("\nOption de combat : ");
      print("1. Attaquer");
      print("2. Utiliser une potion");

      // Gestion des erreurs lors de la saisie de l'utilisateur
      try {
        int choix = int.parse(stdin.readLineSync()!);

        // Traitement en fonction du choix du joueur
        switch (choix) {
          case 1:
            joueur.attaquer(ennemi);
            ennemi.attaquer(joueur);
            break;
          case 2:
            joueur.utiliserPotion();
            ennemi.attaquer(joueur);
            break;
          default:
            print("Choix invalide. Veuillez choisir 1 ou 2.");
        }
      } catch (e) {
        print("Veuillez entrer un numéro valide.");
      }
    }
    // Réinitialiser l'utilisation de la potion pour le prochain combat
    joueur.potionUtilisee = false;

    // Demande au joueur de continuer
    print("\nVoulez-vous continuer ? (Oui/Non)");
    String continuer = stdin.readLineSync()!.toLowerCase();

    // Si le joeur ne veut pas continuer le programme se termine
    if (continuer != "oui") {
      print("Merci d'avoir joué. Fin du programme.");
      break;
    }
  }
}
