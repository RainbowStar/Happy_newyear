# Shell环境zsh+zsh--OhMyZsh和Powerline

- zsh:shell环境
- OhMyZsh:zsh插件
- Powerline:字体，不然可能会有乱码
- [参考教程](https://www.jianshu.com/p/2c9cc1eb2548)

#### zsh安装

```
安装：sudo apt-get install zsh

设置：chsh -s /bin/zsh(注意不要使用sudo)

检验：sudo echo $SHELL
```

#### [OhMyZsh](https://www.jianshu.com/p/2c9cc1eb2548)

```
安装：sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

安装完后可以安装插件，配置主题：vim ~/.zshrc
```



- autojump:瞬移神器 `j +关键词`

  安装教程：

  - sudo apt-get install autojump

  - vim .zshrc 加上`. /usr/share/autojump/autojump.sh`
  - source ~/.zshrc重新编译zsh

  ```
  例子：
  当前在 /home/danale
  j zhou
  就会跳转到含有我的名字：zhouxingyu的文件夹
  ```

- zsh-autosuggestion：提示之前使用过的命令，使用越多越智能

  ```
  安装：
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # 打开 zsh 配置文件
  vim ~/.zshrc
  
  # 把插件名称加入插件列表
  plugins=(zsh-autosuggestions)
  ```

- zsh-syntax-highlighting：命令语法高亮

  ```
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 
  echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
  ```

- 配置主题：vim ~/.zshrc 找到`ZSH_THEME='' `

#### PowerLine

```
git clone http://github.com/powerline/fonts
(包含很多可用字体，安装过程慢，请找到网速好的地方)
安装完成后，为该目录加个权限：chmod 755 fonts
直接fc-cache -fv fonts

安装完后要去选择字体
放大终端---->左上角点击终端，配置文件首选项--->找到自定义字体，选择带powerline的
```



- 题外话(未验证)：powerline在很多地方都有应用，像是zsh,vim,tmux,是非常有逼格的状态栏。
  ————powerline在zsh中的简单应用：
  - 在.zshrc中加入
    . /usr/local/lib/oython3.5/dist-packages/powerline/bindlinds/zsh/powerline.zsh
    ————powerline在vim中简单应用:
    - 在.vimrc中加入
      set rpt+=/usr/local/lib/python3.5/dist-packages/powerline/bindlings/vim/
      set laststatus=2 "总是显示状态行(2)
      set t_Co=256
      (set rpt后的地址根据pip show powerline-status得到的Location项内容知)
    - 在tmux中的简单应用
      在tmux的配置文件.tmux.conf中，加入
      source '/usr/local/lib/python3.5/dist-packages/powerline/bindings/tmux/powerline.conf'