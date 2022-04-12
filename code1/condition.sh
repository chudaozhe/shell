#!/bin/bash

a=2;
b=2;
c=346
d='11';
#Test和[]中可用的比较运算符只有==和!=，两者都是用于字符串比较的，不可用于整数比较
#整数比较只能使用-eq，-gt这种形式。无论是字符串比较还是整数比较都 不支持大于号小于号
if [ $a == $b ]; then
      echo 'a和b相等';
    else
      echo 'a不等于b';
fi

#(())里对变量，无需$符
if (( a == b && b <c )) ; then
    echo 'good..';
fi
if [ $d != '' ]; then
      echo 'd不为空';
    else
      echo 'd为空';
fi
#a =~ b a里面包含b
if [[ $c =~ 3 ]]; then
    echo '$c 包含3';
  else
    echo '$c 不包含3'
fi

if [[ $c =~ ^1[0-9]{10}$ ]]; then
      echo "你输入的是手机号码"
else
      echo "你输入的不是手机号码"
fi