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
    node newnode = node(key);

    if(root==null){
      root=newnode;
    }else{
    insernode(root,newnode);
  }
  }

  void insernode(node? root, node newnode){
    if(root==null){
      return;
    }
    if(newnode.key<root.key){
      if(root.left==null){
        root.left=newnode;
      }else{
        insernode(root.left, newnode);
      }
    }else {
      if(root.right==null){
        root.right=newnode;
      }else{
        insernode(root.right, newnode);
      }
    }
  }
  void ino(node? root){
    if(root!=null){
      ino(root.left);
      print(root.key);
      ino(root.right);
    }
  }

  bool search(int key){
    return searchnode(root,key);
  }

  bool searchnode(node? root,int key){
    if(root==null){
      return false;
    }
    if(root.key==key){
      return true;
    }
    else if(key<root.key){
     return searchnode(root.left, key);
    }else{
     return searchnode(root.right, key);
    }
    
  }

  void primenum(){
    printprime(root);
  }
  bool isprime(int key){
    if(key<=1){
      return false;
    }
    if(key<=3){
      return false;
    }
    for(int i=2;i*i<key;i++){
      if(key%i==0){
        return false;
      }
    }
    return true;
    }

    void printprime(node? root){
      if(root!=null){
        printprime(root.left);
      if(isprime(root.key)){
        print(root.key);
      }
      printprime(root.right);
    }
  }

    bool isvalid(){
      List <int> values=[];
      ino1(root,values);

      for(int i=1;i<values.length;i++){
        if(values[i]<=values[i-1]){
          return false;
        }
      }
      return true;

    }

    void ino1(node? root,List <int> values){
      if(root!=null){
        ino1(root.left, values);
        values.add(root.key);
        ino1(root.right, values);
      }
    }

    int close(int target){
      return closest(root, target, root!.key );
    }

    int closest(node? root, int target ,int close){
      if(root==null){
        return close;
      }
      if((root.key-target).abs()<(close-target).abs()){
        close =root.key;
      }

      if(target<root.key){
        return closest(root.left, target, close);
      }else if(target>root.key){
        return closest(root.right, target, close);
      }else{
        return close;
      }
    }

    dynamic del(node? root,int value){
      if(root==null){
        return ;
      }
      if(value<root.key){
       root.left=del(root.left, value);
      }else if(value>root.key){
        root.right=del(root.right, value);
      }
      else{
        if(root.right==null){
          return root.left;
        }else if(root.left==null){
          return root.right;
        }else{
          root.key=minva(root.right);
          root.right=del(root.right, root.key);
        }
      }
    }

    int minva(node? root){
      while(root!.left!=null){
        root=root.left;
      }
      return root.key;
    }
    }


void main(){
  tree tr=tree();

  tr.insert(1);
  tr.insert(2);
  tr.insert(4);
  tr.insert(3);
  tr.insert(5);

  tr.ino(tr.root);

  print (tr.search(8));
  print(tr.isvalid());
}