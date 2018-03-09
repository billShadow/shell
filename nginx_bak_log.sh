#!/bin/bash

date=`date +%Y%m%d`
nginx_pid=`cat /var/run/nginx/nginx.pid`

if [ "$?" != 0 ]
then
    exit 1;
fi

log_path='/data/logs/nginx/'
log_name='access.log'
mv ${log_path}${log_name} ${log_path}${log_name}${date}

#删除30天之前的备份文件
function deloldbak()
{
    olddate=`date +"%Y%m%d" -d "-$1 day"`
    if [ -e "${log_name}${log_name}${olddate}" ]
    then
        rm -f ${log_path}${log_name}$olddate
        echo "${log_path}${log_name}${olddate} del ok"
    fi
}

kill -USR1 $nginx_pid

if [ "$?" == 0 ]
then
    deloldbak 30
    exit 0;
fi


