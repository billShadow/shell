#/bin/bash

#desciption : auto check http 502 to restart php-fpm

num=`cat /mnt/logs/nginx/access.log | grep -oP 'HTTP/1.1" 502' | cut -d ' ' -f | uniq -c | awk '{print $1}'`
# 或者这样,只是cut换成了awk命令
#num=`cat /mnt/logs/nginx/access.log | grep -oP 'HTTP/1.1" 502' | awk '{print $2}' | uniq -c | awk '{print $1}'`

echo 'err_num:'$num

pid=`ps -ef | grep 'master process (/mnt/server/php7020/etc/php-fpm.conf)' | grep -v grep | head -1 | awk '{print $2}'`
echo 'pid:'$pid

if [[ $num -gt 20 ]];then
    kill $pid
    /mnt/server/php7020/sbin/php-fpm -c /mnt/sever/php7020/etc/php.ini
    chown -R www-data:www-data /var/run/php-fpm/
    $num >> /mnt/logs/nginx/kill.log
fi
