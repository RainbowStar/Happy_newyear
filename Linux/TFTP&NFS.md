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