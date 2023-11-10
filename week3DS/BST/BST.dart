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

  int height(tree? root) {
    if (root == null) {
      return -1; // Height of an empty tree is -1
    }
    
    int leftHeight = height(root.left);
    int rightHeight = height(root.right);

    return 1 + (leftHeight > rightHeight ? leftHeight : rightHeight);
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

bool ischeck(tree? root) {
  List<int> array = [];
  inorder(root, array);

  for (int i = 1; i < array.length; i++) {
    if (array[i] <= array[i - 1]) {
      return false;
    }
  }
  return true;
}

void inorder(tree? root, List<int> array) {
  if (root == null) {
    return;
  }

  inorder(root.left, array);
  array.add(root.data);
  inorder(root.right, array);
}

void bfs(tree? root)
{
  Set visited={};
  List<tree> q=[];
  q.add(root!);
  while(q.isNotEmpty){
    tree current=q.removeAt(0);
     print(current.data);
     if(current.left!=null){
      q.add(current.left!);
     }
     if(current.right!=null){
      q.add(current.right!);
     }
  }
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
  bfs(root);

  // final n = search(root, 40);

  // if (n != null) {
  //   print("found");
  // } else {
  //   print("npot found");
  // }
}
