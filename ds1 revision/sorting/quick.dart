void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    // Partition the array and get the pivot index
    int pivotIndex = partition(arr, low, high);

    // Recursively sort the two subarrays
    quickSort(arr, low, pivotIndex - 1);
    quickSort(arr, pivotIndex + 1, high);
  }
}

int partition(List<int> arr, int low, int high) {
  // Choose the rightmost element as the pivot
  int pivot = arr[high];

  // Index of the smaller element
  int i = low - 1;

  for (int j = low; j < high; j++) {
    // If the current element is smaller than or equal to the pivot
    if (arr[j] <= pivot) {
      i++;
      // Swap arr[i] and arr[j]
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  // Swap the pivot element (arr[high]) with the element at the (i+1)th position
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  // Return the index of the pivot element
  return i + 1;
}

void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];
  int n = arr.length;

  print("Original array: ${arr}");
  quickSort(arr, 0, n - 1);
  print("Sorted array: ${arr}");
}
