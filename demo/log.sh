#!/bin/bash
#nginx不断生成的日志文件test.log; 每天0点执行, 把test.log内容追加到 以月份为名称的日志文件(test202009.log)中，并备份(mv test.log backup/test20200915.log)
#然后PHP就可以读取这个 以月份为名称的日志文件; 以月为单位做统计了

dir='../log/';
backup_dir='../log/backup/';

filename='test'
suffix='.log'
#此日志文件为nginx生成，固定文件名test.log
filepath=$dir$filename$suffix;
month_filename=$dir$filename$(date +%Y%m -d "yesterday")$suffix;
#日志文件不存在直接退出
if [ ! -f $filepath ]; then
 exit 1;
fi
if [ ! -f $month_filename ]; then
# 1.创建以月份为名称的日志名：test202009.log
   touch $month_filename;
   chown vagrant:vagrant $month_filename;
fi
#2.把日志内容追加到 以月份为名称的日志文件里
cat $filepath >> $month_filename;
[ ! -d $backup_dir ] && mkdir -p $backup_dir;
#3. 把日志备份到backup中
mv $filepath $backup_dir$filename$(date +%Y%m%d)$suffix;
