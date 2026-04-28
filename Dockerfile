FROM jenkins/jenkins:lts
USER root

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    lsb-release \
    curl \
    ca-certificates \
    gnupg

# Añadir la llave oficial de Docker y el repositorio
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Instalar SOLO el cliente de Docker (cli)
RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins
