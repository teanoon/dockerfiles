FROM openjdk:8

RUN echo "deb http://packages.linuxmint.com debian import" | tee /etc/apt/sources.list.d/firefox.list && \
    apt-get update && apt-get install -y --no-install-recommends --allow-unauthenticated \
    # common x11 client dependencies
    firefox libdbus-glib-1-2 libxtst-dev \
    # java source
    openjdk-8-source \
    # better fonts
    ttf-wqy-microhei \
    # certificate
    ca-certificates \
    # some ides need machine-id info like atom/eclipse
    dbus && dbus-uuidgen > /etc/machine-id && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m dev && \
    mkdir /code && \
    chown dev:dev /code -R

USER dev
WORKDIR /code
