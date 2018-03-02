#/bin/bash

# author : bill_xiaobin@163.com
# description : Auto pull pre second

while true
do
    sleep 3
    cd /www/osv/ && git pull
done

# 最简单的实现代码更新
# 前提：需要Linux跑进程：
# `nohup sh /data/shell/git_auto_pull.sh > 2>&1 &`


