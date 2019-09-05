# python画框

```
import cv2
import os
import re
home = os.path.join('C:\\Users\\31025\\Desktop\\pthon_learn\\stage2\\')
#添加如果已经有此文件夹则不再创建
if not os.path.exists(home+'deall'):
    os.makedirs(home+"deal")
dealpath = os.path.join('C:\\Users\\31025\\Desktop\\pthon_learn\\stage2\\deal\\')

for line in os.listdir(home):#遍历文件
    # CALL-14.yuv width:640 height:360 timestamp:1567132189 stage1:T-0.352836-upperbody[(186,14),(414,14),(414,314),(186,314)]-gesture[(214,106),(276,106),(276,160),(214,160)] (这里有空格)
    # stage2:T-1.411346-gestureex[(182,74),(306,74),(306,186),(182,186)]-gesture[(224,104),(270,104),(270,162),(224,162)]
    line_regex = re.compile(r'([^ ]+)\ ([^ ]+)\ ([^ ]+)\ ([^ ]+)\ stage1:T.*upperbody\[\((\d{3}),(\d{1,3})\),[^\(]+,([^ ]')  # 匹配数字
    match = line_regex.search(line)
    stage1_y0 = match()
    stage1_x1 = match()
    stage1_y1 = match()
    stage2_x0 = match()
    stage2_y0 = match()
    stage2_x1 = match()
    stage2_y1 = match()

        imgpath = home + file
# imgpath = "C:/Users/31025/Desktop/pthon_learn/stage2/CALL-8_v1.jpg"
        img = cv2.imread(imgpath)
#print(img.shape)
        cv2.rectangle(img,(stage1_x0,stage1_y0),(428,246),(0,255,0),2)
        #stage2第一个坐标
        cv2.rectangle(img,(206,106),(272,168),(0,0,255),2)

        # cv2.rectangle(img,(172,72),(304,198),(0,0,255),2)
        #cv2.imshow("Image", img)
        #cv2.waitKey (0)
        #cv2.destroyAllWindows()
        cv2.imwrite(dealpath+file, img)
        print("success")
    else:
        print("error")
```

