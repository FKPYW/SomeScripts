#!/bin/sh
set -e

#获取配置的自定义参数
if [ $1 ]; then
    run_cmd=$1
fi

echo "获取最新mimotion相关代码"
cd /scripts
git reset --hard
git pull origin master --rebase
echo "获取最新mimotion相关代码完成"

echo "首次初始化定时任务..."
sh -x /scripts/mimotion/default_task.sh
echo "初始化完成..."

if [ $run_cmd ]; then
    echo "Start crontab task main process..."
    echo "启动crondtab定时任务主进程..."
    crond -f
else
    echo "默认定时任务执行结束。"
fi