class StackUsingQueues {
  List<int> queue1 = [];
  List<int> queue2 = [];

  bool get isEmpty => queue1.isEmpty;

  void push(int item) {
    queue1.add(item);
  }

  int pop() {
    if (isEmpty) {
      throw Exception("Stack is empty");
    }

    while (queue1.length > 1) {
      queue2.add(queue1.removeAt(0));
    }

    int poppedElement = queue1.removeAt(0);

    List<int> tempQueue = queue1;
    queue1 = queue2;
    queue2 = tempQueue;

    return poppedElement;
  }

  int peek() {
    if (isEmpty) {
      throw Exception("Stack is empty");
    }

    while (queue1.length > 1) {
      queue2.add(queue1.removeAt(0));
    }

    int topElement = queue1.first;

    List<int> tempQueue = queue1;
    queue1 = queue2;
    queue2 = tempQueue;

    return topElement;
  }

  int size() {
    return queue1.length;
  }
}

void main() {
  StackUsingQueues stack = StackUsingQueues();

  stack.push(1);
  stack.push(2);
  stack.push(3);
  
  stack.push(4);
  stack.push(5);

stack.pop();
print(stack.queue1);
}
