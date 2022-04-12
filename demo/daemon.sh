#!/bin/bash
# 守护进程，保活某个脚本
# /data/shell/daemon.guard.sh
# guard the php daemons
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

fLogDaemon="/data/shell/logs/daemon.guard.log"
scriptlogDaemon="/data/shell/logs/redis.log"
datetime=`date +'%Y-%m-%d %H:%M:%S'`
DirWok="/data/shell/"
CMDPHP="/usr/local/php/bin/php"

daemonProcs=("6380/db0/php1.php" \
"6380/db0/php2.php" \
"6380/db0/php3.php" \
)

#------------------------------------
# global function 
#------------------------------------
DaemonOne(){
    local cmdCheckDaemon=`ps aux|grep -v "grep $1"| grep "$1"|wc -l`
    return $cmdCheckDaemon
}

#------------------------------------
# main programme
#------------------------------------
cd $DirWok
for daemonProc in ${daemonProcs[@]}
do
    daemonName=$daemonProc
    echo "check process the $daemonName"
    DaemonOne $daemonName
    RESULTS=$?
    if [ $RESULTS -lt 1 ]
    then
        echo "$datetime $daemonName is dead at $RESULTS. I'll restart the $daemonName">>$fLogDaemon
        $CMDPHP ${DirWok}$daemonName >> "${DirWok}logs/${daemonName}.log" &
        sleep 3
        DaemonOne $daemonName
        RESULTS=$?
        if [ $RESULTS -ge 1 ]
        then
            echo "$datetime $daemonName is started.">>$fLogDaemon
        else
            echo "Error: $datetime $daemonName is halt.Please alerm!">>$fLogDaemon
        fi
    fi
done
