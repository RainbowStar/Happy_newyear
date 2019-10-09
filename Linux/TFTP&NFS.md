## TFTP

```
sudo apt-get install tftpd-hpa
sudo service tftpd-hpa start
sudo service tftpd-hpa stop
sudo service tftpd-hpa restart

sudo vi /etc/default/tftpd-hpa   //配置文件
TFTP_USERNAME="tftp"			//tftp服务的用户名	
TFTP_DIRECTORY="/home/danale/tftp" //文件只能在该目录中下载,可以用默认的，也可以创建自己的！
TFTP_ADDRESS="0.0.0.0:69" 	  // tftp服务器的地址和端口
TFTP_OPTIONS="-l -c -s" 		//tftp服务的选项,不用管照抄
```

开发板使用：

```
tftp -g -r filename tftp_server_addr //下载
tftp -p -l filename tftp_server_addr //上传
```



-g get 获取文件
-r 递归
-p put 发送文件
-l local 本地的

## NFS

```
sudo apt-get install nfs-kernel-server//服务端
sudo apt install nfs-common //客户端
sudo service nfs-kernel-server start
// 启动这些服务均可使用：service + 服务(tab)可以补全

sudo vim /etc/exports
/home/danale/nfs *(rw,sync,no_root_squash) //记得创建文件夹或者用默认的
//* 代表所有IP均可访问
```

配置好开发板和ubuntu的IP，hi开发板使用：
mount -o nolock,tcp ip:/home/danale/nfs /mnt

# SAMBA

```
(1)更新当前软件。
sudo apt-get upgrade 
sudo apt-get update 
sudo apt-get dist-upgrade
(update：当执行apt-get update时，update重点更新的是来自软件源的软件包的索引记录（即index files）。
upgrade：当执行apt-get upgrade时，upgrade是根据update更新的索引记录来下载并更新软件包。
dist-upgrade:当执行apt-get dist-upgrade时，除了拥有upgrade的全部功能外，dist-upgrade会比upgrade更智能地处理需要更新的软件包的依赖关系。
从上述可以看出，在执行apt-get upgrade和apt-get dist-upgrade之前应该先执行apt-get update。)
(2)安装samba服务器。
sudo apt-get install samba samba-common

(3)创建一个用于分享的samba目录。
sudo mkdir ~/samba

(4)给创建的这个目录设置权限
sudo chmod 777 ~/samba

(5)添加用户(下面的ranfei 是我的用户名，之后会需要设置samba的密码)。
sudo smbpasswd -a danale
(6)配置samba的配置文件。
sudo vim /etc/samba/smb.conf
在配置文件smb.conf的最后添加下面的内容：
没有特别需求别动global不然可能会启动samba失败
1.让所有人都可以访问读写的配置
[AllSamba]
path = /共享文件路径
available = yes
browseable = yes
writable = yes
public = yes #重要，未开启的话无法访问

[UserSamba]#win上可以看到的共享文件名
comment = share folder #注释，可有可无
security = user #没搞清楚。这个参数有用？默认是什么？
valid users = danale # 可以访问的用户，开启此项后相当于开启了security = user？
browseable = yes 
path = ~/samba
#create mask = 0700 #权限
#directory mask = 0700
valid users = danale #用户名，必须是系统用户
public = yes
available = yes
writable = yes
#force user = linuxidc
#force group = linuxidc

(7)windows添加盘符
win+r \\服务器IP
登陆
右键：映射网络驱动器
(8)相关命令
查看用户 sudo pdbedit -L
重启服务 sudo service smbd restart
清除win连接：net use * /del
smbpasswd -a 添加用户（要添加的用户必须是系统用户）
smbpasswd -d 冻结用户（限制该用户访问共享文件）
smbpasswd -e 恢复用户（解冻用户）
smbpasswd -n 把用户的密码设置成空（要在global中写入 null passwords -true）
smbpasswd -x 删除用户（将该用户从smb组中排除）
```





# OPENWRT挂载U盘

```
opkg update
opkg install kmod-usb-core
opkg install kmod-usb2                #安装usb2.0
opkg install kmod-usb-ohci            #安装usb ohci控制器驱动
opkg install kmod-usb-storage         #安装usb存储设备驱动
opkg install kmod-fs-ext4             #安装ext4分区格式支持组件 还是ext4格式的U盘读取快
opkg install kmod-fs-vfat             #挂载FAT
opkg install ntfs-3g                  #挂载NTFS
opkg install mount-utils              #挂载卸载工具
opkg install block-mount

opkg install fdisk 
```



