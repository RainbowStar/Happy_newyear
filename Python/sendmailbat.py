import yagmail
import os,sys

#链接邮件服务器
yag = yagmail.SMTP(user="zhouxingyu@semptian.com",password="Qx6X3fi4NCNazkgh",host='smtp.exmail.qq.com',encoding='GBK')

ztetomail = ['zhu.chenjie@zte.com.cn']
zteccmail = ['huang.wenjun@zte.com.cn', 'zhangwanjia@semptian.com']
tomail = ['310256030@qq.com']
ccmail = ['superzhou121318@126.com']
rawdir = r'C:\\Users\\Administrator\\Desktop\\tempmail\\'
# mail payload
rawcontent = "51\n\n周星宇\nhttp://www.semptian.com\nzhouxingyu@semptian.com\nMobile：17373414640\n深圳总部：深圳市南山区西丽社区万科云城1A座19层\n北京公司：北京市海淀区北二街8号中关村SOHO-1008室\n武汉公司：武汉市东湖新技术开发区光谷大道77号金融港B18座104室\n\n本电子邮件包含的信息可能是保密内容并受到法律保护，请不要公开。如果你本不该收到、但已经收到本邮件，请立即回复我们，同时删除本邮件，不保留或者扩散本邮件。"
# mail title
TitleContent = 'FC7000T软件版本修复漏洞20220324_'
FileNum = 2
for file in os.listdir(rawdir):
    filename = rawdir +  file
    contentnum = str(FileNum) + '/' + rawcontent
    title = TitleContent  + str(FileNum)
# mail send file
    FileNum = FileNum + 1
    # print(filename,title,contentnum)
    yag.send(to=ztetomail,
             subject=title,
             contents=contentnum,
             attachments=filename)
    # test
    # yag.send(to=tomail,
    #          subject=title,
    #          contents=contentnum,
    #          attachments=filename,
    #          cc=ccmail)
    print('send '+ file +' success')
yag.close()
