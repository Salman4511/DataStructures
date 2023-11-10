void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int loc = partiton(arr, low, high);
    quickSort(arr, loc + 1, high);
    quickSort(arr, low, loc - 1);
  }
}

int partiton(List<int> arr, int low, int high) {
  int pivot = arr[low];
  int start = low;
  int end = high;

  while (start <= end) {
    while (start <= end && arr[start] <= pivot) {
      start++;
    }
    while (start <= end && arr[end] >= pivot) {
      end--;
    }
    if (start < end) {
      int tmp = arr[start];
      arr[start] = arr[end];
      arr[end] = tmp;
    }
  }
  int tmp = arr[low];
  arr[low] = arr[end];
  arr[end] = tmp;
  return end;
}

void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 64];
  int n = arr.length;

  print("Original array: $arr");
  quickSort(arr, 0, n - 1);
  print("Sorted array: $arr");
}
