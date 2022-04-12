c1=`uptime | awk '{print $10}'`;
echo ${c1:0:-1};
c5=`uptime | awk '{print $11}'`;
echo ${c5:0:-1};
c15=`uptime | awk '{print $12}'`;
echo $c15;

function http() {
        curl -X POST http://debug.xx.com/sensor/data.php -H 'Cache-Control: no-cache' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Authorization: Basic dG9vbHM6MTIz' -d "type=cpu&name=${1}&value=${2}";
}

http 'c1' ${c1:0:-1};
http 'c5' ${c5:0:-1};
http 'c15' $c15;