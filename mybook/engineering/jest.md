# React + TS + Jest

以 react + ts 的组件库项目为例，记录 jest 安装配置及测试的过程。

一、安装配置
======

### 安装 jest

    npm install jest -D
    

### 生成配置文件

    npx jest --init
    

按照引导进行选择后，会创建配置文件 `jest.config.js`，并在 `package.json` 中添加命令脚本 `test: jest`

### 支持 babel

> 要想支持 ts 和 react，都需要先支持 babel，从而在测试环境中转换代码

    npm install babel-jest @babel/core @babel/preset-env -D
    

    // .babelrc
    {
      presets: [
        [
          '@babel/preset-env',
          {
            targets: {
              node: 'current',
            }
          }
        ]
      ]
    }
    

### 支持 ts

    npm install @babel/preset-typescript -D
    

    // .babelrc
    {
      presets: [
        [
          '@babel/preset-env',
          {
            targets: {
              node: 'current',
            }
          }
        ],
        '@babel/preset-typescript'  // 添加这个
      ]
    }
    

### 支持 react

    npm install @babel/preset-react -D
    

    // .babelrc
    {
      presets: [
        [
          '@babel/preset-env',
          {
            targets: {
              node: 'current',
            }
          }
        ],
        '@babel/preset-typescript'  
        '@babel/preset-react' // 添加这个
      ]
    }
    

### 使用 react 测试工具 enzyme

添加 enzyme

    npm install enzyme enzyme-adapter-react-16 -D
    

项目中新建 tests/jest.setup.js 文件

    // jest.setup.js
    
    import Enzyme from 'enzyme';
    import Adapter from 'enzyme-adapter-react-16';
    
    Enzyme.configure({ adapter: new Adapter() });
    

并在 jest.config.js 中配置

    setupFiles: ['./tests/jest.setup.js']
    

二、快照测试
======

*   ### 使用 react-test-renderer
    

添加 `react-test-renderer` 用于快照测试

    npm install react-test-renderer -D
    

下面给 Button 组件添加测试试一下

    // components/button/__test__/index.test.js
    
    import React from 'react';
    import renderer from 'react-test-renderer';
    import Button from '../Button';
    
    describe('Button 组件', () => {
        it('正确渲染 Button 组件', () => {
            const button = renderer.create(<Button>button</Button>).toJSON();
            expect(button).toMatchSnapshot();
        });
    });
    
    

执行 `npm run test`  

![](https://upload-images.jianshu.io/upload_images/7913125-82d0cd1587c4e916.png?imageMogr2/auto-orient/strip|imageView2/2/w/806/format/webp)



image.png

可以看到有一个快照被生成了

再执行一遍 `npm run test`，这次没有写快照了，并且匹配通过了

![](https://upload-images.jianshu.io/upload_images/7913125-0fec2d93f04ae40e.png?imageMogr2/auto-orient/strip|imageView2/2/w/736/format/webp)

image.png

*   ### 也可以用 enzyme 来进行快照测试（推荐）
    

添加 `enzyme-to-json`，用于将 enzyme 构造的 wrapper 转变成能够支持快照测试的格式。

    npm install enzyme-to-json -D
    

同样，测试一下 Button 组件

    // components/button/__test__/index.test.js
    
    import React from 'react';
    import Button from '../Button';
    import { render } from 'enzyme';
    import toJson from 'enzyme-to-json';
    
    describe('Button 组件', () => {
        it('正确渲染 Button 组件', () => {
            const button = render(<Button>button</Button>);
            expect(toJson(button)).toMatchSnapshot();
        });
    });
    

执行 `npm run test`，没通过，因为跟之前`react-test-renderer`渲染的快照不匹配了

![](https://upload-images.jianshu.io/upload_images/7913125-6d95892a02417f6e.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)

image.png

我们需要重新写快照，执行`npx jest -u`

![](https://upload-images.jianshu.io/upload_images/7913125-289e3b2371a9055e.png?imageMogr2/auto-orient/strip|imageView2/2/w/810/format/webp)

image.png

快照更新了，再执行一下`npm run test`，通过了

![](https://upload-images.jianshu.io/upload_images/7913125-81e79d87d52e2a35.png?imageMogr2/auto-orient/strip|imageView2/2/w/870/format/webp)

image.png

代码中的 toJson 部分可以统一配置到 jest.config.js，添加快照序列化配置，代码里就不用写 toJson 了。

    snapshotSerializers: ['enzyme-to-json/serializer']
    

三、事件测试
======

利用 `mock 函数` 测试一下 Button 组件的事件

    // components/button/__test__/index.test.js
    
    import React from 'react';
    import Button from '../Button';
    import { render, mount } from 'enzyme';
    
    describe('Button 组件', () => {
        it('正确渲染 Button 组件', () => {
            const button = render(<Button>button</Button>);
            expect(button).toMatchSnapshot();
        });
    
        it('测试 Button 组件 loading 参数', () => {
            const fn = jest.fn();
            const loadingButton = mount(
                <Button loading onClick={fn}>
                    loading button
                </Button>
            );
            expect(loadingButton).toMatchSnapshot();
            loadingButton.find('button').simulate('click');
            expect(fn).not.toBeCalled();
        });
    
        it('测试 Button 组件 disabled 参数', () => {
            const fn = jest.fn();
            const disabledButton = mount(
                <Button disabled onClick={fn}>
                    disabled button
                </Button>
            );
            expect(disabledButton).toMatchSnapshot();
            disabledButton.find('button').simulate('click');
            expect(fn).not.toBeCalled();
        });
    
        it('测试 Button 组件 onClick 事件', () => {
            const fn = jest.fn();
            const button = mount(<Button onClick={fn}>button</Button>);
            button.find('button').simulate('click');
            expect(fn).toBeCalled();
        });
    });
    

四、参考文档
======

[jest 官方文档](https://links.jianshu.com/go?to=https%3A%2F%2Fjestjs.io%2Fdocs%2Fzh-Hans%2Ftutorial-react)  
[npm: enzyme](https://links.jianshu.com/go?to=https%3A%2F%2Fwww.npmjs.com%2Fpackage%2Fenzyme)

五、注意
====

*   Jest 26.4 目前为止还不能支持 esm 模块，本文使用 esm 模块化方式能成功是因为搭配了 babel 。
 
### 参考链接 
[https://www.jianshu.com/p/0c8296144f15](https://www.jianshu.com/p/0c8296144f15)