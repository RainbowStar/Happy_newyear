 
# %取余，**乘方
#print((10*20%7)**2)

# p=input("远程python环境测试")
# print("远程环境测试成功",p)

# for循环 自动加一
# for i in range(10):
#     print("num=",i)

# while 循环
# num = 10
# i = 0
# while i < num:
#     print(i)
#     i+=1

# # 接收用户输入，判断输入是正负0
# p=int(input("please input a num:"))
# if p>0:
#     print("this is a positive")
# elif p<0:
#     print("this is a negative")
# else:
#     print("this is a 0")

# 循环的字符串
#p=input("input a string")
#i=0
# while i<len(p):
#     print(p[i],end=" ")
#     i+=1
# for i in p:
#     print(i,end=" ")

# 循环与列表和元组
#遇到的问题：变量不赋初值就使用TypeError: unsupported operand type(s) for +: 'builtin_function_or_method' and 'int'
#alist=[1,2,3,4,5]
#atuple=(1,2,3,4,5)
# sum=0
# for i in alist:
#     sum=sum+i
#     print(sum,end=" ")
# print("\n")
# print(sum)
# 用户输入赋值
# alist=[1,2,3,4,5]
# sum=0
# for i in range(5):
#     print(i)
#     alist[i]=int(input("input a listnum:"))
# for i in alist:
#     sum=sum+i
#     print(sum,end=" ")
# print("\n")
# print(sum)

# 空列表，append函数插入赋值
# alist=[]
# sum=0
# for i in range(5):
#     print(i)
#     alist.append(int(input("input a listnum:")))
# for i in alist:
#     sum=sum+i
#     print(sum,end=" ")
# print("\n")
# print(sum)

#求平均值，带小数
# alist=[]
# sum=0
# for i in range(5):
#     print(i,end=" ")
#     alist.append(int(input("input a listnum:")))
# print("len=%d"%len(alist))
# for i in alist:
#     sum=sum+i
#     print(sum,end=" ")
# print("\n")
# print(sum/len(alist))

# 限制输入，满足后跳出循环，最好做出限制输入次数，否则程序卡死
# i=0
# inputcout=0
# repeatcout=2
# while inputcout<repeatcout:
#     i=int(input("input a num:"))
#     if i>=1 and i<=100:
#         print(i)
#         break
#     else:
#         print("this num not met")
#     inputcout+=1
#     print(inputcout)
# if inputcout>=repeatcout:
#     print("please try this after 30s")

# # 只保留列表中年龄最大的人
# NameAge=[('jack', '30'), ('bob', 38), ('ann', 18),('bob', '20'), ('jack', 19)]
# agelist=[]
# nowlist=[]
# for num in range(len(NameAge)):
#     # print(f"num is: {num}")
#     # print(int(NameAge[num][1]))
#     agelist.append(int(NameAge[num][1]))
# maxage=max(agelist)
# print(maxage)
# agelocation=agelist.index(maxage)
# print(agelocation)
# # for loction in range(len(NameAge)):
# #     print(loction)
# #     if loction==agelocation:
# #         nowlist.append(NameAge[loction])
# #     else:
# #         pass
# # print(nowlist)
#
# # 不使用新list
# if 0==agelocation:
#     for loction in range(len(NameAge)-1):
#         NameAge.pop(1)
# else:
#     NameAge[0]=NameAge[agelocation]
#     for loction in range(len(NameAge)-1):
#         NameAge.pop(1)
# print(NameAge)
# # end


# 已知有成绩表 {'bill':[78,89,None], 'bob':[69,None,91], 'lily':[65,70,80]}，None 表示缺考，按 0 分算，请计算学生的平均成绩并按名次排列。
# StudentMark={'bill':[78,89,None], 'bob':[69,None,91], 'lily':[65,70,80]}
# StudentMarkAverage={'bill':0 ,'bob':0, 'lily':0}
# for student in StudentMark:
#     sum=0
#     for marknum in range(len(StudentMark[student])):
#         value=StudentMark[student][marknum]
#         #print(value)
#         if value is None:
#     	    value=0
#         else:
#             pass
#         #print(value)
#         sum+=value
#     StudentMarkAverage[student]=sum/len(StudentMark[student])
# order=sorted(StudentMarkAverage.items(),key=lambda  x:x[1],reverse=False)
# print(order)
# print(StudentMarkAverage)

# 不使用sorted高级方法，实现思路：排序法？

print(1 + 3.14 == '4.14' )