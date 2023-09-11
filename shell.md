# shell 

## 变量的高级用法

- ### 变量替换

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



- ### 字符串处理

  ```
  ## 计算字符串长度
  ➜  shell echo $var01
  hello word,hello shell
  ➜  shell echo ${#var01}
  22
  
  ```

  

  ![WX20230911-110822](/Users/apple/github_clone/DesignModelNotes/image/WX20230911-110822.png)

- ### 抽取子串

- ```
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

- 

## 函数的高级用法

## 文件查找命令高级用法

## 文本处理 grep 、sed、awk

