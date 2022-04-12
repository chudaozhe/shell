#!/bin/bash
count=`ls -l|grep ^-|wc -l`;
echo $count;

curlx(){
#       url="http://test.cuiwei.net/manual/?type=show&id=13";
        url="http://test.cuiwei.net/json.php";
        result=$(curl -s $url);
        id=$(echo $result|jq .id)
        echo $id;

#"-eq" 对整数进行比较
#"=="  对字符串进行比较
if [ "$id" -eq "13" ] ; then
        echo "good"
    else
        echo "error"
    fi

}
curlx;
wgetx(){
        url="http://www.baidu.com"
        content=`wget -q -O - http://www.baidu.com/`
        echo "content:$content"
}
#wgetx;