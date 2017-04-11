FROM alpine:3.5
LABEL maintainer "Antoine Mary <antoinee.mary@gmail.com>"

### SET ENVIRONNEMENT
ENV LANG="en_US.UTF-8" \
    SOFTETHER_VERSION="v4.22-9634-beta"

### SETUP
COPY assets /assets
RUN apk --no-cache add wget make gcc musl-dev readline-dev openssl-dev ncurses-dev libcap su-exec && \
    addgroup softether && adduser -g 'softether' -G softether -s /bin/sh -D -H softether && \
    mv /assets/entrypoint.sh / && chmod +x /entrypoint.sh && \

    # Fetch sources
    wget --no-check-certificate -O - https://github.com/SoftEtherVPN/SoftEtherVPN/archive/${SOFTETHER_VERSION}.tar.gz | tar xzf - && \
    cd SoftEtherVPN-${SOFTETHER_VERSION:1} && \
    # Compile and Install
    cp src/makefiles/linux_64bit.mak Makefile && \
    make && make install && make clean && \

    # Cleanning
    apk del wget make gcc musl-dev readline-dev openssl-dev ncurses-dev && \
    # Reintroduce necessary libraries
    apk --no-cache add libssl1.0	libcrypto1.0 readline ncurses-libs && \
    # Removing vpnbridge, vpncmd vpnserver and build files
    cd .. && rm -rf /usr/vpnbridge /usr/bin/vpnbridge /usr/vpncmd /usr/bin/vpncmd /usr/vpnserver /usr/bin/vpnserver /usr/bin/vpnclient \
    /assets SoftEtherVPN-${SOFTETHER_VERSION:1}

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/vpnclient/vpnclient", "execsvc"]
