class QueueUsingStacks {
  List<int> enqueueStack = [];
  List<int> dequeueStack = [];

  bool get isEmpty => enqueueStack.isEmpty && dequeueStack.isEmpty;

  void enqueue(int item) {
    enqueueStack.add(item);
  }

  int dequeue() {
    if (isEmpty) {
      throw Exception("Queue is empty");
    }

   
      while (enqueueStack.isNotEmpty) {
        dequeueStack.add(enqueueStack.removeLast());
      }
    

    return dequeueStack.removeLast();
  }

  void returnToEnqueueStack() {
    while (dequeueStack.isNotEmpty) {
      enqueueStack.add(dequeueStack.removeLast());
    }
  }

  int size() {
    return enqueueStack.length + dequeueStack.length;
  }
}

// Example usage:
void main() {
  QueueUsingStacks queue = QueueUsingStacks();

  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);


  print(queue.dequeue()); // Output: 1
   queue.returnToEnqueueStack(); 
  print("Elements in enqueueStack: ${queue.enqueueStack}");

}
