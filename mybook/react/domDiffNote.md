# Diff 算法 - 学习笔记

### arguments、arguments.callee、caller介绍

`arguments`：调用函数时产生的，保存实参。

`arguments.callee`：被调用时指向函数自身，多用于匿名函数中，因匿名函数没有名字，可通过此属性调用自己本身。

`caller`：指向调用某函数的那个函数。

下面通过一段代码说明它们的用处：

```js
function A(n) {
    console.log(arguments);                 // Arguments [1, callee: ƒ, Symbol(Symbol.iterator): ƒ]
    console.log(A);                         // ƒ A(n)
    console.log(arguments.callee);          // ƒ A(n)
    console.log(A.caller)                   // ƒ B()
    console.log(arguments.callee.caller)    // ƒ B()
}

function B(){
    A(1)
}

B()
```

arguments 是一个对应于传递给函数的参数的类数组对象。是所有（`非箭头`）函数中都可用的局部变量。它类似于Array，但除了length属性和索引元素之外没有任何Array属性。typeof参数返回 'object'。

注意：现在在`严格模式`下，arguments对象已与过往不同。不再与函数的实际形参之间共享，同时caller属性也被移除。

```js
function A(n) {
  console.log(arguments);                 // Arguments [1, callee: ƒ, Symbol(Symbol.iterator): ƒ]
  console.log(A);                         // ƒ A(n)
  console.log(arguments.callee);          // ƒ A(n)
  console.log(A.caller)                   // null
  console.log(arguments.callee.caller)    // null
}

function B(){
  "use strict"
  A(1)
}

B()
```