List <int> quickSort(List<int> arr, int low, int high) {
  if (low >= high) {
    return arr;
  }

  int pivot = arr[(low + high) ~/ 2];
  int i = low;
  int j = high;

  while (i < j) {
    while (arr[i] > pivot) {
      i++;
    }
    while (arr[j] < pivot) {
      j--;
    }
    if (i <= j) {
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      i++;
      j--;
    }
  }

  quickSort(arr, low, j);
  quickSort(arr, i, high);
  return arr;
}


void main(){
  List <int> arr=[5,7,3,9,8,2,7,3];
  //  quickSort(arr, 0, arr.length-1);
   print(quickSort(arr, 0, arr.length-1));
}