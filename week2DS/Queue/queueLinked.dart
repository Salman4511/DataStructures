class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class Queue {
  Node? front;
  Node? rear;

  Queue() {
    front = null;
    rear = null;
  }

  void enqueue(int data) {
    Node newNode = Node(data);
    if (rear == null) {
      front = newNode;
      rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  void dequeue() {
    if (front == null) {
      throw Exception("Queue is empty");
    }
    front = front!.next;

  }

  void display() {
    Node? temp = front;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main() {
  Queue q = Queue();
  q.enqueue(1);
  q.enqueue(2);
  q.enqueue(3);

  q.display();
  q.dequeue();
  q.display();
}
