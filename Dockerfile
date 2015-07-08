# Based on the Dockerfile by Dusty Mabe <dusty@dustymabe.com>

FROM       Fedora-Docker-Base-22-20150521.x86_64
MAINTAINER Mike Gerber <mike@sprachgewalt.de>

# Perform updates
RUN dnf -y upgrade && dnf clean all

# Install owncloud owncloud-httpd owncloud-sqlite rpms
RUN dnf install -y owncloud{,-httpd,-sqlite} && dnf clean all

# Allow connections from everywhere
RUN ln -s /etc/httpd/conf.d/owncloud-access.conf.avail /etc/httpd/conf.d/z-owncloud-access.conf

# Avoid problems with container restart
ADD assets/run-httpd.sh /usr/sbin/run-httpd.sh
RUN chmod -v +x /usr/sbin/run-httpd.sh

# Expose port 80 and run httpd
EXPOSE 80
CMD ["/usr/sbin/run-httpd.sh"]
