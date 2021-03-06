# Tracup使用流程

[TOC]

## 1.测试提交BUG(描述模板)

- 标题命名：【遗留问题】额外标注
  - 均有的问题：【必现】【通用】描述
  - 特有的问题：
    - IPC特有：【必现】【IPC】描述
    - NVR特有：【必现】【NVR】描述
    - 某个型号才有的：【必现】【具体型号（包括厂商和型号）】描述
- 描述模板：必要时添加截图和录屏

```
【问题确认人】：周星宇
【问题出现时间】：2019.10.23
【BUG来源】：哪个用例
【软硬件版本信息】
[APP版本]：Danale5.9.9
[插件版本]：无
[固件版本]：1.0.0.12
[路由器型号]：TP-LINK_WDR5620
[测试手机]：小米6
【预置条件】
1.在实时页面横屏或者竖排
【操作步骤】
1.点击录屏
【预期结果】
1.正常录屏
【实际结果】
1.录屏时音频开关会自动打开
2.关闭音频时开关会自动关闭
【恢复手段】
1.无
```

## 2.BUG审核(测试主管 or 项目经理)

- 问题描述：
  - 查看问题是否描述准确，是否提供充分的定位信息。
- 澄清与降级
  - 根据原型和定义，对BUG进行澄清
  - 对BUG进行优先级调整
- 问题合并：建立合集？
  - 闪退问题、小概率问题、遗留问题等

## 3.开发修改(模板&提交流程)

> 直接在tracup中回复的模板

- 开发定位描述模板

```
【问题定位人】：
【定位时间】：
【软硬件版本信息】
[APP版本]：
[插件版本]：
[固件版本]：
[路由器型号]：
[测试手机]：
【原因分析】：只分析问题原因，不写修改方法
【修改方案】：描述修改方法
【建议验证人】：交给熟悉此BUG的人，方便快速验证和后续跟进
【测试用例设计】：提供验证方法
```

- 开发定位小概率问题描述模板

```
【问题定位人】：
【定位时间】：
【软硬件版本信息】
[APP版本]：
[插件版本]：
[固件版本]：
[路由器型号]：
[测试手机]：
【复现手段】：
【日志分析结论】：
【未复现的可能性分析】：
```

- 开发定位重复问题描述模板

```
【问题定位人】：
【定位时间】：
【软硬件版本信息】
[APP版本]：
[插件版本]：
[固件版本]：
[路由器型号]：
[测试手机]：
【问题重复原因分析】
```

- 开发解决问题后，再tracup上标记为已解决--------------------解决多少后可以发版本，如何确认？？？？
- 开发解决bug后，发布测试版本时，导出修复的bug列表

## 4.测试回归(修改点测试)

> 直接在tracup中回复

- 审核（问题发现人审核？）开发提供的描述模板信息，提供不完整的可打回。
- 回归测试模板：(模板作用：一个问题可能首次回归不会通过，我们在回复中使用此模板方便记录)

```
【回归测试结果】：OK/NG
【第1次回归测试时间】：
【软硬件版本信息】
[APP版本]：Danale5.9.9
[插件版本]：无
[固件版本]：1.0.0.12
[路由器型号]：TP-LINK_WDR5620
[测试手机]：小米6
【回归测试次数】
【备注】
```

- 回归测试结果：
  - 通过：在tracup中关闭问题，按照【问题关闭】模板回复
  - 不通过：在BUG中回复不通过原因，重新打开问题

## 5.问题关闭

**测试人员关闭问题时，需要在tracup中回复**

- 【问题解决关闭】
  - 问题解决，回归测试通过
- 【非问题关闭】
  - 通过产品经理、开发沟通确认：附上原因
- 【重复问题关闭】
  - 开发分析为相同原因的问题：见【开发重复问题定位模板】

## 6.小概率问题&遗留问题

- 小概率问题
  - 开发复现与分析，测试复现（压力测试）
  - 不能关闭，三个版本跟踪
  - 可转为遗留问题
- 遗留问题
  - 产品确认能否遗留

## 7.待讨论

- 回归测试完成后，对版本进行相关记录：需要那些信息？

- 问题各个环节时间规定    

  