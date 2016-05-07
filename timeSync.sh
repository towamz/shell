#!/bin/sh
#pingを実行してネットワーク接続を確認し、接続できていない場合は終了する
CNT=0
until ping -c 1 yahoo.co.jp
do
    if [ $CNT -gt 5 ]
    then
        echo please check the network connectivity. exit this script
        exit 1
    fi

    sleep 10s
    CNT=$(( CNT + 1 ))
done

#ネットワーク接続していたら、ntpdateを実行する
date
until /bin/sudo /sbin/ntpdate clock.nc.fukuoka-u.ac.jp
do
done
