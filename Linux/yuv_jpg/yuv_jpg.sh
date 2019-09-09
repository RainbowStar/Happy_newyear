# name:yuv转换jpg脚本
#使用ffmpeg将.yuv图片转换成.jpg 
# auther:star
# time:20190814
#!/bin/bash

yuvfile=".yuv$"
i=1
file_num=$(ls -l|grep "yuv$"|wc -l)
for file in *.yuv #查找当前目录下所有文件/目录
do
if [ -d "$file" ] #directory
then
echo "$file is directory"

elif [ -f "$file" ] #file
then
    printf "filenum %d / %d : \t" $((i++)) $file_num
    echo $file
    \ffmpeg -loglevel quiet -y -s 640x360 -i $file ${file%.*}.jpg < /dev/null
    rm -f $file
fi

done
