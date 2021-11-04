# 链表VS数组队列

## `链表`与`数组队列`的区别 
---

`链表`与`数组队列`都能够实现对数据的存储以及对数据进行插入、删除、查找、修改等操作。他们的主要区别在于链表在内存中的存储是离散的，而数组队列在内存中开辟的内存是连续的。因此，在链表中查找数据，必须要找到他的前一个，根据前一个来查找，而数组则可以根据下标来查找。

## `链表` 
---
链表是由节点组成的，节点与节点之间通过引用来实现连接。 节点有两部分组成：数据域和引用域
```js
class LinkNode {
  constructor() {
    this.data = {}; //节点的数据域
    this.prev = null; //指向该节点 上一个节点的引用域
    this.next = null; //指向该节点 下一个节点的引用域
  }
}
```
### 链表分为：单向链表 双向链表 循环链表

  - 单向链表：只有一个引用域指向下一个节点           ( 头节点-（引用）->中间节点-（引用）->尾节点)

  - 双向链表：有两个引用域，指向该节点的上一个节点和下一个节点

  - 循环链表：最后一个节点指向头节点

## `数组队列`
---
数组队列是通过数组来实现的，数组队列与数组的主要区别在于：数组队列的长度是可以改变的而数组的长度在一开始就固定了，不能改变其长度。 

## `链表`和`数组队列`操作的实现
---

### （1）插入

  `链表`：在某个位置插入一个节点，只需要改变指针的指向。时间负责度：1

  `数组队列`：新创建一个数组，长度为之前的数组长度+1，把要插入的数据放到要插入的位置。再把之前数组中的数据复制过来，改变数组名（里面存储的地址）的指向，使他指向之前新数组。时间复杂                    度：n

### （2）删除 

  `链表`：只需要让要删除的节点的前一个节点指向他的下一个节点。时间复杂度：1

  `数组队列`：把要删除的数据的后一个数据依次赋给他的前一个节点 。时间复杂度：n

### （3）查找

  `链表`：从第一个依次往下找。把每个节点的数据域与需要查找的数据比较，找到之后返回。

  `数组队列`：从第一个元素开始遍历。每个元素中的数据与需要查找的数据比较，找到之后返回。

### （4）修改

  `链表`：先找到要删除的节点，改变里面的数据域

  `数组队列`：找到该数据，修改数据

## 链表与数组队列的优缺点
---

  `链表`：删除和插入效率高，时间复杂度为1，但是查找效率不高。所以链表适合需要大量删除操作的情况。

  `数组队列`：获取其中的元素很容易，但是删除和插入效率不高，需要的时间复杂都为n，数组队列适合用来查找数据。
