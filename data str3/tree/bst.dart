

class Node {
  dynamic key;
  Node? left;
  Node? right;

  Node(this.key) {
    left = null;
    right = null;
  }
}

class BinarySearchTree {
  Node? _root;

  BinarySearchTree() {
    _root = null;
  }
  


  void insert(int key) {
    final newNode = Node(key);
    if (_root == null) {
      _root = newNode;
    } else {
      _insertNode(_root, newNode);
    }
  }

  void _insertNode(Node? root, Node newNode) {
    if (root == null) {
      return;
    }

    if (newNode.key < root.key) {
      if (root.left == null) {
        root.left = newNode;
      } else {
        _insertNode(root.left, newNode);
      }
    } else {
      if (root.right == null) {
        root.right = newNode;
      } else {
        _insertNode(root.right, newNode);
      }
    }
  }

  bool search(int key) {
    return _searchNode(_root, key);
  }

  bool _searchNode(Node? root, int key) {
    if (root == null) {
      return false;
    }

    if (key == root.key) {
      return true;
    } else if (key < root.key) {
      return _searchNode(root.left, key);
    } else {
      return _searchNode(root.right, key);
    }
  }

  void inorderTraversal() {
    _inorder(_root);
  }

  void _inorder(Node? root) {
    if (root != null) {
      _inorder(root.left);
      print(root.key);
      _inorder(root.right);
    }
  }

  void preorderTraversal() {
    _preorder(_root);
  }

  void _preorder(Node? root) {
    if (root != null) {
      print(root.key);
      _preorder(root.left);
      _preorder(root.right);
    }
  }
  int? min(Node? root) {
    if (root?.left == null) {
      return root?.key;
    } else {
      return min(root?.left);
    }
  }

  int? max(Node? root) {
    if (root?.right == null) {
      return root?.key;
    } else {
      return max(root?.right);
    }
  }
    int closestValue(int target) {
    return findClosestValue(_root, target, _root!.key);
  }

  int findClosestValue(Node? _root, int target, int closestValue) {
    if (_root == null) {
      return closestValue;
    }

    if ((_root.key - target).abs() < (closestValue - target).abs()) {
      closestValue = _root.key;
    }

    if (target < _root.key) {
      return findClosestValue(_root.left, target, closestValue);
    } else if (target > _root.key) {
      return findClosestValue(_root.right, target, closestValue);
    } else {
      return closestValue;
    }
  }

  int minvalue(Node? root){
  while(root!.left!=null){
    root=root.left;
  }
  return root.key;
}


  dynamic delete(Node? root,int value){
  if(root==null){
    return null;
  }
  if(value>root.key){
    root.right=delete(root.right, value);
  }
  else if(value<root.key){
    root.left=delete(root.left, value);
  }
  else{
    if(root.left==null){
      return root.right;
    }
    else if(root.right==null){
      return root.left;
    } 

  root.key=minvalue(root.right);
  root.right=delete(root.right, root.key);
  }
return root;
}


  bool isValidBST() {
    List<int> inorderValues = [];
    _inorder1(_root, inorderValues);

    for (int i = 1; i < inorderValues.length; i++) {
      if (inorderValues[i] <= inorderValues[i - 1]) {
        return false;
      }
    }
    return true;
  }

  void _inorder1(Node? root, List<int> value) {
    if (root != null) {
      _inorder1(root.left, value);
      value.add(root.key);
      _inorder1(root.right, value);
    }
  }
}


void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(50);
  bst.insert(30);
  bst.insert(70);
  bst.insert(20);
  bst.insert(40);
  bst.insert(60);
  bst.insert(80);
  

//   print("Inorder Traversal of the BST:");
//   bst.inorderTraversal();

  // int key = 100;
  // if (bst.search(key)) {
  //   print("$key is present in the BST.");
  // } else {
  //   print("$key is not present in the BST.");
  // }

//  print(bst.min(bst._root)) ;
//  print(bst.max(bst._root));

//  print(bst.closestValue(52));
 bst.delete(bst._root, 70);
    bst.inorderTraversal();

   print( bst.isValidBST());
   print(bst);

  
}
