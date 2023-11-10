class Node {
  int data;
  Node? next;

  Node(this.data);
}

class Queue {
  Node? front;
  Node? rear; 
  int size = 0;

  void enqueue(int element) {
    Node newNode = Node(element);
    if (rear == null) {
      front = newNode;
      rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
    size++;
  }

  int? dequeue() {
    if (front == null) {
      throw Exception("Queue is empty.");
    }

    int dequeuedValue = front!.data;
    front = front!.next;
    if (front == null) {
      rear = null;
    }
    size--;
    return dequeuedValue;
  }

  int? peek() {
    if (front == null) {
      throw Exception("Queue is empty.");
    }
    return front!.data;
  }

  bool isEmpty() {
    return front == null;
  }

  int getSize() {
    return size;
  }

  void display() {
    if (front == null) {
      print("Queue is empty.");
    } else {
      Node? current = front;
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }
}

void main() {
  Queue queue = Queue();
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);

  queue.display();  

  int? dequeuedValue = queue.dequeue();
  print("Dequeued value: $dequeuedValue"); 

  int? peekedValue = queue.peek();
  print("Peeked value: $peekedValue");

  print("Is queue empty? ${queue.isEmpty()}"); 

  int queueSize = queue.getSize();
  print("Queue size: $queueSize"); 
}
