class node{
  dynamic key;
  node? left;
  node? right;

  node(this.key){
    left=null;
    right=null;
  }
}

class binarystree{
  node? root;

  binarystree(){
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
     if(newnode.key < root.key){
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
void inordertrav(){
  inorder(root);
}
    void inorder(node? root){
      if(root!=null){
       
   inorder(root.left);
   print(root.key);
   inorder(root.right);
      }
    
    }

  

  bool search(int key){
   return searchnode(root,key);
  }

  bool searchnode(node? root,int key){
      
   if(root==null){
    return false;
   }
   if(key==root.key){
     return true;

    }
    else if(key<root.key){
      return searchnode(root.left, key);
    }else{
    return  searchnode(root.right, key);
    }
    
   }

int minvalue(node? root){
  while(root!.left!=null){
   root=root.left;
  }
  return root.key;
}

dynamic delete(node? root, int key){

  if(root==null){
    return null;
  }
  if(key<root.key){
    root.left=delete(root.left, key);
  }
  else if(key>root.key){
    root.right=delete(root.right, key);
  }else{
    if(root.left==null){
      return root.right;
    }else if(root.right==null){
      return root.left;
    }
      
  
root.key=minvalue(root.right);
root.right=delete(root.right, root.key);
}
return root;
}

bool isvalid(){
  List <int> ino=[];
  inoder22(root,ino);
  for(int i=1;i<ino.length;i++){
    if(ino[i]<=ino[i-1]){
      return false;
    }
  }
  return true;
}
 void inoder22(node? root, List <int> key){
if(root!=null){
  inoder22(root.left, key);
  key.add(root.key);
  inoder22(root.right, key);
}
 }

 int max(node? root){
  while(root!.right!=null){
    root=root.right;
  }
  return root.key;
 }

 int  closestvalue(int target){
  return find(root,target,root!.key);
 }

 int find(node? root,int target,int closestvalue){
  if(root==null){
    return closestvalue;
  }
  if((root.key-target).abs()<(closestvalue-target).abs()){
    closestvalue=root.key;
  }
  if(target<root.key){
    return find(root.left, target, closestvalue);
  }else if(target>root.key){
    return find(root.right, target, closestvalue);
  }else{
    return closestvalue;
  }
 }
 }


  


  void main(){
    binarystree st=binarystree();

    st.insert(10);
    st.insert(40);
    st.insert(20);
    st.insert(60);
    st.insert(50);
  st.inordertrav();
  print(st.search(222));

st.delete(st.root, 40);
   print(st.isvalid());
   print(st.max(st.root));
  print(st.closestvalue(45));
  }
