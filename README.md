# blocklist
Creates a blocklist server that can be referenced by a Palo Alto or Fortigate firewall

# Installation

DO NOT run the install on a production nginx server.

Note that the install script installs nginx, creates a new nginx site and removes the /etc/nginx/sites-enabled/default symlink.

Also note that this utility does not support authentication for adding to or removing from the blocklist or for reading the blocklist so do not expose the application to the public Internet.

To install, run blocklist_install.sh.

# Usage
Add IP addresses to the list:
  - http://your-server/cgi-bin/blocklist.py?action=add&ip=x.x.x.x

Remove IP addresses from the list:
  - http://your-server/cgi-bin/blocklist.py?action=remove&ip=x.x.x.x

# Output
The blocklist will be available at http://your-server/blocklist.html
