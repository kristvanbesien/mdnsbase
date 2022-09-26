FROM fedora
RUN yum -y install avahi avahi-tools; dnf clean all; systemctl enable avahi-daemon
CMD ["/sbin/init"]
