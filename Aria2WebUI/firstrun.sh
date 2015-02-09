#!/bin/bash

#clone Aria2-WebUI into place
rm -R /var/www/

git clone git://github.com/ziahamza/webui-aria2 /var/www/html/
chown -R www-data:www-data /var/www
