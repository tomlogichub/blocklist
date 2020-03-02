# blocklist
Creates a blocklist server that can be referenced by a Palo Alto firewall

# Installation
To install, run blocklist_install.sh.  Note that the install script assumes nginx is not installed.  If you run this on a server that has an nginx installation, the /etc/nginx/sites-enabled/default symlink will be removed.

This utility does not support authentication for adding to or removing from the blocklist or for reading the blocklist so do not expose the application to the public Internet.

# Usage
Add IP addresses to the list:
  - http://<server>/cgi-bin/blocklist.py?action=add&ip=x.x.x.x

Remove IP addresses from the list:
  - http://<server>/cgi-bin/blocklist.py?action=remove&ip=x.x.x.x

# Output
The blocklist will be available at http://<server>/blocklist.html
