import 'dart:io';
import 'dart:math';

void main() {
  print("Hello World");
  guesscolor();
}

//2
void guesscolor() {
  List<String> colors = ["Rouge", "Vert", "Bleu", "Jaune", "Violet"];

  // couleur choisie aléatoirement
  Random random = Random();
  String hiddenColor = colors[random.nextInt(colors.length)];

  while (true) {
    //afficher les options
    print("Devinez la couleur cachée :");
    for (int i = 0; i < colors.length; i++) {
      print("${i + 1}. ${colors[i]}");
    }

    // demande au user faire un choix
    print("Votre choix (1-5) : ");
    int userChoice = int.parse(stdin.readLineSync()!);

    // verification si le choix du user correspond à la couleur
    if (userChoice >= 1 && userChoice <= colors.length) {
      String userColor = colors[userChoice - 1];

      if (userColor == hiddenColor) {
        print(
            "Féliciations ! Vous avez deviné la couleur correcte : $hiddenColor");
        break;
      } else {
        print("Dommage ! La couleur choisie n'est pas la bonne. Réessayez.");
      }
    }
  }
}
