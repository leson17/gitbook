# TS高级类型介绍

## 本文内容

  *  联合类型
  *  keyof
  *  Record
  *  Partial (部分的; 不完全的)
  *  Required（必须的）
  *  Pick（选择）
  *  Readonly (意思是只读的)
  *  Exclude(排除)
  *  Omit (省略的)

### 联合类型
---
``` ts
    /* 首先是联合类型的介绍 */
    let a: string | number = '123' // 变量a的类型既可以是string，也可以是number
    a = 123
```
    

### keyof
---
将一个类型的属性名全部提取出来当做联合类型
``` ts
    // 1. 定义一个接口
    interface Person {
      name: string
      age: number
    }
    
    type PersonKeys = keyof Person // 等同于 type PersonKeys = 'name' | 'age'
    
    const p1: PersonKeys = 'name' // 可以
    const p2: PersonKeys = 'age' // 可以
    const p3: PersonKeys = 'height' // 不能将类型“"height"”分配给“name | age”
```

### Record
------

Record用于属性映射，听不懂？直接上案例

1.  定义一个普通的对象类型  
    ![在这里插入图片描述](https://img-blog.csdnimg.cn/1cad495f146f45b38b0bef291e43d76b.png#pic_center)
2.  搭配联合类型用法  
    ![在这里插入图片描述](https://img-blog.csdnimg.cn/e38e5a935d724e0b96a00b8f54670791.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RhanVuYQ==,size_16,color_FFFFFF,t_70#pic_center)
3.  同样可以映射对象,让对象的每个属性都是一个拥有特定键值对的类型  
    ![在这里插入图片描述](https://img-blog.csdnimg.cn/93937f5913d2468382be5e292dd934e7.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RhanVuYQ==,size_16,color_FFFFFF,t_70#pic_center)  
    **Record的实现原理**  
    Record的内部定义，接收两个泛型参数
``` ts
    type Record<K extends string | number | symbol, T> = {
        [P in K]: T;
    }
```

逐步解析

1.  泛型K即为第一次参数
2.  p in xx 又是什么意思呢？  
    in的意思就是遍历，如上就是将 类型string进行遍历，也就是string
3.  每个属性都是传入的T类型，如 string: PersonModel

### Partial (部分的; 不完全的)
----

ts中就是让一个定义中的所有属性都变成可选参数
``` ts
    // 定义一个Person接口
    interface Person {
      name: string
      age: number
    }
    
    // 但是我们有可能数据是请求过来的，刚开始我们需要定义一个空对象，如下。
    const person1: Person = {}
    /**
      但是这样就加粗样式会出现报错，类型“{}”缺少类型“Person”中的以下属性: name, age。
      可能我们可以更改定义方式如下，但是有的时候我们不想破坏事先的定义，或者不能破坏
      interface Person {
        name?: string
        age?: number
      }
    */
    
    /**
      那这个时候我们就可以用到typescript自带的高级类型 Partial，就相当于将上方接口所有属性变成可选的
      将我们需要定义的类型当做泛型传入Partial中，那么就相当于当前的类型里面的所有属性都是可选的
     */
    const person2: Partial<Person> = {} // 可以
    const person3: Partial<Person> = { name: 'xiaodu' } // 可以
    const person4: Partial<Person> = { height: 1.88 } // 报错 “height”不在类型“Partial<Person>”中
```

**Partial的实现原理**  
Partial的内部定义
``` ts
    type Partial<T> = {
      [P in keyof T]?: T[P]
    }
```    

逐步解析

1.  将一个类型的属性名全部提取出来当做联合类型
2.  将 age和name进行遍历
3.  \[P in keyof T\]? 的冒号就代表 可选 的参数
4.  T\[P\] 就代表 如 Person\[name\]代表的是 string 类型

### Required（必须的）
-------------

和Partial刚好相反，将一个定义中的属性全部变成必选参数  

![在这里插入图片描述](https://img-blog.csdnimg.cn/62a3e452983f43a9a39a41c90104f36c.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RhanVuYQ==,size_16,color_FFFFFF,t_70#pic_center)  

**Required的实现原理**  
Required的内部定义
``` ts
    type Required<T> = {
        [P in keyof T]-?: T[P];
    }
```    

逐步解析

1.  将一个类型的属性名全部提取出来当做联合类型
2.  将 age和name进行遍历
3.  在?之前加个-，代表着这个属性是必须的。
4.  T\[P\] 就代表 如 Person\[name\]代表的是 string 类型

### Pick（选择）
--------

ts中可以选择一个原来的接口中一部分的属性定义  

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210616155911616.jpg)  

如果想要选择多个属性定义呢？  

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210616160026501.png)  

**pick的实现原理**
``` ts
    type Pick<T, K extends keyof T> = {
      [P in K]: T[P]
    }
```    

pick接收两个泛型

*   第一个泛型 T 便是 interface 或者 type 定义
*   第二个就是第一个定义中的属性， extends就代表继承  
    K extends keyof T 等同于 k extends ‘name’ | ‘age’,意思就是k只能是age或者name

### Readonly (意思是只读的)
-----------------

ts中就是让一个定义中的所有属性都变成只读参数
``` ts
    // 定义一个Person接口
    interface Person {
      name: string
      age: number
      girlFriend: {
        name: string
        age: number 
      }
    }
```    

![在这里插入图片描述](https://img-blog.csdnimg.cn/21b4a0f0a6b74e21ae17effced4419f3.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RhanVuYQ==,size_16,color_FFFFFF,t_70#pic_center)  

可以看到Readonly可以将接口所有属性变为只读的不可修改的，但是是浅层的。  
**Readonly的实现原理**  
Readonly的内部定义
``` ts
    type Readonly<T> = {
      readonly [P in keyof T]: T[P];
    }
```    

逐步解析

1.  将一个类型的属性名全部提取出来当做联合类型
2.  将 age和name进行遍历
3.  readonly 修饰符代表属性是只读的
4.  T\[P\] 就代表 如 Person\[name\]代表的是 string 类型

### Exclude(排除)
-----------

ts中可以排除 **联合类型** 中一部分的内容  
注意Exclude是操作联合类型的  

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210616161441785.png)  
**Exclude的原理**
``` ts
    type Exclude<T, U> = T extends U ? never : T
```    

传入两个泛型

*   我们这里用 **MyTypes** 也就是 ‘name’ | ‘age’ | ‘height’ 去代表 **T**
*   用 name 属性去代表第二个泛型 **U**
*   T extends U 就判断是否’name’ | ‘age’ | ‘height’ 有 **name**， 有**name**就返回**never**,就代表将其排除

### Omit (省略的)
----------

ts中就是将接口或者类型的键值对删除一部分 

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210616162723407.png)  
 
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210616162750671.png)  
**Omit原理**  
也就是上面所讲解的知识点拼凑起来的
``` ts
    type Omit<T, K extends string | number | symbol> = {
      [P in Exclude<keyof T, K>]: T[P]
    }
```
