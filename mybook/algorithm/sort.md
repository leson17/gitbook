# 排序算法

- 冒泡排序
- 选择排序
  
## 冒泡排序

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

## 选择排序

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

## 插入排序
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

## 快速排序

### 大致分三步： 

  1. 在数据集之中，选择一个元素作为"基准"（pivot）。 

  2. 所有小于"基准"的元素，都移到"基准"的左边；所有大于"基准"的元素，都移到"基准"的右边。 

  3. 对"基准"左边和右边的两个子集，不断重复第一步和第二步，直到所有子集只剩下一个元素为止。

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

## 二分查找
### 大致分三步：

1.  从有序数组的最中间元素开始查找，如果该元素正好是指定查找的值，则查找过程结束。否则进行下一步; 
2.  如果指定要查找的元素大于或者小于中间元素，则在数组大于或小于中间元素的那一半区域查找，然后重复第一步的操作; 
3.  重复以上过程，直到找到目标元素的索引，查找成功;或者直到子数组为空，查找失败。

优点：比较次数少，查找速度快，平均性能好； 

缺点：是要求待查表为有序表，且插入删除困难。因此，折半查找方法适用于不经常变动而查找频繁的有序列表。

### 代码实现：
```js
let arr = [1,2,3,4,5,6];
const binarySearch = ( item ) => { // 要找的元素
  let mid = null; // 找一个中间数，定义为空，用来存值
  let low = 0;  // 最低位置
  let hight  = arr.length - 1; // 最高位置（第一次比较接受数组的长度）
  let element = null; // 用来存放数组中间的值

  while ( low <= hight) { // 用循环来判断，是否满足 low<=hight
      mid = Math.floor(( low+hight ) / 2 ); // 向下取整，获取中间值得位置
      element = arr[mid]; // 获取数组中间的值
      if ( element < item ) { // 比较，如果数组中间的值小于要找的元素
          low = mid + 1;  // 此时最低位，就是之前mid  中间值加1
      }else if ( element > item ) { // 比较，如果数组中间的值大于要找的元素
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