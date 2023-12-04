import 'dart:io';
import 'dart:math';

void main() {
  print("Hello World");

  startGame();
}

//1
void startGame() {
  int choix;

  // boucle
  while (true) {
    print("Bienvenue choisissez vos options :");
    print("1. Se promener");
    print("2. Chercher de la nourriture");
    print("3. Trouver un abri");
    print("4. Quitter le jeu");

    print("Votre choix: ");
    choix = int.parse(stdin.readLineSync()!);

    switch (choix) {
      case 1:
        int randomMessage = Random().nextInt(3);
        switch (randomMessage) {
          case 0:
            print(
                "Vous marchez pendant une heure et ne trouvez rien d'intéréssant.");
            break;
          case 1:
            print(
                "Vous tombez sur un groupe de zombies affamés. Vous réussissez à vous enfuir en courant.");
            break;
          case 2:
            print(
                "Vous trouvez une boite de conserve abandonée. Vous la prenez et continuez votre chemin");
            break;
        }
        break;
      case 2:
        int randomMessage2 = Random().nextInt(3);
        switch (randomMessage2) {
          case 0:
            print(
                "Vous fouillez les maisons et les magasins, mais ne trouvez rien à manger.");
            break;
          case 1:
            print(
                "Vous trouvez un jardin potager abandonné. Vous récoltez quelques légumes pour votre prochain repas.");
            break;
          case 2:
            print(
                "Vous tombez sur un groupe de zombies affamés alors que vous fouillez ");
            break;
        }
        break;
      case 3:
        int randomMessage3 = Random().nextInt(3);
        switch (randomMessage3) {
          case 0:
            print(
                "Vous trouvez une maison abandonnée et décidez de vous y installer pour la nuit.");
            break;
          case 1:
            print(
                "Vous cherchez un abri pendant des heures, mais ne trouvez rien de convenable.");
            break;
          case 2:
            print(
                "Vous tombez sur un groupe de survivants qui vous accueillent à bras ouvert dans leur abri");
            break;
        }
        break;
      case 4:
        print("Merci d'avoir joué. Au revoir !");
        break;
      default:
        print("Faites votre choix");
        break;
    }
  }
}

//2
