# ADB

> 进入platform-tools

- shift+右键在此处打开powershell
- ADB常用命令

```
Adb命令：
 
l  刷机命令
查看连接状态      ：adb device
重启命令              ：adb reboot
重启到Rec          ：adb reboot recovery
重启到Fastboot  ：adb reboot bootloader
推送ROM包       ：adb sideload <Rom包>
 
l  安装卸载
安装                     ：adb install <package>
卸载                     ：adb uninstall <package>
保留数据卸载      ：adb uninstall -k <package>
 
l  复制文件
复制设备到电脑   ：adb pull <设备文件路径> <电脑目录> 例如：adb pull /sdcard/1.txt E:\
复制电脑到设备   ：abd pull <电脑文件路径> <设备目录> 例如：adb pull E:\1.txt /sdcard/
 
l  查看手机信息
查看设备型号      ：adb shell getprop ro.product.model
获取IMEI             ：adb shell [回车] su [回车] service call iphonesubinfo 1
获取手机程序包名：adb shell pm list packages
获取序列号          ：adb get-serialno
```



- fastboot常用命令

```
adb reboot bootloader——将手机重启到Fastboot模式
fastboot devices——查看Fastboot模式下连接的手机
fastboot flash system system.img
fastboot flash boot boot.img
fastboot flash radio radio.img
fastboot reboot——Fastboot模式下重启手机
fastboot erase system
fastboot erase boot
fastboot  flashing  unlock    # 设备解锁，开始刷机
fastboot  flash  boot  boot.img    # 刷入 boot 分区。如果修改了 kernel 代码，则应该刷入此分区以生效
fastboot  flash  recovery  recovery.img    # 刷入 recovery 分区
fastboot  flash  country  country.img    # 刷入 country 分区。这个分区是开发组自己划分的，别的 Android 设备上不一定有
fastboot  flash  system  system.img    # 刷入 system 分区。如果修改的代码会影响 out/system/ 路径下生成的文件，则应该刷入此分区以生效 
fastboot  flash  bootloader  bootloader    # 刷入 bootloader
fastboot  erase  frp    # 擦除 frp 分区，frp 即 Factory Reset Protection，用于防止用户信息在手机丢失后外泄
fastboot  format  data    # 格式化 data 分区
fastboot  flashing lock    # 设备上锁，刷机完毕
fastboot  continue    # 自动重启设备

u  Fastboot命令：
注：以下命令均有可能造成手机变砖，谨慎使用。
查看连接状态：fastboot devices
解锁：fastboot flashing unlock或fastboot oem unlock
上锁：fastboot flashing lock或fastboot oem lock
重启：fastboot reboot
重启到Fastboot：fastboot reboot-bootloader
清除分区数据：fastboot erase <boot/system/data/cache/userdata/recovery>
清除分区(四清)：fastboot erase system -w
格式化分区数据：fastboot format <boot/system/data/cache/userdata/recovery>
烧写分区：fastboot flash < boot/system /recovery/radio/bootloader/ splash1/> <*.img>
```

