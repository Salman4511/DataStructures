class MaxHeap {
  List<int> heap = [];
  

  void insert(int value) {
    heap.add(value);

    heapifyup(heap.length-1);
 
  }

  void heapifyup(int index){
       while (index > 0) {
      int parentIndex = (index-1) ~/ 2;

      if (heap[index] <= heap[parentIndex]) {
        break;
      }
      int temp = heap[index];
      heap[index] = heap[parentIndex];
      heap[parentIndex] = temp;
      index = parentIndex;
    }
  }

  void heapifyDown(int index) {
    int left = 2 * index + 1;
    int right = 2 * index + 2;
    int largest = index;

    if (left < heap.length && heap[left] > heap[largest]) {
      largest = left;
    }
    if (right < heap.length && heap[right] >   heap[largest]) {
      largest = right;
    }

    if (largest != index) {
      int temp = heap[index];
      heap[index] = heap[largest];
      heap[largest] = temp;
      heapifyDown(largest);
    }
  }

  int extractMax() {
    if (heap.isEmpty) {
      throw Exception("Heap is empty!");
    }

    int max = heap[0];
    heap[0] = heap[heap.length - 1];
    heap.removeLast();
    heapifyDown(0);
    return max;
  }
  

}




void main() {
  MaxHeap maxHeap = MaxHeap();

  maxHeap.insert(7);
  maxHeap.insert(15);
  maxHeap.insert(10);
  maxHeap.insert(20);
  maxHeap.insert(21);
  maxHeap.insert(24);

   print("Max Heap after extraction: ${maxHeap.heap}");

  int n=maxHeap.extractMax();
  print("max element is $n");
  
  
  print("Max Heap after extraction: ${maxHeap.heap}");


}
