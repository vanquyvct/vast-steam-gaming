FROM lscr.io/linuxserver/steam:latest

USER root

ARG TABBY_VERSION=1.0.237

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl xterm && \
    curl -1sLf 'https://dl.cloudsmith.io/public/lizardbyte/stable/cfg/setup/bash.deb.sh' | bash && \
    apt-get update && \
    apt-get install -y --no-install-recommends sunshine && \
    curl -fL -o /tmp/tabby.deb \
      "https://github.com/Eugeny/tabby/releases/download/v${TABBY_VERSION}/tabby-${TABBY_VERSION}-linux-x64.deb" && \
    apt-get install -y /tmp/tabby.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY root/ /

RUN chmod +x /usr/local/bin/start-gaming-session

ENV TITLE="Vast Steam Gaming" \
    PIXELFLUX_WAYLAND=false \
    SELKIES_VIDEO_STREAMING_MODE=true \
    SELKIES_ENCODER="h264enc,h265enc" \
    SELKIES_FRAMERATE="60" \
    SELKIES_RATE_CONTROL_MODE="cbr" \
    SELKIES_VIDEO_BITRATE="30000" \
    SELKIES_ENABLE_RATE_CONTROL="true" \
    SELKIES_CONGESTION_CONTROL="true" \
    SELKIES_BACKPRESSURE_QUEUE_SIZE="8"

EXPOSE 3001/tcp
EXPOSE 47984/tcp 47989/tcp 47990/tcp 48010/tcp
EXPOSE 47998/udp 47999/udp 48000/udp
EXPOSE 27031/udp 27036/udp 27036/tcp 27037/tcp
