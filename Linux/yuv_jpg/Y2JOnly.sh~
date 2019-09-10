#!/bin/bash
#Author:star
#Time:2019-09-09
#说明：Y2JOnly.sh
#1.将yuv文件转换为jpg，放入jpg文件夹，保存yuv原始文件
#版本：v0.1 将ffmpeg输出重定向到/dev/null
#使用方法：sh Y2JOnly.sh

cecho() {
  local code="\033["
  case "$1" in
    black  | bk) color="${code}0;30m";;
    red    |  r) color="${code}1;31m";;
    green  |  g) color="${code}1;32m";;
    yellow |  y) color="${code}1;33m";;
    blue   |  b) color="${code}1;34m";;
    purple |  p) color="${code}1;35m";;
    cyan   |  c) color="${code}1;36m";;
    gray   | gr) color="${code}0;37m";;
    *) local text="$1"
  esac
  [ -z "$text" ] && local text="$color$2${code}0m"
  echo -e "$text"
  }
yuvfile=".yuv$"
i=1
file_num=$(ls -l|grep "yuv$"|wc -l)
dir="jpg"
if [ ! -e "./$dir" ]; then
    \mkdir -p ./$dir
fi
for file in *.yuv #查找当前目录下所有文件/目录
do
if [ -d "$file" ] #directory
then
echo "$file is directory"

elif [ -f "$file" ] #file
then
    printf "filenum %d / %d : \t" $((i++)) $file_num
   cecho g $file
    \ffmpeg -loglevel quiet -y -s 640x360 -i $file ./$dir/${file%.*}.jpg < /dev/null
 #   rm -f $file
fi

done
cecho g "========================="
cecho g "$0 finished!\n"
