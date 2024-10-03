class Bibliotheque:
    def __init__(self):
        self.livres = []

    def ajouter_livre(self, titre, auteur):
        self.livres.append((titre, auteur))

    def supprimer_livre(self, titre):
        self.livres = [(t, a) for t, a in self.livres if t != titre]

    def lister_livres(self):
        return self.livres

    def rechercher_livres_par_auteur(self, auteur):
        return [(t, a) for t, a in self.livres if a == auteur]

    def generer_statistiques(self):
        nombre_livres = len(self.livres)
        auteurs_uniques = set(a for _, a in self.livres)
        return {
            'nombre_livres': nombre_livres,
            'auteurs_uniques': auteurs_uniques,
        }

