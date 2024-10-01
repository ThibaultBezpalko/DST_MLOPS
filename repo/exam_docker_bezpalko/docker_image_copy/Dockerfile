# Partir d'une image ubuntu
FROM ubuntu:18.04

# Updater ubuntu puis installer python et pip puis installer la libriairie requests
RUN apt-get update && apt-get install python3-pip -y && pip3 install requests

# Définir une variable d'environnement LOG égale à 1
ENV LOG 1

# Exposer le port vers l'extérieur
EXPOSE 8000

# Monter un volume de manière à récupérer sur la machine hôte le fichier généré dans le container
# VOLUME exam_docker_bezpalko_volume

# Récupérer le script python depuis la machine hôte
ADD test_authentication.py /api/test_authentication.py
#ADD /home/ubuntu/repo/exam_docker_bezpalko/test_authentication.py /api/test_authentication.py

# Répertoire de travail
WORKDIR /api/

# Lancer le test python
CMD python3 test_authentication.py