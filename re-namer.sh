#!/bin/bash
#renna:rename multiple filesaccording to several rules
#written by felix hudson Jan -2000

#菲利克斯。哈德逊2000年1月写的，根据一些规则重命名文件。

#first check for the various 'modes' that this program has
#if the firest($1) condition matches then we execute that portion of the
#program and then exit

#首先检查这个项目的各种“模式”，如果第一个程序参数条件匹配，然后我们执行的部分
#程序，然后退出。

#check for the prefix condition
if [ $1=p ];then

#检查前缀条件，这里的参数选项P应该就是前缀条件。

#we now get rid of the mode($1) variable and prefix($2)
 prefix=$2;shift;shift

#我们现在的模式参数变量$1和前缀变量$2

#a quick check to see if any files were given
#if none then its better not to do anything than rename some non-existent
#files!!

 if [ $1 = ];then
    echo "no files given"
    exit 0
 fi

#快速的检查所有文件，如果没有那么它不做任何事情，也比重命名一些不存在的文件要好
#[ $1 = ]里面代表额含义是所有的文件。

#this for loop iterates through all of the files that we gave the program
#it does one rename per file given
 for file in $*
   do
   mv ${file} $prefix$file
 done

#这个for循环语句，遍历所有的文件，我们给这个项目它确实一个重命名文件。
#for file in $*,这个语句的意思是所有的文件， 而mv这是用到了mv的重命名的功能。
#mv (原文件名） （新文件名）


#we now exit the program
 exit 0
fi

# check for a suffix rename
# the rest of this part is virtually identical to the previous section
# please see those notes
if [ $1=s ];then
  suffix=$2;shift;shift

   if [ $1= ];then
    echo "no files given"
   exit 0
   fi

for file in $*
 do
  mv ${file} $file$suffix
 done

 exit 0
fi

#检查一个后缀名。这部分额其余部分几乎是相同的。suffix是后缀的意思。

#check for the replacement rename
if [ $1=r ];then

 shift

#检查更换重命名。

# i included this bit as to not damage any files if the user does not specify
# anything to be done
# just a safety measure

 if [ $# -lt 3 ];then
   echo "usage:renna r [expression][replacement]files..."
   exit 0
 fi

#如果用户没有去给这些文件做一些安全措施的话。我包括这样不损害文件。（ps: $#
#代表什么意思？—）

# remove other information
 OLD=$1;NEW=$2;shift;shift

#删除其他的信息。（ps：这里的shift是什么意思。）

# this for loop iterates through all of the files that we give the program
# it does one rename per file given using the program 'sed'
# this is a sinple command line program that parses standard input and
# replaces a set expression with a give string
# here we pass it the file name (as standard input) and replace the nessesary
# text

 for file in $*
 do
  new=`echo ${file} |sed s/${OLD}/${NEW}/g`
  mv ${file} $new
 done
 exit 0
 fi

#这个for循环语句，遍历了所有的文件。它给一个文件重新命名，同时有替换文本，
#这里有利用到sed这个命令的功能，sed替换是：sed s/要替换的符号/替换的符号/g

# if we have reached here then nothing proper was passed to the program
# so we tell the user how to use it
echo "usage"
echo "renna p [prefix] files.."
echo "renna s [suffix] files.."
echo "renna r [expression] [replacement] files.."
exit 0

# done!

#如果我们到了这里那么没有正确额传递成逊，所以我们告诉用户如何使用它。
