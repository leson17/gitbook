<!--
 * @Description: 
 * @Author: Linxian Hong
 * @Date: 2021-07-29 12:13:56
 * @LastEditTime: 2021-07-29 12:19:03
 * @LastEditors: Linxian Hong
-->
# 软件版本号管理

`Alpha`：
        Alpha是内部测试版,一般不向外部发布,会有很多Bug.除非你也是测试人员,否则不建议使用.是希腊字母的第一位,表示最初级的版本，alpha 就是α，beta 就是β ，alpha 版就是比beta还早的测试版，一般都是内部测试的版本。
`Beta`:
       该版本相对于α版已有了很大的改进，消除了严重的错误，但还是存在着一缺陷，需要经过多次测试来进一步消除。这个阶段的版本会一直加入新的功能。        
 `RC`：(Release Candidate)
       Candidate是候选人的意思，用在软件上就是候选版本。Release.Candidate.就是发行候选版本。和Beta版最大的差别在于Beta阶段会一直加入新的功能，但是到了RC版本，几乎就不会加入新的功能了，而主要着重于除错!  RC版本是最终发放给用户的最接近正式版的版本，发行后改正bug就是正式版了，就是正式版之前的最后一个测试版。
`GA`：（general availability）
       比如：Apache Struts 2 GA这是Apache Struts 2首次发行稳定的版本，GA意味着General Availability，也就是官方开始推荐广泛使用了。
`Release`:
              该版本意味“最终版本”，在前面版本的一系列测试版之后，终归会有一个正式版本，是最终交付用户使用的一个版本。该版本有时也称为标准版。一般情况下，Release不会以单词形式出现在软件封面上，取而代之的是符号(R)。

npm中版本管理：
npm采用了semver规范作为依赖版本管理方案。版本格式一般为：主版本号.次版本号.修订号(x.y.z)

主版本号（major）：一般改动很大，不兼容低版本
次版本号（minor）：兼容同一个大版本的API和用法
修订号（patch）：一般用来修复bug
有的时候在修订号后面可能还会有先行版本号，例如`1.0.0-alpha.1`，`1.0.0-beta.4`，`2.0.0-rc.1`等。常用的先行版本一般为alpha，beta，rc，stable，csp等。
常用版本运算符
^ 运算符：左边第一个非零版本相同
``` sh
'^1.5.6'  等同于 '>=1.5.6  <2.0.0'
'^0.5.6'  等同于 '>=0.5.6  <0.6.0'
'^0.0.6'  等同于 '>=0.0.6  <0.0.7'
```
~ 运算符：只含有主版本，主版本相同即可；含有次版本，主版本和次版本都需相同。
``` sh
'~1'  等同于 '>=1.0.0  <2.0.0'
'~0.5.6'  等同于 '>=0.5.6  <0.6.0'
```
x 运算符：匹配任意的数字
``` sh
'1.x'  等同于 '>=1.0.0  <2.0.0'
'1.5.x'  等同于 '>=1.5.0  <1.6.0'
'*'  等同于 '>=0.0.0'
```
我们实际开发中为防止第三方包做的修改对我们有影响，一般我们会固定版本，即安装指定版本。
关于发布npm包
发布
`npm publish`: 发布npm包
修改版本号
* `npm version major`: 主版本号加 1，其余版本号归 0
* `npm version minor`: 次版本号加 1，修订号归 0
* `npm version patch`: 修订号加 1
* `npm version 版本号`：设置版本号为指定的版本号
* `npm version prerelease`: 先行版本号增加1
* `npm version prerelease --preid=alpha`: 假设现在的version是1.3.5，执行完该命令之后就会成为 1.3.6-alpha.0 

在git环境中，执行npm version修改完版本号之后，还会默认执行git add->git commit->git tag操作。如果git工作区还有未提交的修改，npm version会执行失败。
修改发版的commit信息
默认的提交信息就是我们的版本号，假如我们需要修改提交信息的话，只需在npm version 命令后加上-m选项即可，%s会被替换成为版本号。
npm version prerelease -m "update %s"
禁用版本提交和标记tag
npm --no-git-tag-version version prerelease
关于npm包的删除
npm unpublish 包名：在npm上删除了指定的包。

关于npm的tag
`npm dist-tag` 包名: 查看指定包的tag和对应的最新version。
`npm publish --tag alpha`: 在名为alpha的tag上进行发版。
npm中的tag类似于git中的branch，发布者可以在指定的tag上进行发版，使用者可以选择指定tag来安装，默认的tag是latest。

带有命名空间的包
有些时候需要创建一个公司内部使用的模块，或者某个模块已经有了同名的模块存在，这个时候可以用到带有命名空间的模块，其名称形如 @scope/project。在 npm 上面带有命名空间的模块默认是私有的，是需要付费的，因此为了免费地发布一个带有命名空间的模块，需要在执行 publish 的时候加上 --access=public 选项。同时，在安装域级包时需要按照域级包全名来安装：npm i @scope/project

其他有用的命令
`npm whoami`: 显示 npm 用户名
`npm view 包名`: 显示包的详细信息
`npm view 包名 versions`: 显示包的所有历史版本
`npm repo 包名`: 打开包的源码仓库页面
`npm docs 包名`: 打开包的文档地址

