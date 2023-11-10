class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value) {
    left = null;
    right = null;
  }
}

class BinarySearchTree {
  Node? root;

  BinarySearchTree() {
    root = null;
  }

  void insert(int value) {
    Node newNode = Node(value);
    if (root == null) {
      root = newNode;
    } else {
      insertNode(root, newNode);
    }
  }

  void insertNode(Node? root, Node newNode) { 
    if (root == null) { 
      return;
    }
    if (newNode.value < root.value) {
      if (root.left == null) {
        root.left = newNode;
      } else {
        insertNode(root.left, newNode);
      }
    } else {
      if (root.right == null) {
        root.right = newNode;
      } else {
        insertNode(root.right, newNode);
      }
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

 
}
