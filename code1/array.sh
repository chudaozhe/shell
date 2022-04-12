#!/bin/bash
arr1=(1 2 3 'ab');
arr1[10]='abc';
#获取下标为0的
echo ${arr1[0]};
#获取全部，@或*
echo ${arr1[*]};

#数组长度
echo ${#arr1[*]};
#数组中某元素的长度
echo ${#arr1[10]};

arr2=(44 55 'http://baidu.com');
#合并数组
newarr=(${arr1[*]} ${arr2[*]})
echo ${newarr[*]}

#删除数组元素
unset arr1[10];
#删除整个数组
unset arr1;