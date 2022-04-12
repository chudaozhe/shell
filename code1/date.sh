#!/bin/bash
#详见linux date命令
#时间戳(10位
date1=`date +%s`;
echo $date1;
#字符串拼接
date2='prefix_'`date +%Y%m%d%H%M%S`;
echo $date2;
