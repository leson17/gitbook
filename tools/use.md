# Charles 使用教程

## 前言

* 无论正向开发，还是逆向开发，抓包都是必备工具。本文讲抓包工具Charles的使用。

## 安装

* [官网](https://www.charlesproxy.com/)，可以下载免费试用版本，或者付费购买。

  ![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e7963f4b9034418bb6de3d90fccee278~tplv-k3u1fbpfcp-zoom-1.image)

* 下载完成之后，具体安装过程就不赘述了。

## 界面

* 界面如下，左侧是网络请求，右侧是具体信息，其中提供了断点，弱网等功能![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b77f2e3b3d9146b78a1bbf2a83d6d29d~tplv-k3u1fbpfcp-zoom-1.image)

## 抓取天气预报接口

* 我们打开网站 [https://weather.com/zh-CN/weather/today/l/f6de1330f517758fbcfe51946263fb8485477d27f5ab1e3f2d9f88b0e823f544](https://weather.com/zh-CN/weather/today/l/f6de1330f517758fbcfe51946263fb8485477d27f5ab1e3f2d9f88b0e823f544) 来查看北京的天气![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/608927e01cbf4425b7d133fe91ae0f28~tplv-k3u1fbpfcp-zoom-1.image)
* 查看Charles抓的包![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8c31cf5940ee4283b94975320c4d9d20~tplv-k3u1fbpfcp-zoom-1.image)

像我们如果开发小程序或者独立App的时候，一些天气Api是需要付费的，我们就可以通过抓包找到相关返回数据，来解析完使用这些数据。

## https乱码问题

* 有时候我们看到抓的有些包是乱码的，或者提示unkonwn ，那是因为https协议需要安全认证![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d7a4375752c640fb984f42bc86fb551f~tplv-k3u1fbpfcp-zoom-1.image)

  ![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a387d09624c54dc2bf3c9de0cbed3eff~tplv-k3u1fbpfcp-zoom-1.image)

* 安全认证：点击Help-&gt;SSL Proxying-&gt;Install Charles Root Certificate
* 然后去钥匙串中点击信任

  ![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/0af1059fd22843aba6b792c1b64df947~tplv-k3u1fbpfcp-zoom-1.image)

* 此时依然无法解析https的请求。需要设置SSL Proxying Settings，可以单独配置某一个url，当然为了方便最好配置成通用的，如下所示![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c434cf62d9af4d81b0f8f7dbba8ae58c~tplv-k3u1fbpfcp-zoom-1.image)

此时就可以正常解析https请求了

## 断点修改B站数据

* 点击 Proxy-&gt;Enable Breakpoints，或者直接选择断点图标，开启断点功能
* 右键选择BreakPoints![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a1649bc2844348bf9c351ca256236c3e~tplv-k3u1fbpfcp-zoom-1.image)
* 重新刷新B站，讲一个标题 `Sour Candy'中的采样竟然不是郭老师而是Gaga本人!!!`改为 `逆向小专栏https://xiaozhuanlan.com/cydia`

![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e483259f29094d62b1c720a80eeffe7f~tplv-k3u1fbpfcp-zoom-1.image)

* 跳过断点，执行完之后，可以看到确实被修改成功了。![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b4845aec19034a34a7eb4a2d6d1822f1~tplv-k3u1fbpfcp-zoom-1.image)
* 对于请求参数的修改
  * 右键Repeat再次请求一次
  * 右键Compose 可以修改参数，然后点击Execute执行，就执行我们修改过的请求

## 弱网测试

* 点击proxy -&gt;Throttle Settings进行弱网设置
* 我们可以模拟弱网进行测试![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/5ed8de9ec5a4460c867d50a42b9874e0~tplv-k3u1fbpfcp-zoom-1.image)

## 抓手机包

* 点击：Help-&gt;SSL Proxyig -&gt;Install Charless Root Certificate on a Mobile Device or Romete Browser 如下图所示![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/bb2584cfb34f4697ad9405b0fb5654c6~tplv-k3u1fbpfcp-zoom-1.image)
* 打开手机的WiFi设置，配置代理为手动，改为Charles提示的ip和端口 `192.168.1.6:8888`

  ![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4f5fa977116046aa8986f4c1857ea226~tplv-k3u1fbpfcp-zoom-1.image)

* 打开手机浏览器输入`chls.pro/ssl`
* 此时Mac上会有弹窗是否允许，我们选择允许
* 手机上提示是否下载配置描述文件，我们选择允许

  ![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a35730339a4c4d0eade871c39a526539~tplv-k3u1fbpfcp-zoom-1.image)

* 去手机的通用-&gt;关于本机-&gt;证书信任设置，信任改证书
* 操作手机，就发现Charles已经抓取了手机上的网络请求

## 映射本地资源

* 打开博客网站：[https://ityongzhen.github.io/](https://ityongzhen.github.io/) ，如下所示

  ![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/0b6fa8d50db24eb8bb37277cf5d7c54d~tplv-k3u1fbpfcp-zoom-1.image)

* Charles抓包，找到 url ,并点击Save response ，保存到本地
* 然后把保存的本地文件中`首页`，`关于`等加上`eagle`![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6d90ba7a5bb546ae875e51ae2b746ee2~tplv-k3u1fbpfcp-zoom-1.image)
* 点击Tools -&gt;map local，在Host中填写需要映射的URL ,并选择本地文件

  ![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/1120820ab21944d393a85284dc03be25~tplv-k3u1fbpfcp-zoom-1.image)

* 刷新浏览器可以看到数据改过了，看包体也是改过的数据，如下![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c0f385f2bd9e4e4c870ddb092be787ec~tplv-k3u1fbpfcp-zoom-1.image)

