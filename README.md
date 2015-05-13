Dockerfile to run Owncloud 8 in a Fedora 22 Docker container

* Fedora only: the container uses Owncloud as packaged in Fedora 22.
* No SSL: SSL is to be handled by a reverse proxy.
* Persistence: Use Docker volumes to persist the following directories:
  * /var/lib/owncloud/apps
  * /var/lib/owncloud/data
  * /etc/owncloud
  See the script `run` for an example using host directories as volumes.

Issues
------
* The image is based on a beta build of Fedora 22 and should be updated when
  Fedora 22 is officially released.
* Apache does not seem to stop properly when the container shuts down.
  Therefore, Apache is run using `assets/run-httpd.sh`, a script which deletes
  a stale PID file before running `httpd`.
