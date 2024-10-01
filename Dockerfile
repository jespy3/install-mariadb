# Debian v12 base image
FROM debian:bookworm-slim

RUN apt update && apt upgrade -y && apt install -y \
  vim
