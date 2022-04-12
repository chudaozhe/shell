#!/bin/bash
dir='/Users/cuiw/Downloads/temp1333';
#if [ ! -d $dir ]; then
#      mkdir $dir;
#      echo '目录创建成功';
#    else
#      echo '目录已经存在';
#fi
#简写
[ ! -d $dir ] && mkdir $dir;