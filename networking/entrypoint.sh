#!/bin/sh
/etc/init.d/privoxy start
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
