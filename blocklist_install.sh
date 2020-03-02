sudo apt update
sudo apt -y install python3 python3-dev python3-pip nginx
sudo pip3 install setuptools
sudo pip3 install uwsgi
sudo adduser --disabled-login --disabled-password --ingroup www-data --shell /bin/false --gecos "" blocklist
sudo mkdir /var/www/html/cgi-bin
sudo touch /var/www/html/blocklist.html
sudo chgrp www-data /var/www/html/blocklist.html
sudo chmod 664 /var/www/html/blocklist.html
sudo curl https://raw.githubusercontent.com/tomlogichub/blocklist/master/blocklist.py -o /var/www/html/cgi-bin/blocklist.py
sudo curl https://raw.githubusercontent.com/tomlogichub/blocklist/master/blocklist-api.ini -o /var/www/html/cgi-bin/blocklist-api.ini
sudo chgrp -R www-data /var/www/html/cgi-bin
sudo chmod -R 775 /var/www/html/cgi-bin
sudo curl https://raw.githubusercontent.com/tomlogichub/blocklist/master/blocklist-api.service -o /etc/systemd/system/blocklist-api.service
sudo curl https://raw.githubusercontent.com/tomlogichub/blocklist/master/blocklist-api -o /etc/nginx/sites-available/blocklist-api
sudo ln -s /etc/nginx/sites-available/blocklist-api /etc/nginx/sites-enabled/blocklist-api
sudo rm /etc/nginx/sites-enabled/default
sudo systemctl enable blocklist-api.service
sudo systemctl daemon-reload
sudo systemctl start blocklist-api
sudo systemctl restart nginx
