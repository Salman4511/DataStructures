class tree {
  tree? right;
  tree? left;
  dynamic data;

  tree(this.data) {
    right = null;
    left = null;
    this.data = data;
  }
}

tree? root;

void add(int val) {
  root = insert(root, val);
}

tree? insert(tree? root, dynamic data) {
  if (root == null) {
    return tree(data);
  }
  if (data < root.data) {
    root.left = insert(root.left, data);
  } else if (data > root.data) {
    root.right = insert(root.right, data);
  }
  return root;
}

tree? search(tree? root, int val) {
  if (root == null || root.data == val) {
    return root;
  }

  if (val < root.data) {
    return search(root.left, val);
  } else {
    return search(root.right, val);
  }
}

tree? minval(tree? root) {
  if (root == null) {
    return null;
  }
  while (root!.left != null) {
    root = root.left;
  }
  return root;
}

tree? delete(tree? root, int val) {
  if (root == null) return root;

  if (val < root.data) {
    root.left = delete(root.left, val);
  } else if (val > root.data) {
    root.right = delete(root.right, val);
  } else {
    if (root.left == null) {
      return root.right;
    } else if (root.right == null) {
      return root.left;
    }

    tree? min = minval(root.right);
    root.data = min!.data;
    root.right = delete(root.right, min.data);
  }   
  return root;
}

//

void inorder(tree? root) {
  if (root == null) {
    return;
  }

  inorder(root.left);
  print(root.data);
  inorder(root.right);
}

int nodeCount(tree? root) {
  if (root == null) {
    return 0;
  }

  int leftCount = nodeCount(root.left);
  int rightCount = nodeCount(root.right);
  return leftCount + rightCount + 1;
}
  int height(tree? root) {
    if (root == null) {
      return -1; // Height of an empty tree is -1
    }
    
    int leftHeight = height(root.left);
    int rightHeight = height(root.right);
    if(leftHeight> rightHeight)
    {
      return 1+leftHeight;

    }
    else{
      return 1+rightHeight;
    }

    
  }
void mirror(tree? root) {
  if (root == null) {
    return;
  }

  // Swap the left and right subtrees
  tree? temp = root.left;
  root.left = root.right;
  root.right = temp;

  // Recursively mirror the left and right subtrees
  mirror(root.left);
  mirror(root.right);
}

dynamic maxElement(tree? root) {
  if (root == null) {
    return null;
  }
  while (root!.right != null) {
    root = root.right;
  }
  return root.data;
}

dynamic minElement(tree? root) {
  if (root == null) {
    return null;
  }
  while (root!.left != null) {
    root = root.left;
  }
  return root.data;
}

dynamic secondSmallest(tree? root) {
  tree? current = root;
  tree? prev = null;

  while (current != null && current.left != null) {
    prev = current;
    current = current.left;
  }
  if (prev != null) {
    return prev.data;
  }

  return null;
}

dynamic secondLargest(tree? root) {
  tree? current = root;
  tree? prev = null;

  while (current != null && current.right != null) {
    prev = current;
    current = current.right;
  }
  if (prev != null) {
    return prev.data;
  }
  return null;
}



void main() {
  root = null;
  add(50);
  add(30);
  add(20);
  add(40);
  add(70);
  add(60);
  add(80);
    add(10);
inorder(root);
 int treeHeight =height(root);
  print("Height of the tree: $treeHeight");


  // print("${secondSmallest(root)}");
  //   print("${secondLargest(root)}");


  

 
}



