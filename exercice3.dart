import 'dart:io';
import 'dart:math';

void main() {
  print("Hello World");
  pendu();
}

void pendu() {
  // grille de lettre en string
  String pendu = '''
------
|    |
|    |
     |
     |
     |
     |
__________
''';

  print(pendu);

  String motADeviner = 'Casquette';
  List<String> grilleLettres = List.filled(motADeviner.length, '_');

  // boucle pour deviner le mot
  bool motDevine = false;
  int tentativesRestantes = 6;

  while (!motDevine && tentativesRestantes > 0) {
    affichagePendu(pendu);
    affichageGrilleLettre(grilleLettres);

    // demander au user de saisir une lettre
    stdout.write('Entrez une lettre : ');
    String lettre = stdin.readLineSync()!.toLowerCase();

    // verifier si la lettre est présente dans le mot à deviner
    if (motADeviner.contains(lettre)) {
      print('Bien joué !');

      // mettre à jour la grille de lettres
      for (int i = 0; i < motADeviner.length; i++) {
        if (motADeviner[i] == lettre) {
          grilleLettres[i] = lettre;
        }
      }

      // vérifier si le mot à été entièrement deviné
      if (!grilleLettres.contains('_')) {
        motDevine = true;
      }
    } else {
      print('Mauvaise devinette !');
      // ajouter une partie au pendu
      tentativesRestantes--;
    }
  }

  // afficher resultat final
  affichagePendu(pendu);
  affichageGrilleLettre(grilleLettres);

  if (motDevine) {
    print('Félicitation, vous avez deviné le mot !');
  } else {
    print('Dommage, le mot était "$motADeviner" !');
  }
}

void affichagePendu(String pendu) {
// Effacer l'écran (Note: Cela peut ne pas fonctionner sur tous les systèmes d'exploitation)
  print('\x1B[2J\x1B[0;0H');
  print(pendu);
}

void affichageGrilleLettre(List<String> grilleLettres) {
  print('Mot à deviner : ${grilleLettres.join(' ')}');
}
