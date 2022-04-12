#!/bin/bash
mv /var/log/nginx/access.log /var/log/nginx/access_`date +%Y%m%d`.log
killall -s USR1 nginx	#使用USR1参数通知Nginx进程切换日志文件
