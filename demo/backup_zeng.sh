cd /data/backup_file
mkdir $(date +%Y%m%d)
cd /www

tar -N $(date -d yesterday "+%F") -zcpf /data/backup_file/$(date +%Y%m%d)/aliyun_zeng_$(date +%Y%m%d-%H%M).tar.gz . \
--exclude=tmp \
--exclude=test \
--exclude=song/weixin_huohao/data \
--exclude=song/taobao_huohao/data \
--exclude=song/meili_huohao/data \
--exclude=song/luoheluntan/axiangstudio/data \
--exclude=haoiwan/application/data \
--exclude=song/weishechibak



tar -cvzf /data/backup_file/$(date +%Y%m%d)/etc$(date +%Y%m%d%H%M).tar.gz /etc/

mysqldump -uroot -pcuiwei.net -A | gzip > /data/backup_file/$(date +%Y%m%d)/all_mysql$(date +%Y%m%d%H%M).sql.gz

rm -rf /data/backup_file/$(date -d "-7 day" +"%Y%m%d")
