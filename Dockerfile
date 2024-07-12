# Utiliser une image Python officielle comme image de base
FROM python:3.10-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt /app/

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste de l'application
COPY . /app

# Exposer le port sur lequel l'application sera accessible
EXPOSE 8501

# Définir la commande de démarrage par défaut
#CMD ["python", "./server/app.py"]
ENTRYPOINT ["streamlit","run","./client/app.py","--server.port=8501","--server.address=0.0.0.0"]
