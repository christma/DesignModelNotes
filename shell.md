# shell 

## 变量的高级用法

### 变量替换

```shell
shell var01="hello word,hello shell"

➜  shell echo $var01
hello word,hello shell
➜  shell v=${var01#*ll}
➜  shell echo $v
o word,hello shell
➜  shell v1=${var01##*ll}
➜  shell echo $v1

➜  shell v3=${var01%ll}
➜  shell echo $v3
hello word,hello she
➜  shell v4=${var01%%ll}
➜  shell echo $v4
hello word,hello she
➜  shell v4=${var01%%ll*}
➜  shell echo $v4

➜  shell v4=${var01/ll/uu}
➜  shell echo $v4

heuuo word,hello shell
➜  shell v5=${var01//ll/uu}
➜  shell echo $v5
heuuo word,heuuo sheuu
➜  shell
```

![bianliang](/Users/apple/github_clone/DesignModelNotes/image/1694400780397.jpg)



### 字符串处理

```shell
## 计算字符串长度
➜  shell echo $var01
hello word,hello shell
➜  shell echo ${#var01}
22

```



![WX20230911-110822](/Users/apple/github_clone/DesignModelNotes/image/WX20230911-110822.png)

- ### 抽取子串

- ```shell
  ➜  shell echo ${var01}
  hello word,hello shell
  ➜  shell echo ${var01:5}
   word,hello shell
  ➜  shell echo ${var01:5:10}
   word,hell
  ➜  shell echo ${var01:(-5)}
  shell
  ```

- 

- ![03](/Users/apple/github_clone/DesignModelNotes/image/WX20230911-111246.png)

### 脚本练习

![hhh](/Users/apple/github_clone/DesignModelNotes/image/WX20230911-114502.png)

```shell
#!/bin/bash

string="Hadoop Common: The common utilities that support the other Hadoop modules.Hadoop Distributed File System (HDFS™): A distributed file system that provides high-throughput access to application data.Hadoop YARN: A framework for job scheduling and cluster resource management.Hadoop MapReduce: A YARN-based system for parallel processing of large data sets."

function print_tips
{
	echo "********************************"
	echo "* (1)、打印string长度"
	echo "* (2)、删除字符串中所有的Hadoop "
	echo "* (3)、背换第一个Hadoop为Mapreduce"
	echo "* (4)、替换全部Hadoop为Mapreduce"
	echo "********************************"
}

function len_of_string
{
	echo "${#string}"
}

function del_hadoop_str
{
	echo "${string//Hadoop/}"
}

function rep_hadoop_first
{
	echo "${string/Hadoop/Mapreduce}"
}

function rep_hadoop_all
{
	echo "${string//Hadoop/Mapreduce}"
}


while true
do
	echo "[string=$string]"
	echo
	print_tips
	read -p "Pls input your choice(1,2,3,4,q,Q): " chioce

	case $chioce in
		1)
			len_of_string
			;;
		2)
			del_hadoop_str
			;;
		3)
			rep_hadoop_first
			;;
		4)
			rep_hadoop_all
			;;
		q|Q)
			echo "Bye"
			exit
			;;
		*)
			echo "Error, input only in {1,2,3,4,,q,Q}"
			;;
		esac
done

```

### 命令替换

![tihuan](/Users/apple/github_clone/DesignModelNotes/image/WX20230911-140714.png)

### bc函数

```shell
➜  shell whereis bc
bc: /usr/bin/bc /usr/share/man/man1/bc.1
➜  shell echo "23+35" | bc
58
```



## 函数的高级用法

### function

- 函数的定义
  - function{}
- 函数的使用
  - 直接调用函数，将函数看成一条shll 命令

 ````shell
 ➜  shell function greeting
 { echo "hello zhang"}
 ````

```shell
➜  shell function greeting
{ echo "hello $1"}
➜  shell greeting lisi
hello lisi

```

```shell
function calcu
{
	case $2 in
		+)
			((a=$1+$3))
			echo "$1+$3=$a"
			;;
		-)
			((a=$1-$3))
			echo "$1-$3=$a"
			;;
		x)
			((a=$1*$3))
			echo "$1x$3=$a"
			;;
		/)
			((a=$1/$3))
			echo "$1/$3=$a"
			;;
	esac

}


echo $1 $2 $3
calcu $1 $2 $3
```



### 文件返回值

- 方法1:	return

- 方法2：echo

- ```shell
  ➜  shell cat /etc/passwd | cut -d: -f1
  ```

### 局部变量和全局变量

- 不做特殊声明，shell中全是全局变量
- 定义变量时，使用**local** 关键字
- 函数内部变量和外部变量，内部变量会覆盖外部变量

### 定义函数库

- 经常使用的代码封装成函数库
- 一般不直接执行，而是有其他函数调用

```shell
	
```



## 文件查找命令高级用法

### find 【路径】 【选项】【操作】

【选项】：

-name 文件名称

-iname 忽略大小写

-perm   权限

-prune    排除

-user

-group

-mtime -n | +n 根据文件更改时间查找

-nogroup

-nouser

-newer file1 ！file2

-type

- f 文件
- d 目录
- c 字符设备文件
- b 块设备文件
- l 链接文件
- p 管道文件

-size -n +n

-mindepth n

-maxdepth



```shell
find ./ -name 'kafka.sh' -exec cat {} \;
```



## 文本处理 grep 、sed、awk

### grep 和 egrep

```shell
	## 第一种形式
	grep [option] [pattern] [file1,file2]
	
	
	## 第二种形式
	command | grep [option] [pattern]
	
	
	-v # 不限时匹配行信息
	-i # 搜索时忽略大小写
	-n # 显示行号
	-r # 递归搜索
	-E # 支持扩展正则表达式
	-F # 不按正则表达式匹配，按照字符串字面意思匹配
	-c # 指数出匹配行数名不限时具体内容
	-w # 匹配整词
	-x # 匹配整行
	-l # 只列出匹配的文件名，不限时具体匹配行内容
	
	
```

### sed 流编译器

```shell
## 第一种形式
	stdout | sed [option] "pattern command"
	
## 第二种形式
	sed [option] "pattern command" file
	
	
```



### awk 报告生成器





























