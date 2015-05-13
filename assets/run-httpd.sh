#!/bin/bash
# Original Source:
# https://github.com/projectatomic/docker-image-examples/blob/master/rhel-httpd/run-apache.sh

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/*

/usr/sbin/httpd -D FOREGROUND
