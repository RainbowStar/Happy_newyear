#Author:star
#Time:2019-09-03
#说   明：jpg_tag.py
#1.为jpg图片添加人形、手势画框，方便分辨
#读取call.rect将提取stage1和stage2后的第一位和第三位坐标，只提取数字
#将图片放到drawbox文件夹
#版   本：V0.1
#修改记录：(从高到底排序)
#V0.1
import cv2
import os
import re
#LocalDir = os.getcwd()
#自动切换目录
#Home = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))#获取上级目录,删除一个os.path.dirname就是当前目录
#路径问题，window能跑，让linux也能跑 使用os.path.join() 只会根据系统环境自动转换斜杠
HomePath = os.path.join(os.path.abspath(os.path.dirname(__file__)))
DrawBoxPath = os.path.join(HomePath + '\\Drawbox')
print(DrawBoxPath)
print(os.path.isabs(DrawBoxPath)) #判断是否为绝对路径
CallRect = os.path.join(HomePath + '\\call_stage2_v1.txt')
#os.makedirs(DrawBoxPath)
print('creat dir succes')
#os.chdir(Work)
#print(os.getcwd())
'''
home = os.path.join('C:\\Users\\31025\\Desktop\\pthon_learn\\stage2\\')
dealpath = os.path.join('C:\\Users\\31025\\Desktop\\pthon_learn\\stage2\\deal\\')
Call_rect = os.path.join('C:\\Users\\31025\\Desktop\\pthon_learn\\stage2\\call_stage2_v1.txt')
'''
#判断目录存在问题，
#IsExists = os.path.exists(home+'deall')
#if  not IsExists:
#     os.makedirs(home+"deal")
#     print('creat dir succes')

# CALL-14.yuv width:640 height:360 timestamp:1567132189 stage1:T-0.352836-upperbody[(186,14),(414,14),(414,314),(186,314)]-gesture[(214,106),(276,106),(276,160),(214,160)] (这里有空格)
# stage2:T-1.411346-gestureex[(182,74),(306,74),(306,186),(182,186)]-gesture[(224,104),(270,104),(270,162),(224,162)]
line_regex = re.compile(r'''(
(CALL-\d+).+? 
stage1.+?\[\((\d+),(\d+)\),\(.+?\),\((\d+),(\d+)\),\(.+?\).+?
stage2.+?\[\((\d+),(\d+)\),\(.+?\),\((\d+),(\d+)\),\(.+?\))''',re.VERBOSE)
#for line in open('C:\\Users\\31025\\Desktop\\pthon_learn\\stage2\\call_stage2_v1.txt'):
for line in open(CallRect):
    match = line_regex.search(line)
    file = match.group(2)+'_v1.jpg'
    print(match.group(2))
    stage1_x0 = match.group(3)
    stage1_y0 = match.group(4)
    stage1_x1 = match.group(5)
    stage1_y1 = match.group(6)
    stage2_x0 = match.group(7)
    stage2_y0 = match.group(8)
    stage2_x1 = match.group(9)
    stage2_y1 = match.group(10)
    imgpath = os.path.join(HomePath + '\\'+file)

    img = cv2.imread(imgpath)
    # print(img.shape)
    cv2.rectangle(img, (int(stage1_x0),int(stage1_y0)), (int(stage1_x1),int(stage1_y1)), (0, 255, 0), 2)
    cv2.rectangle(img, (int(stage2_x0), int(stage2_y0)), (int(stage2_x1), int(stage2_y1)), (0, 0, 255), 2)
    # cv2.rectangle(img,(172,72),(304,198),(0,0,255),2)
    # cv2.imshow("Image", img)
    # cv2.waitKey (0)
    # cv2.destroyAllWindows()
    cv2.imwrite(os.path.join(DrawBoxPath + '\\'+file), img)
    print("success")

