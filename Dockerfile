FROM eclipse-temurin:17
COPY qemu-arm-static /usr/bin/qemu-arm-static
MAINTAINER signal-cli@devtom.de

ARG SIGNAL_ASSET

ADD ${ASSET} /
RUN mv /signal-cli-*/ /signal-cli/

VOLUME /config

ENTRYPOINT ["/signal-cli/bin/signal-cli", "--config", "/config"]