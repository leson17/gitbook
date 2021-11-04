# 排序算法

- 冒泡排序
- 选择排序
- 插入排序
- 快速排序
- 二分查找

# 一、排序算法比较

衡量代码的好坏，包含两个重要指标：`运行时间`和`占用空间`。 

`时间复杂度`代表运行时间，空间复杂度达标占用空间。

`空间复杂度`是指算法在运行过程中临时占用存储空间大小的量度。

### 1. 稳定性
 - 稳定： 冒泡排序、归并排序、插入排序、基数排序 

 - 不稳定：选择排序、快速选择排序、希尔排序、堆排序

### 2、时空复杂度比较

|算法名|平均时间|最差情况|稳定度|额外空间|备注|
|:---:|:---:|:---:|:---:|:---:|:---:|
|冒泡|O(n2)|O(n2)|稳定|O(1)|n小时较好|
|选择|O(n2)|O(n2)|不稳定|O(1)|n小时较好|
|插入|O(n2)|O(n2)|稳定|O(1)|大部分已排序时较好|
|基数|O(logRB)|O(logRB)|稳定|O(n)|B是真数(0-9)，R是基数(个十百)|
|Shell|O(nlogn)|O(ns) 1<s<2|不稳定|O(1)|s是所选分组|
|快速|O(nlogn)|O(n2)|不稳定|O(nlogn)|n大时较好|
|归并|O(nlogn)|O(nlogn)|稳定|O(1)|n大时较好|
|堆|O(nlogn)|O(nlogn)|不稳定|O(1)|n大时较好|
  
# 二、常用的排序算法

## 1. 冒泡排序 

### 思路：
1. 比较相邻的元素，如果前一个比后一个大，交换之
2. 第一趟排序第1个和第2个一对，比较与交换，随后第2个和第3个一对比较交换，这样知道倒数第2个和最后1个，将3. 最大的数移动到最后一位
4. 第二趟将第二大的数移动到倒数第二位
5. ............
6. 因此需要 n-1 趟
### 过程演示
![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/daa3d45406364844bda4d37be3eaf89b~tplv-k3u1fbpfcp-zoom-1.image)

![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/0d29b6ef9eee4b43848562d816bd0712~tplv-k3u1fbpfcp-zoom-1.image)

``` javascript
  const arr = [9,34,9,1,8,3,0,71,38,945,2,90];
  const len = arr.length;

  for (let i=0; i<len; i++) {
    for (let j=0; j<len-1-i; j++) {
      if (arr[j] > arr[j+1]) {
        const temp = arr[j];
        arr[j] = arr[j+1];
        arr[j+1] = temp;
      }
    }
  }

  console.log(arr);
```

## 2. 选择排序
### 思路：
1. 通过对序列元素的两两比较，选择出一个最小值与队首元素交换
2. 重复以上步骤，确定队首后一位元素
3. 继续重复…
### 过程演示
![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/9371fb610b204e94b79dd1becb6ed0fd~tplv-k3u1fbpfcp-zoom-1.image)

![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/110b89e135494efdbd3ea66a0f92280e~tplv-k3u1fbpfcp-zoom-1.image)

``` javascript
  const arr = [9,34,9,1,8,3,0,71,38,945,2,90];
  const len = arr.length;

  let point = null; // 初始化指针
  for (let i=0; i<len; i++) {
    point = i;
    for (let j=i+1; j<len; j++) {
      if (arr[point] > arr[j]) {
        point = j; // 标识最小值的下标
      }
    }
    temp = arr[i];
    arr[i] = arr[point];
    arr[point] = temp;
  }

  console.log(arr);
```

## 3. 插入排序

### 思路
从待排序的数组中的第二位开始，与前面的有序表中的元素从后往前依次比较，确定插入位置。 

对于元素的插入可通过移动法，也可通过交换法来实现。
### 过程演示
![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3bd40f78022f4c88b565aed194f303b8~tplv-k3u1fbpfcp-zoom-1.image)

![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/706c2b1a6a124b5d9a96f8f1109d4519~tplv-k3u1fbpfcp-zoom-1.image)


### 代码实现：
```javascript
  const arr = [9,34,9,1,8,3,0,71,38,945,2,90];

  const move = (n) => {
    if (n > 0) {
      if (arr[n] < arr[n-1]) {  
        const temp = arr[n];
        arr[n] = arr[n-1];
        arr[n-1] = temp;
        move(n-1);
      }
    }
  }

  const len = arr.length;
  for (let i=0; i<len; i++) {
    move(i);
  }

  console.log(arr)
```

## 4. 快速排序

### 大致分三步： 

  1. 在数据集之中，选择一个元素作为"基准"（pivot）。 

  2. 所有小于"基准"的元素，都移到"基准"的左边；所有大于"基准"的元素，都移到"基准"的右边。 

  3. 对"基准"左边和右边的两个子集，不断重复第一步和第二步，直到所有子集只剩下一个元素为止。

### 过程演示

![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/cd64def03ff44d78921e77a7e5aca171~tplv-k3u1fbpfcp-zoom-1.image)

### 代码实现：
```js 
const quickSort =  (arr) => { // 传入一个数组
  if ( arr.length <= 1){ // 如果数组长度小于等于1无需判断直接返回即可
    return arr;
  }

  let pivotIndex = Math.floor( arr.length  /  2); // 取基准点
  console.log(pivotIndex+" %%%");

  // 取基准点的值，splice(index,1) 函数可以返回数组中被删除的那个数
  let pivot = arr.splice(pivotIndex,1)[0];
  console.log(pivot+ "))");

  let left = []; // 存放比基准点小的数组
  let right = []; // 存放比基准点大的数组
  for (var i = 0 ; i <  arr.length ; i++ ) { // 遍历数组，进行判断分配
    if ( arr[i] < pivot) {
      left.push( arr[i] ); // 比基准点小的放在左边数组
    }else{
      right.push( arr[i] ); // 比基准点大的放在右边数组
    }
  }

  // 递归执行以上操作，对左右两个数组进行操作，直到数组长度 <= 1
  console.log(left+" " +right);
  // 使用递归，然后拼接，最好写到纸上一步一步，就会一目了然
  return quickSort(left).concat([pivot],quickSort(right));
}

console.log(quickSort([8,7,4,1,9,2,3])); // 打印到控制台
```

## 5. 二分查找
### 大致分三步：

1.  从有序数组的最中间元素开始查找，如果该元素正好是指定查找的值，则查找过程结束。否则进行下一步; 
2.  如果指定要查找的元素大于或者小于中间元素，则在数组大于或小于中间元素的那一半区域查找，然后重复第一步的操作; 
3.  重复以上过程，直到找到目标元素的索引，查找成功;或者直到子数组为空，查找失败。

优点：比较次数少，查找速度快，平均性能好； 

缺点：是要求待查表为有序表，且插入删除困难。因此，折半查找方法适用于不经常变动而查找频繁的有序列表。

### 代码实现：
```js
let arr = [1,2,3,4,5,6];
const binarySearch = item => { // 要找的元素
  let mid = null; // 找一个中间数，定义为空，用来存值
  let low = 0;  // 最低位置
  let hight  = arr.length - 1; // 最高位置（第一次比较接受数组的长度）
  let element = null; // 用来存放数组中间的值

  while (low <= hight) { // 用循环来判断，是否满足 low<=hight
      mid = Math.floor((low + hight) / 2 ); // 向下取整，获取中间值得位置
      element = arr[mid]; // 获取数组中间的值
      if (element < item) { // 比较，如果数组中间的值小于要找的元素
          low = mid + 1;  // 此时最低位，就是之前mid  中间值加1
      }else if (element > item) { // 比较，如果数组中间的值大于要找的元素
          hight  = mid - 1; // 此时的最高位置就是mid 中间值减1
      }else{
          return mid;  // 反之，进入else判断，就证明找到了
      }
  }

  return -1; // 防止溢出
}

// 好记性不如烂笔头，写在纸上，一目了然
console.log(binarySearch(5))
```

### <p align=center style="color:yellow">大家多点点赞，一起坚持探讨和学习算法，哈哈哈 ！！！坚持<p>

## 参考文章
[十大经典排序算法总结（JavaScript描述）](https://juejin.cn/post/6844903444365443080)

[JS中可能用得到的全部的排序算法](https://juejin.cn/post/6844903470009417742)

