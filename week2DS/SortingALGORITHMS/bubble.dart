void bubbleSort(List<int> arr) {
  int n = arr.length;
  int flag;

  for (int i = 0; i < n - 1; i++) {
    int flag = 0;
    for (int j = 0; j < n - 1 - i; j++) {
      if (arr[j] > arr[j + 1]) {
        int tmp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = tmp;
        flag = 1;
      }
    }
    if (flag == 0) break;
  }
}

void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];

  print("Original array: $arr");
  bubbleSort(arr);
  print("Sorted array: $arr");
}
