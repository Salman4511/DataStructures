class node{
  dynamic key;
  node? left;
  node? right;

  node(this.key){
  left=null;
  right=null;
  }
}

class tree{
  node? root;

  tree(){
    root=null;
  }

  void insert(int key){
    node? newnode=node(key);

    if(root==null){
      root=newnode;
    }
    else{
      insertnode(root,newnode);
    }
  }

  void insertnode(node? root,node newnode){
    if(root==null){
      return;
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

  int max(node? root){
    while(root!.right!=null){
      root=root.right;
    }
    return root.key;
  }
}

void main(){
  tree tr=tree();

  tr.insert(2);
  tr.insert(3);
  tr.insert(14);
  tr.insert(8);
  tr.insert(10);

  print(tr.max(tr.root?.right));
}