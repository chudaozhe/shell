cd /data/backup_file
mkdir $(date +%Y%m%d)
cd /www

tar -zcpf /data/backup_file/$(date +%Y%m%d)/aliyun_all-backup_$(date +%Y%m%d-%H%M).tar.gz . \
--exclude=tmp \
--exclude=test \
--exclude=song/weixin_huohao/songqinhe/data \
--exclude=song/taobao_huohao/data \
--exclude=song/meili_huohao/data \
--exclude=song/luoheluntan/axiangstudio/data \
--exclude=haoiwan/application/data \
--exclude=song/weishechibak

