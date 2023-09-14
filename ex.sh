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








