# LINUX命令

- history

```
1.列出所有使用过的命令
2.!NumCom 惊叹号+命令数可以使得那条命令再次出现（可以删减编辑）\
3.history -c 清除历史记录
```

- ls

```
-a 所有文件，包括隐藏文件
-l 文件所有属性
-ld /filename  某个文件夹的权限
```

- 快速查看文件内容

```
cat -n filename显示小部分内容，-n带行号
more filename百分比显示已看内容，回车或者空格向下看
head -n num filename 查看从头开始的num行
tail -n num filename 查看最后的num行
```

- 快速替换文本内容：tr

```
 cat anaconda-ks.cfg | tr [a-z] [A-Z] 
```

- 显示文本行数、单词数、字节数

```
-l 显示行数
-w 单词
-c 字节数
```

- 查看文件的不同：diff

```
 diff --brief diff_A.txt diff_B.txt  查看两个文件是否不同
 diff -c diff_A.txt diff_B.txt 查看不同的地方
```

- 按照指定大小和个数的数据块复制和转化文件：dd

```
if 输入
of 输出
bs 每个块大小
count 复制块的个数
dd if=/dev/zero of=560_file count=1 bs=560M #/dev/zero 可以无限输入数据
```

- 压缩、解压缩：tar

```
-c 创
-x 解
-z Gzip
-j bzip2
-v 显示过程
-f 目标
常用：
tar -cz(j)vf 输出名称 输入名称
tar -xz(j)vf 输出名称 输入名称
```

- 过滤文本：grep

```
-c 只显示匹配的行数
-n 显示行号
-i 忽略大小写
-v 反向选择
常用
ls | grep -ni 文字（可以不打引号？）
```

