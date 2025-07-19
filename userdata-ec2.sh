#!/bin/bash
# Met à jour le système
apt-get update -y
apt-get upgrade -y

# Installe les dépendances
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Ajoute la clé GPG officielle de Docker
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Ajoute le dépôt Docker au sources.list
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installe Docker
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Active et démarre le service Docker
systemctl enable docker
systemctl start docker

# Ajoute l'utilisateur ubuntu au groupe docker
usermod -aG docker ubuntu

# Empêche SSH de poser des questions de vérification de clé (optionnel pour Jenkins)
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
