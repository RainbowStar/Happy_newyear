#Author:star
#Time:2019-08-26
#说   明：yuv2jpg.sh
#1.转换YUV为JPG
#根据call.rect将stage1:T&stage2:F放入stage1，
#根据call.rect将stage1:T&stage2:T放入stage2
#2.转换后的yuv文件放入子文件夹/stage1/yuv、/stage2/yuv
#3.call.rect记录结构：对call.rect进行结构优化和stage1和stage2提取生成新的
#call_stage1_verison.rect：记录stage1:T&stage2:F(先写入文件再转换)
#call_stage2_version.rect：记录stage1:T&stage2:T(先写入文件再转换)
#call_stage1_verison.rect&call_stage2_version.rect每个图片记录增加版本信息
#版   本：V0.1
#修改记录：(从高到底排序)
#V0.1
# ffmpeg cmd must add '< /dev/null'
#!/bin/bash

stage1_jpg=stage1
stage2_jpg=stage2
list_file=CALL.rect
version="1.0.0.17"
if [ ! -e "./$stage1_jpg"  ];then
    \mkdir ./$stage1_jpg
else
    \rm ./$stage1_jpg/*
fi
if [ ! -e "./$stage2_jpg"  ];then
    \mkdir ./$stage2_jpg
else
    \rm ./$stage2_jpg/*
fi

line_num=$(\wc -l < $list_file)

i=1
cat $list_file | while read line
do
    # echo $line
    printf "line %d / %d : \t" $((i++)) $line_num
    #      CALL-n.yuv timestamp:nnn... stage1:T... stage2:F...
    if [[ $line =~ ([^ ]+)\ ([^ ]+)\ (stage1[^ ]+)(\ (stage2[^ ]+))* ]]; then
        yuv_file=${BASH_REMATCH[1]}
        timestamp=${BASH_REMATCH[2]}
        stage1=${BASH_REMATCH[3]}
        stage2=${BASH_REMATCH[4]}
        if [ -f "$yuv_file" ] #file
        then
            if [[ $stage1 =~ 'stage1:T' && $stage2 =~ 'stage2:F' ]]; then
                echo "stage1"
                \ffmpeg -loglevel quiet -y -s 640x360 -i $yuv_file ./${stage1_jpg}/${yuv_file%.*}$version.jpg < /dev/null
		cp $yuv_file ./stage1/yuv
		#写入记录新文件call_stage1_version.rect
		echo $line >> call_stage1_version..rect
            elif [[ $stage1 =~ 'stage1:T' && $stage2 =~ 'stage2:T' ]]; then
                echo "stage1 & stage2"
                \ffmpeg -loglevel quiet -y -s 640x360 -i $yuv_file ./${stage2_jpg}/${yuv_file%.*}$version.jpg < /dev/null
		cp $yuv_file ./stage2/yuv
		#写入记录新文件call_stage1_version.rect
		echo $line >> call_stage1_version,rect
            else
                echo ""
            fi
            \rm -f $yuv_file
        fi
    else
        echo "$yuv_file not exist"
    fi
done

echo "finished!"
