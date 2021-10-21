<!--
 * @Description: 
 * @Author: Linxian Hong
 * @Date: 2021-10-21 15:59:32
 * @LastEditTime: 2021-10-21 16:18:38
 * @LastEditors: Linxian Hong
-->
# cookie的domainy和path详解

一、domain
--------

### 1.介绍

可以访问该Cookie的域名。如果设置为“.google.com”，则所有以“google.com”结尾的域名都可以访问该Cookie。注意第一个字符必须为“.”。

### 2.例子

    document.cookie = "token=abc;path=/;domain=.csdn.net"

### 3.运用

平常用的比较多的地方是在登录模块，通过在父级域设置Cookie，因为各个子级域都可以拿到父级域中的Cookie值，即可通过父级域中的Cookie值来确定登录的状态。而如果2中例子写成如下

    document.cookie = "token=abc;path=/;"

则会导致Cookie只有在当前域和子域中查看，在父域或者兄弟域之中是无法读取cookie的，会出现跨域的情况，这样就无法再全局通过cookie去判断状态。

二、path
------

### 1.介绍

Cookie的使用路径。如果设置为“/sessionWeb/”，则只有contextPath为“/sessionWeb”的程序可以访问该Cookie。如果设置为“/”，则本域名下contextPath都可以访问该Cookie。注意最后一个字符必须为“/”。

### 2.例子

    document.cookie = "token=abc;path=/;domain=.csdn.net"

### 3.运用

举个例子，在mine/register目录下写了个Cookie而没设置path的话，在mine/login目录下则拿不到之前写的Cookie。拿前面的登录模块来说，退出登录需要清除Cookie的时候，若是忽略了写Cookie的目录，则会导致无法清除Cookie等bug出现。

所以一种比较好的方法就是写Cookie的时候带上path，“/”表示路径是根目录。