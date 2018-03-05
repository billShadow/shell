#/bin/bash

#author : bill_xiaobin@163.com
#description : nginx server command

echo "可执行动作start,stop,restart"
read -p "请输入您需要执行的动作：" name

case $name in
    start)
        /data/server/nginx/sbin/nginx -c /data/server/nginx/etc/nginx.conf
        ;;
    stop)
        nginx_pid=`ps -ef | grep -v grep | grep "nginx: master process " | awk '{print $2}'`
        kill $nginx_pid
        ;;
    restart)
        /data/server/nginx/sbin/nginx -s reload
        ;;
    *)
        echo 'not found option'
        ;;
esac
exit 0
