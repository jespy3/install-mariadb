# Debian v12 base image
FROM debian:bookworm-slim

# install needed packages
RUN apt update && apt upgrade -y && apt install -y \
  vim \
  wget \
  gnupg \
  lsb-release

# Downloads GPG key and stores in container
RUN wget -O- https://mariadb.org/mariadb_release_signing_key.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/mariadb.gpg > /dev/null \
  && echo "deb [arch=arm64] http://mirror.netinch.com/mariadb/repo/11.5.2/debian $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/mariadb.list \
  && apt update && apt install -y mariadb-server

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

