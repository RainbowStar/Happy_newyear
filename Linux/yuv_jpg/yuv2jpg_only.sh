# name:yuv转换jpg脚本
#使用ffmpeg将.yuv图片转换成.jpg 
# auther:star
# time:20190814
#!/bin/bash

yuvfile=".yuv$"
for file in *.yuv #查找当前目录下所有文件/目录
do
if [ -d "$file" ] #directory
then

echo "$file is directory"

elif [ -f "$file" ] #file
then

if  [[  $file =~ $yuvfile ]] #包含yuv的所有文件，判断的不严格
then
echo $file
\ffmpeg -loglevel quiet -y -s 640x360 -i $file ${file%.*}.jpg < /dev/null
rm -f $file
fi

fi

done
