#!/bin/bash
string1='http://baidu.com/abcde';
#1. ${string: start :length}
#其中，string 是要截取的字符串，start 是起始位置（从左边开始，从 0 开始计数），length 是要截取的长度（省略的话表示直到字符串的末尾）。
echo ${string1: 1 :3};#bcd
echo ${string1: 1}; #bcde

#2. ${string: 0-start :length}
echo ${string1: -1}; #e

#3. 使用 # 号截取右边字符 ${string#*chars}
#其中，string 表示要截取的字符，chars 是指定的字符（或者子字符串），*是通配符的一种，表示任意长度的字符串。*chars连起来使用的意思是：忽略左边的所有字符，直到遇见 chars（chars 不会被截取）。
echo ${string1#*:};#//baidu.com/abcde
echo ${string1#*p:};#//baidu.com/abcde
echo ${string1#*tp:};#//baidu.com/abcde

echo ${string1#ttp://};

#4. 使用 % 截取左边字符
#${string%chars*}
#请注意*的位置，因为要截取 chars 左边的字符，而忽略 chars 右边的字符，所以*应该位于 chars 的右侧。其他方面%和#的用法相同，这里不再赘述，仅举例说明：
echo ${string1%:*}