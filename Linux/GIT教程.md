# GIT教程

> 1.与github进行第一次“对话”
>
> 2.传输文件到github
>
> 3.管理：回退、对比、撤销

#### [初步上手](<https://blog.csdn.net/huangqqdy/article/details/83032408>)：与github进行第一次“对话”

```
1.注册账号&下载软件：省略
2.配置环境：
# 配置用户名
git config --global user.name "username" //一定是github上？？？？
# 配置邮箱
git config --global user.email "username@email.com"     //("username@email.com"注册账号时用的邮箱)
#生成SSH
ssh-keygen -t rsa //连续三次回车，在ssh目录找到id_rsa.pub,打开复制内容到github账号的ssh配置页面粘贴(找不到ssh目录就多找找。。。)
#测试是否连接成功
ssh -T git@github.com //提示：Hi,XXX,You've successfully.......
```

#### [最简使用教程](<https://www.bootcss.com/p/git-guide/>)：传输文件到github

```
1.获取远程仓库：git clone https...
2.本地操作|添加追踪文件：git add filename、git add *(使用这个注意编辑.gitigonre，不写代码暂时不用编辑gitigonre)
3.本地操作|确认更改：git commit -m "代码提交信息"
4.云端交互|推送本地文件：git push origin master
5.云端交互|获取云端最新文件：git pull
```

#### 本地管理：文件均未推送到云端的管理

> 1.本地管理主要就是工作区、缓存区(git add后)、版本库(git commit后的)

- 回退：根据commit之后产生commit_id回退？？？？是整个回退还是？

```
1.git允许我们在版本的历史之间穿梭，使用命令git reset --hard commit_id。
2.穿梭前，用git log可以查看提交历史，以便确定要回退到哪个版本,获取commit_id
3.要重返未来，用git reflog查看命令历史，以便确定要回到未来的哪个版本。
```

- 查看工作区与版本库的区别

```
用git diff HEAD -- filename命令可以查看工作区和版本库里面最新版本的区别
```

- 撤销修改

```
git checkout -- readme.txt
让这个文件回到最近一次git commit或git add时的状态。
1.回到最近git commit的状态：readme.txt自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态
2.回到最近git add的状态:readme.txt已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。
git reset HEAD readme.txt
git reset命令既可以回退版本，也可以把暂存区的修改回退到工作区
1.撤销以及git add的文件，先使用git reset然后使用git checkout
```

- 删除和重命名

```
1.rename
git mv -f oldfolder newfolder
git add -u newfolder (-u选项会更新已经追踪的文件和文件夹)
git commit -m "changed the foldername whaddup"
2.delete
git rm
```

#### 远程管理

> 1.克隆
>
> 2.本地与远程建立连接(本地有仓库，与云端的仓库连接)
>
> 3.克隆(云端已经有仓库，克隆到本地推荐)
>
> 注意：建立连接与克隆都是第一次初始化相关的操作，推荐克隆。除非环境没有网络，首先在本地完成了git仓库的初始化，这时可以使用建立连接的操作。

```
通用命令：
1.git push origin master
2.git pull //获取最新仓库文件，默认跟踪的服务器和分支来拉取
克隆
git clone
本地与云端建立连接
1.本地已经使用git init建立了版本库
2.云端已经建立好仓库(本地和云端的名字要一致)
3.git remote add origin github链接 //origin是自定义的远程厂库的名字，下次推送的时候要用到
4.git push -u origin master 第一次推送master分支的所有内容
```

#### 分支管理：进行隔离开发(暂时不做深入研究)

- 查、删、创、切、合

```
查看分支：git branch

创建分支：git branch <name>

切换分支：git checkout <name>

创建+切换分支：git checkout -b <name>

合并某分支到当前分支：git merge <name>

删除分支：git branch -d <name>
```

#### 效率提升

- git设置快捷

```
1.git config --global alias.st status //global是针对当前用户，如果不加，只针对当前仓库
 git config --global alias.cm 'commit -m'
2.vim ~/.gitconfig //.gitconfig为当前用户的配置文件。当前仓库的配置文件为.git/config
[alias]
st = status
pl = pull
ps = push
a = add
br = branch
cm = commit -m

```

- git 忽略不需要跟踪的文件：编辑.gitignore

```
# 收集中。。。。
# Windows:
Thumbs.db
ehthumbs.db
Desktop.ini
# Python:
*.py[cod]
*.so
*.egg
*.egg-info
dist
build


```

