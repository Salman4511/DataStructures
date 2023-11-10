import 'dart:io';

class Queue {
 final List<int> Array = [];

  bool isEmpty() => Array.isEmpty;
  int? peek() {
    if (!isEmpty()) {
      return Array.first;
    }
  }

  void enque(int data) {
    Array.add(data);
  }

  void delmid()
  {
    Queue tempq=Queue();
    int size=this.size();
    int mid=size~/2;

    for(int i=0;i<mid;i++)
    {
      tempq.enque(this.dequeue()!);
    }
    this.dequeue();

    while(!tempq.isEmpty())
    {
      this.enque(tempq.dequeue()!);
    }
  }

  int? dequeue() {
    if (isEmpty()) {
      print("Empty queue");
    } else {
        return Array.removeAt(0);
    }
  }
  int size()
  {
    return Array.length;
  }
}

void main() {
  Queue queue = Queue();

  queue.enque(7);
  queue.enque(8);
  queue.enque(9);
   queue.enque(10);
  queue.enque(11);


  print(queue.Array);
  queue.delmid();
  print(queue.Array);
 
}
