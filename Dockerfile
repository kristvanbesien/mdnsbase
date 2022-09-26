FROM registry.fedoraproject.org/fedora:36
LABEL maintainer="Krist van Besien <krist.vanbesien@gmail.com>"

RUN echo "**** Install avahi ****" \
    && dnf  -y install avahi avahi-tools nss-mdns\
    && dnf clean all \
    && echo "**** Masking systemd services ****" \
    && systemctl enable avahi-daemon 

CMD ["/sbin/init"]
STOPSIGNAL SIGRTMIN+3
