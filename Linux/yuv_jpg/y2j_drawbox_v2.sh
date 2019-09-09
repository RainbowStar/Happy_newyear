#!/bin/bash
#Author:star
#Time:2019-09-09
#说   明：yuv2jpg_drawbox.sh
#1.转换YUV为JPG并画框
#根据call.rect将stage1:T&stage2:F放入stage1，
#根据call.rect将stage1:T&stage2:T放入stage2
#2.转换后的yuv文件放入子文件夹./stage1/yuv、./stage2/yuv
#3.call.rect中转换后的图片记录保存到相应文件中
#call_stage1_verison.rect：记录stage1:T&stage2:F
#call_stage2_version.rect：记录stage1:T&stage2:T
#版   本：V0.2
#修改记录：(从高到底排序)
# ffmpeg cmd must add '< /dev/null'
#CALL-1.yuv width:640 height:360 timestamp:1567751675 stage0:facelandmark:T-[(0.488550,0.316801),(0.769073,0.000000),(0.557250,0.000000),(0.000000,0.774798),(0.000000,0.763348),0.034350,0.034350,-0.068700]-facearearatio:0.028472-distance:[0.500000,1.000000] stage1:F-0.000000-upperbody[(164,0),(404,0),(404,176),(164,176)]-gesture[(0,0),(0,0),(0,0),(0,0)] stage2:F-0.000000-gestureex[(0,0),(0,0),(0,0),(0,0)]-gesture[(0,0),(0,0),(0,0),(0,0)] stage3:F-score[0.000000, 0.000000]
version="v2"
list_file=CALL.rect
res=640x360

loglevel=quiet # quiet or info

# file lists
stage1_rect=call_stage1_${version}.rect
stage2_rect=call_stage2_${version}.rect
filename="$stage1_rect $stage2_rect"

# storage directory
stage1=stage1
stage2=stage2
stage1_yuv=./${stage1}/yuv
stage2_yuv=./${stage2}/yuv
dirname="$stage1 $stage2 $stage1_yuv $stage2_yuv"

for i in $dirname
do
  if [ ! -e "./$i" ]; then
      \mkdir -p ./$i
  else
      \rm -r ./$i/*
  fi
done

#for i in $filename
#do
#  if [ -e "./$i" ]; then
#      \rm ./$i
#  fi
#done

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

#### start prcessing ####
cecho g "======================="

line_num=$(\wc -l < $list_file)
i=1

cat $list_file | while read line
do
    # echo $line
    printf "line %d / %d : \t" $((i++)) $line_num

    #      CALL-n.yuv timestamp:nnn... stage1:T... stage2:F...
    if [[ $line =~ ([^ ]+).+?(stage1[^ ]+)\ (stage2[^ ]+)* ]]; then
        yuv_file=${BASH_REMATCH[1]}; stage1_b=${BASH_REMATCH[2]}; stage2_b=${BASH_REMATCH[3]};

        if [ -f "$yuv_file" ] #file
        then
            # stage1:T-0.404722-upperbody[(188,70),(422,70),(422,332),(188,332)]-gesture[(326,184),(388,184),(388,240),(326,240)] stage2:T-1.34...
#            if [[ $stage1_b =~ stage1:T-.+-upperbody\[\((\d+),(\d+)\),\(.+?\),\((\d+),(\d+)\),\(.+?\)\]-gesture\[\((\d+),(\d+)\),\(.+?\),\((\d+),(\d+)\),\(.+?\)\] ]];

            if [[ $stage1_b =~ stage1:T-.+-upperbody\[\(([0-9]+),([0-9]+)\),\(.+?\),\(([0-9]+),([0-9]+)\),\(.+?\)\]-gesture\[\(([0-9]+),([0-9]+)\),\(.+?\),\(([0-9]+),([0-9]+)\),\(.+?\)\] ]];
            then
                # echo ${BASH_REMATCH[1]} ${BASH_REMATCH[2]} ${BASH_REMATCH[3]} ${BASH_REMATCH[4]} 
                body_llx=${BASH_REMATCH[1]}; body_lly=${BASH_REMATCH[2]}; body_urx=${BASH_REMATCH[3]}; body_ury=${BASH_REMATCH[4]};
                gest_llx=${BASH_REMATCH[5]}; gest_lly=${BASH_REMATCH[6]}; gest_urx=${BASH_REMATCH[7]}; gest_ury=${BASH_REMATCH[8]};

                # stage2:T-1.349073-gestureex[(294,152),(418,152),(418,268),(294,268)]-gesture[(324,188),(386,188),(386,244),(324,244)]
                if [[ $stage2_b =~ stage2:T-.+-gestureex\[\(([0-9]+),([0-9]+)\),\(.+?\),\(([0-9]+),([0-9]+)\),\(.+?\)\]-gesture\[\(([0-9]+),([0-9]+)\),\(.+?\),\(([0-9]+),([0-9]+)\),\(.+?\)\] ]];
                then
                    cecho r "stage1 & stage2"
                    #写入记录新文件call_stage2_version.rect
                    echo $line >> ./stage2/$stage2_rect
                    \cp $yuv_file ./$stage2_yuv
                    jpg_dir=$stage2

                    # echo ${BASH_REMATCH[1]} ${BASH_REMATCH[2]} ${BASH_REMATCH[3]} ${BASH_REMATCH[4]} 
                    body2_llx=${BASH_REMATCH[1]}; body2_lly=${BASH_REMATCH[2]}; body2_urx=${BASH_REMATCH[3]}; body2_ury=${BASH_REMATCH[4]};
                    gest2_llx=${BASH_REMATCH[5]}; gest2_lly=${BASH_REMATCH[6]}; gest2_urx=${BASH_REMATCH[7]}; gest2_ury=${BASH_REMATCH[8]};
                    \ffmpeg -loglevel $loglevel -y -s $res -i $yuv_file \
                            -vf "drawbox=x=$body_llx:y=$body_lly:w=$body_urx-$body_llx:h=$body_ury-$body_lly:t=1:color=green@0.9,\
                                 drawbox=x=$gest_llx:y=$gest_lly:w=$gest_urx-$gest_llx:h=$gest_ury-$gest_lly:t=1:color=red@0.9,\
                                 drawbox=x=$body2_llx:y=$body2_lly:w=$body_urx-$body2_llx:h=$body2_ury-$body2_lly:t=1:color=blue@0.9,\
                                 drawbox=x=$gest2_llx:y=$gest2_lly:w=$gest_urx-$gest2_llx:h=$gest2_ury-$gest2_lly:t=1:color=yellow@0.9" \
                            ./${jpg_dir}/${yuv_file%.*}_${version}.jpg < /dev/null
                else # stage1
                    cecho y "stage1"
                    #写入记录新文件call_stage1_version.rect
                    echo $line >> ./stage1/$stage1_rect
                    \cp $yuv_file ./$stage1_yuv
                    jpg_dir=$stage1
                    \ffmpeg -loglevel $loglevel -y -s $res -i $yuv_file \
                            -vf "drawbox=x=$body_llx:y=$body_lly:w=$body_urx-$body_llx:h=$body_ury-$body_lly:t=1:color=green@0.9,\
                                 drawbox=x=$gest_llx:y=$gest_lly:w=$gest_urx-$gest_llx:h=$gest_ury-$gest_lly:t=1:color=red@0.9" \
                            ./${jpg_dir}/${yuv_file%.*}_${version}.jpg < /dev/null
                fi
            else
                echo ""
            fi
            \rm -f $yuv_file
        else
            cecho r "$yuv_file not exist"
        fi
    else
        cecho r "line format not match"
    fi
done

cecho g "======================="
cecho g "$0 finished!\n"
