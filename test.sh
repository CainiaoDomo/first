#!/bin/bash
echo "Hello World"
echo "你好 世界"

#!/bin/bash
echo "CainiaoDomo"

#!/bin/bash
#把ls -l的信息通过输出重定向导入ls -l.txt这个文件或者目录中
ls -l > ls -l.txt

#!/bin/bash
grep da* 2>grep-erros.txt
#查找所有da开头的文件通过错误重定向导入grep-erros.txt的这个目录下

#!/bin/bash
grep da* 1>&2
#将查找到的所有da开头的文件的正确返回值给输入到2通道，也就是第二个命令，或目录下

#!/bin/bash
grep * 2>&1
#将所有查到的文件的错误返回值传递到1号通道

#!/bin/bash
rm -f $(find / -name core) &>/dev/null
#先执行find的命令，将根目录下名字叫croe的文件查找出来，然后执行rm命令将它删除
#然后将他们的标准输出重定向和错误输出重定向到/dev/null这个目录中，也就将这个文件#信息丢弃。
#$()这个特殊符号与“` `"俩个单撇号的意思相同，意思是中间的命令可以先执行
#&>/dev/null 等价于 >/dev/null 2>&1 意思是将标准输出和错误输出全部重定向到/dev/
#null中。



#管道命令的一些信息

#!/bin/bash
ls -l | sed -e "s/[aeio]/u/g"
#执行ls -l这条命令后，然后再执行后面的命令，后面的命令的意思是把[aeio]这4个字符
#用u来替换，g是终止这条命令的意思，s则是一个正则表达式的参数的意思。

ls -l | grep "\.txt$"
#执行ls -l的命令后,执行grep命令。将列出来的信息匹配到"\.txt$"这个正则表达式中。
 

#变量

#!/bin/bash
STR="Hello World"
echo $STR
#这是一个简单的输出shell，STR是一个变量，而后面的Hello World为这个变量定义的内容#变量的=号两边不能加空格，而要是定义的内容中有空格的话要用双引号括起来。
#最后通过echo命令将这个定义的内容输出出来。


#!/bin/bash
OF=/var/my-backup-$(date +%Y%m%d).tgz
tar-cZf $OF /home/me
#参数OF是/var/目录下my-backup.tgz文件，而$()里的参数命令的意思是日期，是当日的时时日期，如20150807，通过tar命令把OF归档到/home/me 中保存。

#!/bin/bash
HELLO=Hello
function hello(){
    local HELLO=World
    echo $HELLO
}
echo $HELLO
hello
echo $HELLO
#这是一个函数，一个定义本地变量的函数.(在function 函数后面记得一定得加“（）”）


#条件语句

#!/bin/bash
if [ "foo"="foo" ];
then 
   echo expression evaluated as true
fi
#这是一个if then的语句，意思是如果中括号里的参数相等的话，则输出表达式为真。
 
#!/bin/bash
if [ "foo"="foo" ];
then
   echo expression evaluated as true
else
   echo expression evaluated as false
fi
#这和上面的意思是一样的，只不过这是一个if then else条件语句，也就是如果参数相等
#的话那么则执行then的输出，其他的则执行else的输出。fi是if语句里的结束终止的意思

#!/bin/bash
T1="foo"
T2="bar"
if [ "$T1"="$T2" ];
then
   echo expression evaluated as true
else
   echo expression evaluated as false
fi
#这个if语句在上面的俩个前提下给予了俩个赋好值的俩个参数然后比较。条件为真则是the#n,条件为假则实行else。

#!/bin/bash
for i in $(ls);
do
echo item:$i
done
#这是一个for语句。它的结构是“for  变量名  [in数值列表] do 若干个命令行 done。
#上面意思是，把ls的含义赋值给i，然后输出的是item:$i,item是同类项的意思，也就是
#把该文件下的文件列出来，（不包括隐藏文件）。


#!/bin/bash
for i in `seq 1 10`
do
  echo $i
done
#这个函数的意思是，把 1到10分别赋值给参数i ，然后将i的值列出来。

#!/bin/bash
COUNTER=0
while [ $COUNTER -lt 10 ];
do
echo The counter is $COUNTER
let COUNTER=COUNTER+1
done
#这是一个whie语句，上面是一个简单的计数器的脚本，先给变量COUNTER赋值，然后通过
#while语句来给定条件，中括号里的意思是变量小于10.然后输出变量的值。

#!/bin/bash
COUNTER=20
until [ $COUNTER -lt 10 ];
do
  echo COUNTER $COUNTER
 let COUNTER-=1
done
#这是until语句脚本， 意思是只要参赛COUNTER比10小，那么则执行输出它的值，当它比
#10小的时候则终止。（ps:在[]里面的语句里记得俩边加空格。echo COUNTER $COUNTER
#里，第一个COUNTER没要什么含义，主要执行的是后面的参数$COUNTER,最后，“COUNTER-=
#1,其实它就等同于COUNTER=$COUNTER-1)

#!/bin/bash
function quit(){
	exit
}
function hello(){
	echo Hello!
}
hello
quit
echo foo
#这是关于function 函数功能的脚本，第一个函数的调用是退出。然后执行第二个函数的
#调用，是输出你好，然后是退出，把最后输出的东西打印输出。

#!/bin/bash
function quit(){
	exit
}
function e(){
	echo $1
}
e Hello
e World
quit
echo foo
#第一个函数的调用是退出。执行第二个函数调用，给e一个参数变量，在这个函数调用
#执行后，给e 给定俩个赋值，然后将给定义的值。然后退出，输出刚才给定的值。

#界面

#!/bin/bash
OPTIONS="Hello Quit"
select opt in $OPTIONS;
do
    if [ "$opt"="Quit" ];
     then
    echo done
    exit
    elif [ "$opt"="Hello" ];
     then
    echo Hello World
     else
      clear
      echo bad option
     fi
    done
#这是一个简单的界面选择脚本，先给定变量俩个赋值，然后给opt赋予变量的值，当你选
#择Quit的时候则选择输出done， 然后退出，当你选择 Hello的时候 则输出 你好，世界
#其余的选择则会输出清除的命令，然后输出 这是一个不好的选择。

===============================================================================
