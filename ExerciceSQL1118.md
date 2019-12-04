##  Exercice SQL from jeux_video.sql

1 >>> Afficher le nom des jeux et de la console

2 >>> Lister les jeux sur "SUPERNES", trier kes résultats par ordre alphabétique de nom de jeux.

3 >>> Qui possède "Street Fighter 2" ?

4 >>> Afficher les noms, consoles, et prix des 4 jeux les moins chere

5 >>> Afficher le nom des jeux et le possesseur dont le posseusseur contient un "o"

6 >>> Lister les jeux PC dont le nombre de joueur max est compris entre 4 et 12

7 >>> Afficher sans doublon dans la console

8 >>> Quels sont les consoles dont les jeux sont tous inférieur à 15€

9 >>> Quel sont les consoles dont le nombre de joueur max eest de 4 joueur ?

10 >>> Ecrire la requete qui permet de lister les noms de jeux qui commence par B ou un F et dont les possesseur ont un e dans leur prenom



    1 >>> SELECT nom, console FROM jeux_video

    2 >>> SELECT * FROM jeux_video WHERE console = 'SuperNES' ORDER BY nom;

    3 >>> SELECT nom, possesseur FROM jeux_video WHERE nom = 'Street Fighter 2';

    4 >>> SELECT nom, console, prix FROM jeux_video ORDER BY prix LIMIT 4;

    5 >>> SELECT  nom, console, prix FROM jeux_video WHERE possesseur LIKE '%o%';

    6 >>> SELECT * FROM jeux_video WHERE nbre_joueurs_max BETWEEN '4' AND '12' AND console = 'PC';

    7 >>> SELECT DISTINCT console FROM jeux_video;

    8 >>> SELECT console FROM jeux_video GROUP BY console  HAVING MAX(prix) < '15';

    9 >>> SELECT DISTINCT console FROM jeux_video WHERE nbre_joueurs_max = '4';

    10 >>> SELECT nom FROM jeux_video WHERE nom LIKE 'b%' OR nom LIKE 'f%' AND possesseur LIKE '%e%';
