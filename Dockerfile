# Debian v12 base image
FROM debian:bookworm-slim

# install needed packages
RUN apt update && apt upgrade -y && apt install -y \
  vim \
  wget \
  gnupg \
  lsb-release

# Downloads GPG key and stores in container
RUN wget -O- https://mariadb.org/mariadb_release_signing_key.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/mariadb.gpg > /dev/null
