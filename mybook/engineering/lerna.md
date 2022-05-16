# lerna 使用指南

#### 需求

*   假设主项目是 Angular 技术栈的，依赖两个自研 npm 包，这两个包也依赖 Angular，现在主项目要升级 Angular 版本，那么这两个 npm 包也得跟着升级，且需要升级两次（一个包一次），可否只升级一次？
*   假设有两个 npm 包A和B，A依赖B，那么每当B有更新时，要想让A用上B的更新，需要B发版，然后A升级B的依赖，可否更简单些？

解法就是 lerna，一种多包依赖解决方案，简单来讲：  
1、可以管理公共依赖和单独依赖；  
2、多package相互依赖直接内部 link，不必发版；  
3、可以单独发布和全体发布  
4、多包放一个git仓库，也有利于代码管理，如配置统一的代码规范

#### 最佳实践

*   初始化项目时使用 Independent 模式  
    Independent 模式可以单独发版，更灵活

    npm i -g lerna
    lerna init --independent
    

成功后，生成目录：

    - packages(目录)
    - lerna.json(配置文件)
    - package.json(工程描述文件)
    

*   添加子package

    cd packages && mkdir moduleA && cd moduleA && touch index.js && npm init
    

以此方式创建两个模块 moduleA 和 moduleB

    - packages
      - moduleA
        - package.json
        - index.js
      - moduleB
        - package.json
        - index.js
    - lerna.json
    - package.json
    

*   添加公共依赖  
    假设 moduleA 和 moduleB 都依赖 lodash

    lerna add lodash
    

这会给moduleA 和 moduleB 同时安装 lodash，出现在各自 package.json 的 dependency 里

*   添加单独依赖  
    假设moduleA 自己依赖 jquery，moduleB 自己依赖 zepto

    lerna add jquery --scope=@fengyinchao/modulea
    lerna add zepto --scope=@fengyinchao/moduleb
    

注意 scope 的值对应的是 package.json 中的 name 字段

*   添加packages里其它模块作为自己的依赖  
    假设moduleA 依赖 moduleB

    lerna add @fengyinchao/moduleb --scope=@fengyinchao/modulea
    

注意这种依赖不会添加到 moduleA 的 node_modules 里，但会添加到 moduleA 的 package.json 中，它会自动检测到 @fengyinchao/moduleb 隶属于当前项目，直接采用symlink的方式关联过去

*   全 package 发布

    lerna publish
    

注意使用 lerna publish命令之前需要将代码commit并推送到远端仓库(首次发布时)，然后可以依次为每个 package 选择要发布的版本

  

*   更新包  
    给 moduleA 添加一个依赖 husky

    lerna add husky --scope=@fengyinchao/modulea
    git add .
    git commit -m "test:"
    // 查看更改
    lerna updated
    // 发布
    lerna publish
    

注意 lerna updated 命令需要提交更改后才会生效，再次 lerna publish 时会直接跳过 moduleB，只发布 moduleA

*   卸载包  
    给 moduleA 移除一个依赖 husky

    lerna exec --scope=@fengyinchao/modulea  npm uninstall husky
    

*   批量运行 npm script 脚本

    lerna run test # 运行所有包的 test 命令
    lerna run --scope my-component test # 运行 my-component 模块下的 test
    lerna run --parallel watch # 观看所有包并在更改时发报，流式处理前缀输出
    

*   抽离公共模块  
    上面 moduleA 和 moduleB 都依赖了 lodash，且在各自 package 下的node_modules 里都有副本，这其实很浪费空间，可以使用 --hoist

    lerna bootstrap --hoist
    

这会将 packages 里重复的依赖提取到最外层的 node_modules 里，同时最外层的 package.json 也不会更新 dependency 信息，所以不建议将公用依赖写到最外层的package.json里，而是重复写到每个子package.json 里，然后用 --hoist 提取出来

*   更新公共依赖  
    假设要升级 moduleA 和 moduleB 都依赖的 lodash 版本，不必依次到各子package下升级，可以借助 lerna-update-wizard 这个包来做

    // 根目录执行
    npm install --save-dev lerna-update-wizard
    ./node_modules/.bin/lernaupdate
    

  

##### 常见错误

*   Current HEAD is already released  
    第一次发布失败后出现

    lerna publish from-package
    

*   You must sign up for private packages  
    包名有前缀时出现

    // package.json 增加配置
      "publishConfig": {
        "access": "public"
      }
    
