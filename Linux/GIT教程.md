# GIT教程

#### [初步上手](<https://blog.csdn.net/huangqqdy/article/details/83032408>)：将设备与github建立连接

```
1.注册账号&下载软件：省略
2.配置环境：
# 配置用户名
git config --global user.name "username" //一定是github上？？？？
# 配置邮箱
git config --global user.email "username@email.com"     //("username@email.com"注册账号时用的邮箱)
#生成SSH
ssh-keygen -t rsa //连续三次回车，如何在ssh目录找到id_rsa.pub,打开复制内容到github账号的ssh配置页面粘贴
#测试是否连接成功
ssh -T git@github.com //提示：Hi,XXX,You've successfully.......
```

[最简使用教程](<https://www.bootcss.com/p/git-guide/>)：已经安装好了，如何使用

```
1.获取仓库：git clone https...
2.本地操作|添加追踪文件：git add filename、git add *(使用这个注意编辑.gitigonre)
3.本地操作|确认更改：git commit -m "代码提交信息"
4.云端交互|推送本地文件：git push origin master
5.云端交互|获取云端最新文件：git pull
```

- git设置快捷

```
1.git config --global alias.st status
 git config --global alias.cm 'commit -m'
2.vim ~/.gitconfig
[alias]
st = status
pl = pull
ps = push
a = add
br = branch
cm = commit -m

```

- git重命名和删除

```
1.rename
git mv -f oldfolder newfolder
git add -u newfolder (-u选项会更新已经追踪的文件和文件夹)
git commit -m "changed the foldername whaddup"
2.delete
git rm
```

- git 忽略不需要跟踪的文件：编辑.gitigonre