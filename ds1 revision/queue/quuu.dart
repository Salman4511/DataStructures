class queue{
  List <int> data=[];
  int front=0;
  int rear=-1;


  void enque(dynamic item){
    rear++;
    if(rear>=data.length){
      data.add(item);

    }else{
      data[rear]=item;
    }
    
    }

    dynamic deque(){
     int toppp= data[front];
     front--;
     return toppp;
    }

   dynamic peek(){
    return data[front];
   }   
}

void main(){

  queue qq=queue();


  qq.enque(10);
  qq.enque(20);
  qq.enque(30);

  print(qq.deque());
  print(qq.data);
}

