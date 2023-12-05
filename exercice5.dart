class Personnage {
  String nom;

  Personnage(this.nom);
}

class Objet {
  String nom;

  Objet(this.nom);
}

class NinNinNin extends Objet {
  String portalgun = 'FAILED';

  NinNinNin(String nom, String objet1, String objet2) : super(nom) {
    if (nom == "Rick" && objet1 == "pistolet" && objet2 == "szechuanSauce") {
      this.portalgun = "Ça y est j’ai révolutionné l’univers";
    } else if (nom == "Morty" &&
        objet1 == "szechuanSauce" &&
        objet2 == "meesseeksBox") {
      this.portalgun = "Encore un nouveau gosse de l’espace";
    }

    // Modification des objets si Jerry a été sélectionné à un moment donné
    if (objet1 == "Jerry" || objet2 == "Jerry") {
      this.nom = "Jerry";
      this.portalgun = "JerryAgain";
    }
  }
}

void main() {
  // Sélection du personnage et des objets
  Personnage rick = Personnage("Rick");
  Personnage morty = Personnage("Morty");
  Personnage jerry = Personnage("Jerry");

  Objet pistolet = Objet("pistolet");
  Objet meesseeksBox = Objet("meesseeksBox");
  Objet szechuanSauce = Objet("szechuanSauce");

  // Sélection du personnage et des objets
  Personnage personnageChoisi = rick; // Remplacez par le personnage choisi
  Objet objet1Choisi = pistolet; // Remplacez par le premier objet choisi
  Objet objet2Choisi = szechuanSauce; // Remplacez par le deuxième objet choisi

  // Création de la classe NinNinNin avec les objets choisis
  NinNinNin ninNinNin =
      NinNinNin(personnageChoisi.nom, objet1Choisi.nom, objet2Choisi.nom);

  // Affichage du résultat
  print("Résultat : ${ninNinNin.portalgun}");
}
