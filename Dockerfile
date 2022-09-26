FROM registry.fedoraproject.org/fedora:36
LABEL maintainer="Krist van Besien <krist.vanbesien@gmail.com>"

RUN echo "**** Installing packages for systemd and updating if necessary ****" \
    && dnf -y --nodoc install \
       systemd \
    && echo "**** Cleaning package cache ****" \
    && dnf clean all \
    && echo "**** Masking systemd services ****" \
    && systemctl mask \
       systemd-remount-fs.service dev-hugepages.mount sys-fs-fuse-connections.mount getty.target console-getty.service systemd-udev-trigger.service systemd-udevd.service systemd-random-seed.service systemd-machine-id-commit.service


RUN echo "**** Install some usefull tools ****" \
    dnf -y remove vim-minimal \
    && dnf -y install \
           abrt \
           bash-completion \
           bc \
           dnf-plugins-core \
           file \
           findutils \
           iproute \
           iputils \
           less \
           nc \
           netsniff-ng \
           net-tools \
           procps-ng \
           psmisc \
           tar \
           tcpdump \
           vim-enhanced \
           which \
    && echo "**** Clean Cache ****" \
    && dnf clean all

CMD ["/sbin/init"]
STOPSIGNAL SIGRTMIN+3
