# echo

- 语句没有引号可以不带引号

- -n 在同一行输出

- 引用变量 $

  ```
  value1=10
  value2=$value1
  echo The resulting value is $value2
  ```

  

- 引用自带的命令

  ```
  #!/bin/bash
  testing=$(date)
  echo "The date and time are: " $testing
  ```

  

- 命令输出到文件

  ```
  date > test6  //再执行一次 > 会覆盖文件
  >> //用来追加
  ```

- 文件输出到命令 
- 一个命令的输出到一个命令的输入

- 判断语句

  ```
  #!/bin/bash
  # testing the if statement
  if pwd
  then
  echo "It worked"
  fi
  ```

  