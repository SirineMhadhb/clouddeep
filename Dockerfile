# Définition de l'image de base pour Python 3.12
FROM python:3.12

# Installation des dépendances nécessaires
RUN pip install streamlit opencv-python-headless tensorflow matplotlib

# Copiez le répertoire de votre projet dans le conteneur
COPY . /app

# Définissez le répertoire de travail
WORKDIR /app

# Exécutez l'entraînement du modèle
RUN python train.py

# Exposez le port utilisé par Streamlit
EXPOSE 8501

# Commande par défaut pour exécuter l'application Streamlit
CMD ["streamlit", "run", "detect-gender_webcam.py"]
