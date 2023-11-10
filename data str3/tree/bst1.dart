class node{
  dynamic value;
  node? left;
  node? right;

  node(this.value){
    left=null;
    right=null;
  }
}

class binarysearchtree{
  node? root;

  binarysearchtree(){
    root=null;

  }

  void insert(dynamic value){
    node newnode=node(value);

    if(root==null){
      root=newnode;
    }else{
      insertnode(root,newnode);
    }
  }

  insertnode(node? root,node newnode){
   if(root==null){
    return;
   }
   if(newnode.value < root.value){
    if(root.left==null){
      root.left=newnode;
    }else{
      insertnode(root.left, newnode);
    }
   }
   else{
     if(root.right==null){
      root.right=newnode;

     }else{
      insertnode(root.right, newnode);
     }
   }
   }

   bool search(dynamic value){
  
    return searchnode(root,value);
   }

   bool searchnode(node? root,dynamic value){ 
     if(root==null){
      return false;
    }
     if(value==root.value){
      return true;
     }
     else if (value < root.value) {
      return searchnode(root.left, value);
    } else {
      return searchnode(root.right, value);
    }
     }
    
      void printprimenum(){
        primeprint(root);
      }
      bool sprime(int num){
      if(num<=1){
        return false;
      }
      if(num<=3){
        return true;
      }
      for(int i=2;i*i<=num;i++){
        if(num%i==0){
          return false;
        }
      }
      return true;
      }

      void primeprint(node? root){
        if(root!=null){
          primeprint(root.left);
          if(sprime(root.value)){
            print(root.value);
          }
          primeprint(root.right);
        }

      }


     void inordertraversal(){
      inoder(root);
     }
     void inoder(node? root){
      if(root!=null){
        inoder(root.left);
        print(root.value);
        inoder(root.right);
      }
     }
      int findDepth(node? root) {
    if (root == null) {
      return 0;
    }
    int leftDepth = findDepth(root.left);
    int rightDepth = findDepth(root.right);
    return 1 + (leftDepth > rightDepth ? leftDepth : rightDepth);
  }
  int iifindDepth(dynamic value) {
    return getNodeDepth(root, value, 0);
  }

  int getNodeDepth(node? root, dynamic value, int depth) {
    if (root == null) {
      return -1; // Node not found
    }
    
    if (value == root.value) {
      return depth; // Node found
    } else if (value < root.value) {
      return getNodeDepth(root.left, value, depth + 1);
    } else {
      return getNodeDepth(root.right, value, depth + 1);
    }
  }
}
   

    void main(){
      binarysearchtree bs=binarysearchtree();

      bs.insert(1);
      bs.insert(2);
      bs.insert(3);
      bs.insert(4);
      bs.insert(5);

      // bs.inordertraversal();

      // if(bs.search(120)){
      //   print("true");
      // }else{
      //   print("false");
      // }
      // bs.printprimenum();
      print(bs.findDepth(bs.root));
      
    }