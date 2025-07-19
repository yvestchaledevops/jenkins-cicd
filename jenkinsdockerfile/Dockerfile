FROM jenkins/jenkins:lts

USER root

ARG DOCKER_GID=103

# Installer Docker et sudo + configurer les permissions
RUN apt-get update && \
    apt-get install -y docker.io sudo && \
    groupadd -g ${DOCKER_GID} docker && \
    usermod -aG docker jenkins && \
    echo "jenkins ALL=NOPASSWD:ALL" >> /etc/sudoers && \
    passwd -d root

USER jenkins
