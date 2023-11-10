class Node {
  int data;
  Node? next;

  Node(this.data);
}

class Stack {
  Node? top; 
  int size = 0;

  void push(int element) {
    Node newNode = Node(element);
    newNode.next = top;
    top = newNode;
    size++;
  }

  int? pop() {
    if (top == null) {
      throw Exception("Stack is empty.");
    }

    int poppedValue = top!.data;
    top = top!.next;
    size--;
    return poppedValue;
  }

  int? peek() {
    if (top == null) {
      throw Exception("Stack is empty.");
    }
    return top!.data;
  }

  bool isEmpty() {
    return top == null;
  }

  int getSize() {
    return size;
  }

  void display() {
    if (top == null) {
      print("Stack is empty.");
    } else {
      Node? current = top;
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }
}

void main() {
  Stack stack = Stack();
  stack.push(10);
  stack.push(20);
  stack.push(30);

  stack.display(); 
  int? poppedValue = stack.pop();
  print("Popped value: $poppedValue"); 
  int? peekedValue = stack.peek();
  print("Peeked value: $peekedValue"); 

  print("Is stack empty? ${stack.isEmpty()}"); 

  int stackSize = stack.getSize();
  print("Stack size: $stackSize"); 
}
