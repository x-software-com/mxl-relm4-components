FROM ubuntu:24.04

LABEL org.opencontainers.image.source=https://github.com/x-software-com/mxl-relm4-components
LABEL org.opencontainers.image.description="Build image for MXL Relm4 components"
LABEL org.opencontainers.image.licenses="MIT OR APACHE-2.0"

RUN apt update \
    && apt install -y --no-install-recommends \
    ca-certificates lsb-release build-essential clang git tar curl wget zip unzip \
    linux-tools-common linux-tools-generic xvfb \
    libgtk-4-dev libadwaita-1-dev
