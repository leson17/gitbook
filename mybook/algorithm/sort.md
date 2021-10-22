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