#!/bin/bash
#等号两边不能有空格
var1='aaa'; #单引号，双引号和php意义一致
var2='bbb';
var2='222'; #变量2次赋值
echo $var1;

#变量拼接字符串
echo $var1$var2'后缀';

#将命令的执行结果赋值给变量
var3=`ls /Users/cuiw/`;
echo $var3;
