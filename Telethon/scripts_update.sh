#!/bin/sh
set -e

if [ ! -f "/telethon/jd_zbj.py" ]; then
    echo "京东直播间抽奖脚本不存在，跳过执行..."
else
    echo "京东直播间抽奖脚本存在，执行并重启脚本..."
    eval $(ps -ef | grep "jd_zbj" | grep -v "grep" | awk '{print "kill "$1}')
    cd /telethon && python3 -u jd_zbj.py |ts >> /logs/jd_zbj.log 2>&1 &
    echo "京东直播间抽奖脚本，重启完成..."
fi
