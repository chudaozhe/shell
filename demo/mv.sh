array=(1 2 3);
var=2;
if [[ "${array[@]}" =~ $var ]] ; then
        echo 'good';

fi;
exit 0;
DIR=${BASE}$1;
if [ -z "$2" ]
then
    DIR2=${DIR}`date +%s`; #未指定$2
else
    DIR2=${BASE}"$2"
fi

if [ -d ${DIR} ]
then
    mv ${DIR} ${DIR2};
fi;
exit 0;