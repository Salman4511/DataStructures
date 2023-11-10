class stack{
  List <int> data=[];
  int top=-1;
 


  void push(dynamic item){
    top++;
    if(top>=data.length){
      data.add(item);

    }else{
      data[top]=item;
    }
    
    }

    dynamic pop(){
     int toppp= data[top];
     data.removeLast();
     return toppp;
    }

   dynamic peek(){
    return data[top];
   }   
}

void main(){

  stack qq=stack();


  qq.push(10);
  qq.push(20);
  qq.push(30);

  print(qq.pop());
  print(qq.data);
  // qq.mid();
  // print(qq.data);
}

