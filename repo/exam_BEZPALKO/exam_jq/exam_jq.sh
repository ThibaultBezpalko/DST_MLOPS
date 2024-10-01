#!/bin/bash
echo "1. Affichez le nombre d'attributs par document ainsi que l'attribut name. Combien y a-t-il d'attributs par document ? N'affichez que les 12 premières lignes avec la commande head (notebook #2)."
cat ~/people.json | jq '.[] | {name, count: length}' | head -n 12
echo "Commande : ~/cat people.json | jq '.[] | {name, count: length}' | head -n 12"
echo -e "\n---------------------------------\n"

echo "2. Combien y a-t-il de valeur 'unknown' pour l'attribut 'birth_year' ? Utilisez la commande tail afin d'isoler la réponse."
cat ~/people.json | jq 'group_by(.birth_year)[] | {birth_year: .[0].birth_year, count: length}' | tail -n 4
echo 'Commande : ~/cat people.json | jq "group_by(.birth_year)[] | {gender: .[0].birth_year, count: length, ids: .id[]}" | tail -n 4'
echo "Réponse : 42, la réponse universelle"
echo -e "\n---------------------------------\n"

echo "3. Affichez la date de création de chaque personnage et son nom. La date de création doit être de cette forme : l'année, le mois et le jour. N'affichez que les 10 premières lignes."
cat ~/people.json | jq ".[] | {name, created: .created[:10]}" | head -n 10
echo 'Commande : cat ~/people.json | jq ".[] | {name, created: .created[:10]}" | head -n 10'
echo -e "\n---------------------------------\n"

echo "4. Certains personnages sont nés en même temps. Retrouvez toutes les pairs d'ids (2 ids) des personnages nés en même temps."
birth_years=`cat ~/people.json | jq "group_by(.birth_year)[] | {birth_year: .[0].birth_year, count: length} | select(.count==2) | .birth_year"`
for by in $birth_years
do
echo "The following characters are born the same year in $by:"
cat ~/people.json | jq ".[] | {name, id, birth_year} | select(.birth_year==$by) | .id"
done
echo 'Commande : birth_years=`cat ~/people.json | jq "group_by(.birth_year)[] | {birth_year: .[0].birth_year, count: length} | select(.count==2) | .birth_year"`
for by in $birth_years
do
echo "The following characters are born the same year in $by:"
cat ~/people.json | jq ".[] | {name, id, birth_year} | select(.birth_year==$by) | .id"
done'
echo -e "\n---------------------------------\n"

echo "5. Renvoyez le numéro du premier film (de la liste) dans lequel chaque personnage a été vu suivi du nom du personnage. N'affichez que les 10 premières lignes."
ids=`cat ~/people.json | jq ".[].id"`
for id in $ids
do
num=`cat ~/people.json | jq ".[] | select(.id==$id) | .films | min"`
role=`cat ~/people.json | jq ".[] | select(.id==$id) |.name"`
echo "${role:1:${#role}-2} appeared the first time in the film n°${num: -3:1}."
done
echo 'Commande : ids=`cat ~/people.json | jq ".[].id"`
for id in $ids
do
num=`cat ~/people.json | jq ".[] | select(.id==$id) | .films | min"`
role=`cat ~/people.json | jq ".[] | select(.id==$id) |.name"`
echo "${role:1:${#role}-2} appeared the first time in the film n°${num: -3:1}.'
echo -e "\n---------------------------------\n"

echo -e "\n----------------BONUS----------------\n"
echo "Je m'arrête là car j'ai beaucoup de travail à côté :)."
