class Node {
  int key;
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
    if (root == null) {
      return null; // Return null for an empty tree
    }

    Node current = root;
    while (current.left != null) {
      current = current.left!;
    }
    return current.key;
  }

  int? max(Node? root) {
    if (root == null) {
      return null; // Return null for an empty tree
    }

    Node current = root;
    while (current.right != null) {
      current = current.right!;
    }
    return current.key;
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

  print("Inorder Traversal of the BST:");
  bst.inorderTraversal();

  int? minimum = bst.min(bst._root); // Calling the min method
  if (minimum != null) {
    print("Minimum value in the BST: $minimum");
  } else {
    print("The BST is empty.");
  }

  int? maximum = bst.max(bst._root); // Calling the max method
  if (maximum != null) {
    print("Maximum value in the BST: $maximum");
  } else {
    print("The BST is empty.");
  }
}
