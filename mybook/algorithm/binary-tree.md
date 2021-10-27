# 二叉排序树

  - [什么是二叉排序树？](https://baike.baidu.com/item/%E4%BA%8C%E5%8F%89%E6%8E%92%E5%BA%8F%E6%A0%91/10905079?fromtitle=%E6%8E%92%E5%BA%8F%E4%BA%8C%E5%8F%89%E6%A0%91&fromid=3755471&fr=aladdin)
  - 二叉排序树的代码实现

## 什么是二叉排序树？ 
---

二叉排序树（Binary Sort Tree），又称二叉查找树（Binary Search Tree），亦称二叉搜索树。是数据结构中的一类。在一般情况下，查询效率比链表结构要高。

![概序图1.png](https://bkimg.cdn.bcebos.com/pic/94cad1c8a786c9179df9bed6c93d70cf3ac75763?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto)

![概序图3.png](https://bkimg.cdn.bcebos.com/pic/1ad5ad6eddc451da10fe7fbeb7fd5266d016325e?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto)

## 二叉排序树的代码实现
---

```javascript
  function BinaryTree() {
    // 节点信息
    var Node = function(key) {
      this.key = key;
      this.left = null;
      this.right = null;
    }

    // 初始化树
    var root = null;

    // 递归插入树节点
    var insertNode = function(node, newNode) {
      if (newNode.key < node.key) {
        if (node.left === null) {
          node.left = newNode;
        } else {
          insertNode(node.left, newNode);
        }
      } else {
        if (node.right === null) {
          node.right = newNode;
        } else {
          insertNode(node.right, newNode);
        }
      }
    }

    this.insert = function(key) {
      const newNode = new Node(key);
      if (root === null) {
        root = newNode;
      } else {
        insertNode(root, newNode)
      }
    }

    this.getTree = function() {
      return root;
    }
  }

  const nodes = [8, 3, 10, 1, 6, 14, 4, 7, 13];
  const binaryTree = new BinaryTree();
  nodes.forEach(node => {
    binaryTree.insert(node);
  })


  console.log(binaryTree.getTree())
```