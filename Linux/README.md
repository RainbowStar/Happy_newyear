# 资料收集与整理
> 读书人的事......

- 代理：socks5： p.dana-tech.com 1080
         http&https: p.dana-tech.com 8118

- [Ubuntu截图](https://blog.csdn.net/xuqiang918/article/details/81193034?utm_source=blogxgwz5)

- [串口工具](https://www.cnblogs.com/mengfanrong/p/5090045.html)

     ```
     在自己的shell环境下设置别名大部分是：~/.bashrc
     alias pc='sudo picocom -b 115200 /dev/ttyUSB0'
     设置完成记得source ~/.bashrc
     ```

### Git

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

### Markdown

```
**这是加粗的文字**
*这是倾斜的文字*`
***这是斜体加粗的文字***
~~这是加删除线的文字~~

分割线：---
> 引用

链接：[]()
图片：![]()
单行代码： `代码内容`
代码块：
(```)
  代码...
  代码...
  代码...
(```)
表格：(typoras上很方便)
|a|b|c| 
跳转？：
1.跳转到当前文件夹的某个文件去
2.跳转到当前文件的摸个标题去，类似目录跳转

```



