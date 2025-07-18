# CI/CD App - Flask + Docker + Jenkins

Ce projet met en place une application Flask simple déployée via une pipeline CI/CD Jenkins. L'application est containerisée avec Docker, puis poussée sur Docker Hub et déployée sur un serveur distant (ex: EC2) grâce à un script bash automatisé.

---

## Technologies utilisées

- Python + Flask
- Docker & Docker Compose
- Jenkins Pipeline
- Bash (déploiement distant)
- GitHub + Docker Hub
- Serveur cible (EC2 par exemple)

---

## Lancement local (dev)

1. Avec Docker:
   ```bash
   docker build -t TP-app .
   docker run -d -p 80:80 TP-app

2. Avec Docker Compose:
   ```bash
   docker-compose up --build -d

3. Script de déploiement par Jenkins:
   ```bash
   ./deploy.sh mawed22/TP-app

5. Nettoyer l’infrastructure  :
   ```bash
   docker rm -f TP_app
   docker rmi TP-app


