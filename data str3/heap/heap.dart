void buildMinHeap(List<int> array) {
  int n = array.length;
  

  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    heapify(array, n, i);
  }
}                                  

void heapify(List<int> array, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && array[left] < array[largest]) {
    largest = left;
  }

  if (right < n && array[right] < array[largest]) {
    largest = right;
  }

  if (largest != i) {
    int temp = array[i];
    array[i] = array[largest];
    array[largest] = temp;

    heapify(array, n, largest);
  }

  
}
void heapifyUp(List<int> array, int i) {
  int parent = (i - 1) ~/ 2;
  while (i > 0 && array[i] < array[parent]) {
    int temp = array[i];
    array[i] = array[parent];
    array[parent] = temp;

    i = parent;
    parent = (i - 1) ~/ 2;
  }
}

void insert(List<int> array, int value) {
  array.add(value);
  heapifyUp(array, array.length - 1);
}
int deleteMax(List<int> array) {
  if (array.isEmpty) {
    throw Exception("Heap is empty");
  }

  int maxElement = array[0];
  int lastElement = array.removeLast();

  if (array.isNotEmpty) {
    array[0] = lastElement;
    heapify(array, array.length, 0);
  }

  return maxElement;
}


void main() {
  List<int> numbers = [4, 10, 3, 5, 1];
  
  print("Original array:");
  print(numbers);

  buildMinHeap(numbers);

  print("Min Heap:");
  print(numbers);

  print(deleteMax(numbers));

  // insert(numbers, 20);
  // print(numbers);
  
  
}
