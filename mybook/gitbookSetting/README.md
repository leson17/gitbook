<!--
 * @Description: 
 * @Author: Linxian Hong
 * @Date: 2021-06-03 16:23:15
 * @LastEditTime: 2021-06-04 19:27:37
 * @LastEditors: Linxian Hong
-->
# Gitbook 配置

修改根目录下`book.json`配置文件，如果没有请自建

### 1. 书本标题：title
```
    "title" : "This Gitbook"
```

### 2. 作者：author
```
    "author" : "Monky"
```

### 3. 简单描述：description
```
  "description" : "记录Gitbook插件配置和使用方法"
```

### 4. 语言：language
```
Gitbook使用的语言, 版本2.6.4中可选的语言如下： en, ar, bn, cs, de, en, es, fa, fi, fr, he, it, ja, ko, no, pl, pt, ro, ru, sv, uk, vi, zh-hans, zh-tw 
例如，配置使用简体中文 
"language" : "zh-hans"
```

### 5. 左侧导航栏添加链接信息：links
```
  "links" : { 
    "sidebar" : { 
      "Home" : "https://www.baidu.com" 
    }
  }
```

### 6. 自定义页面样式
 - 默认情况下各generator对应的css文件
```
  "styles": { 
    "website": "styles/website.css", 
    "ebook": "styles/ebook.css", 
    "pdf": "styles/pdf.css", 
    "mobi": "styles/mobi.css", 
    "epub": "styles/epub.css" 
  }
```

 - 例如使 `<h1> <h2>`标签有下边框， 可以在website.css中设置
```
  h1 , h2{ border-bottom: 1px solid #EFEAEA; }
```