#!/bin/bash

#clone Aria2-WebUI into place
rm -R /usr/share/nginx/html

git clone git://github.com/ziahamza/webui-aria2 /usr/share/nginx/html/
chown -R www-data:www-data /usr/share/nginx/html
chmod -R 777 /usr/share/nginx/html
