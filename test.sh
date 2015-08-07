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
