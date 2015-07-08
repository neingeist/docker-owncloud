Dockerfile to run ownCloud 8 in a Fedora 22 Docker container

* Fedora only: the container uses ownCloud as packaged in Fedora 22.
* No SSL: SSL is to be handled by a reverse proxy.
* Persistence: Use Docker volumes to persist the following directories:
  * `/var/lib/owncloud/apps`
  * `/var/lib/owncloud/data`
  * `/etc/owncloud`

  See the script `run` for an example using host directories as volumes. This
  script also uses `:Z` volume suffixes to make use of SELinux MCS separation
  on my Fedora host.

Issues
------
* Apache does not seem to stop properly when the container shuts down.
  Therefore, Apache is run using `assets/run-httpd.sh`, a script which deletes
  a stale PID file before running `httpd`.
