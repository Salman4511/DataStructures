class node{
  dynamic key;
  node? left;
  node? right;

  node(this.key){
    left=null;
    right=null;
  }
}

class bintree{
  node? root;

  bintree(){
    root=null;
  }

  void insert(int key){
    final newnode=node(key);
    if (root==null){
      root=newnode;
    }
    else{
      insertnode(root,newnode);
    }
  }

  void insertnode(node? root, node newnode){
    if(root==null){
      return null;
    }
    if(newnode.key<root.key){
      if(root.left==null){
        root.left=newnode;
      }else{
        insertnode(root.left, newnode);
      }
    }else{
      if(root.right==null){
        root.right=newnode;
      }else{
        insertnode(root.right, newnode);
      }
    }
  }

  void inotrav(){
    ino(root);
  }

  void ino(node? root){
    if(root!=null){
    ino(root.left);
    print(root.key);
    ino(root.right);
    }
  }

  void max(){
    while(root?.right!=null){
      root=root?.right;
    }
    print( root?.key);
  }
void min(){
  
    while(root?.left!=null){
      root=root?.left;
    }
    print( root?.key);
  }

  int close(int target){
    return findclose(root,target,root!.key);
  }

  int findclose(node? root, int target, int close){
  
  if(root==null){
    return close;
  }
  if((root.key-target).abs() < (close-target).abs()){
    close= root.key;
  }
  if(target<root.key){
    return findclose(root.left, target, close);
  }else if(target>root.key){
    return findclose(root.right, target, close);
  }
  return close;
  }

  dynamic del (node? root, int key){
    if(root==null){
      return null;

    }
    if(root.key>key){
      root.left=del(root.left, key);
    }else if(root.key<key){
      root.right=del(root.right, key);
    }else{
      if(root.left==null){
        return root.right;
      }else if(root.right==null){
        return root.left;
      }else {
         root.key=minvalue(root.right);
         root.right=del(root.right, key);
      }
    }
    return root;
  }
  int minvalue(node? root){
    while(root?.left!=null){
      root=root?.left;
    }
return root?.key;
  }


 bool isvalidate(){
  List <int> values=[];
  ino1(root,values);

  for(int i=1;i<values.length;i++){
    if(values[i]<values[i-1]){
      return false;
    }
    
  }return true;
 }

 ino1(node? root,List<int>  key){
  if(root!=null){
    ino1(root.left, key);
    key.add(root.key);
    ino1(root.right, key);
  }
 }
  }

  void main(){
    bintree  bst = bintree();
  bst.insert(50);
  bst.insert(30);
  bst.insert(70);
  bst.insert(20);
  bst.insert(40);
  bst.insert(60);
  bst.insert(80);

  // bst.inotrav();
  // bst.max();

  // bst.min();

  // print(bst.close(42));
  // bst.del(bst.root, 60);
  // bst.inotrav();
  print(bst.isvalidate());

  }

