void heapSort(List<int> array) {
  int n = array.length;

  // Build a max heap
  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    heapify(array, n, i);
  }

  // Extract elements from the heap one by one
  for (int i = n - 1; i >= 0; i--) {
    int temp = array[0];
    array[0] = array[i];
    array[i] = temp;

    heapify(array, i, 0);
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

void main() {
  List<int> numbers = [12, 11, 13, 5, 6, 7];
  
  print("Original array:");
  print(numbers);

  heapSort(numbers);

  print("Array after Heap Sort:");
  print(numbers);
}
