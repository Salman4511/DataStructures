class stackwthqueue{
  List <int> queue1=[];
  List <int> queue2=[];

  void enqu(dynamic item){
    while(queue1.isNotEmpty){
     queue2.add(queue1.removeAt(0));
    }
    queue1.add(item);
    
    while(queue2.isNotEmpty){
      queue1.add(queue2.removeAt(0));
    }
  } 

  int deque(){
    if(queue1.isEmpty){
      throw Exception('empty');
    }
  return queue1.removeAt(0);
  }
  }
void main(){

  stackwthqueue q=stackwthqueue();

  q.enqu(10);
  q.enqu(20);
  q.enqu(30);
  q.enqu(40);
 print(q.queue1);
  print(q.deque());


print(q.queue1);
}

