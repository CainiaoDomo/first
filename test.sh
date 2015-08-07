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

