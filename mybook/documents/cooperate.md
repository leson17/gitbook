<!--
 * @Description: 
 * @Author: Linxian Hong
 * @Date: 2021-10-25 17:23:43
 * @LastEditTime: 2021-10-25 17:43:07
 * @LastEditors: Linxian Hong
-->
# 前端如何与后端高效协作开发

## 1. 前后端分离  
   
   前端与后端的分离，能使前端的开发脱离后端的开发模式，拥有更大的自由度，以此便可做前端工程化、组件化、单页面应用等。 

## 2. 尽量避免后端模板渲染  

   web 应用的渲染方式分为服务器端渲染和客户端渲染，当下比较推荐的方式是客户端渲染，数据使用全 ajax 的方式进行交互。 
   
   除非在一些不得不使用服务器端渲染的情况下（如门户、电商等），应当尽量使用客户端渲染，因为客户端渲染更能使前后端分离（项目分离、代码解耦、协作分离、职责分离等），也能更好的做本地接口模拟开发，提升开发效率。 
   
   即使用服务器端渲染，在技术支持的条件下，可以使用 node 中间层（由前端人员开发），代替传统的后端模板渲染，这样可以使后端与前端完全解耦，后端与前端只有数据上的往来。 

## 3. 尽量避免大量的线上调试 

  做好本地接口模拟开发（包括后端模板渲染），避免大量的线上调试，因为线上调试很不方便，也很费事，并且每次更新代码，都需要重新构建，然后同步到服务器。 
  
  所以做好本地接口模拟开发，只要程序在本地运行是没问题的，一般线上就不会有太大的问题，这样就能大幅降低调试工作量，提升开发效率。 

## 4. 本地接口模拟开发 

  本地接口模拟就是在本地模拟一个与服务器差不多的环境，能够提供数据所需的接口，进行错误模拟处理等等。 
  
  本地接口模拟开发的意义就在于能够在本地完成几乎所有的开发与调试，尽量减少线上的调试，提高开发效率。 

## 5. 规范的接口文档 

  前端与后端协作提升开发效率的一个很重要的方法就是减少沟通：能够形成纸质的文档就不要口头沟通、能够把接口文档写清楚也不要口头沟通（参数、数据结构、字段含义等），特别是线上协作的时候，面对面交流是很困难的。 
  
  一个良好的接口文档应当有以下的几点要求与信息： 
  
  - 格式简洁清晰
  - 分组：当接口很多的时候，分组就很必要了
  - 接口名、接口描述、接口地址
  - http 方法、参数、headers、是否序列化
  - http 状态码、响应数据 
  
## 6. 去缓存 

  前端需要做好去客户端缓存的功能，保证用户始终都是使用的最新资源，不会因为因为缓存的问题而出现 bug。  
  
  传统的去缓存是在静态资源 url 上加上版本号或者时间戳，不过因为构建工具的出现以及一些浏览器已经不支持这种方式了的缘故，这种方式已经是过去时了。 
  
  现在去缓存是将文件 hash 化命名，只要文件变动，文件名就会不一样，以此才能彻底的去缓存。如果使用 webpack 进行打包，会自动将所有文件进行 hash 化命名。 

## 7. 前端后并行开发 

  正常情况下，前端的开发在完成 UI 或者组件开发之后，就需要等后端给出接口文档才能继续进行，如果能做到前后端并行开发，也能提升开发效率。 
  
  前后端并行开发，就是说前端的开发不需要等后端给出接口文档就可以进行开发，等后端给出接口之后，再对接好后就基本上可以上线了。 
  
  在本地化接口模拟的实现下，就可以做到前后端并行开发，只是在代码层面需要对 ajax 进行封装。 

## 8.  友好的沟通 

  不管工具多么厉害，很多时候都免不了要当面沟通，友好、心平气和的沟通也是很重要的！
