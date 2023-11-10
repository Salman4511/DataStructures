void mergesort(List<int> a, int low, int high) {
  if (low < high) {
    int mid = (low + high) ~/ 2;
    mergesort(a, low, mid);
    mergesort(a, mid + 1, high);
    mergearray(a, low, mid, high);
  }
}

void mergearray(List<int> a, int low, int mid, int high) {
  int i = low;
  int j = mid + 1;
  List<int> temp = [];

  while (i <= mid && j <= high) {
    if (a[i] <= a[j]) {
      temp.add(a[i]);
      i++;
    } else {
      temp.add(a[j]);
      j++;
    }
  }

  while (i <= mid) {
    temp.add(a[i]);
    i++;
  }

  while (j <= high) {
    temp.add(a[j]);
    j++;
  }

  for (int m = 0; m < temp.length; m++) {
    a[low + m] = temp[m];
  }
}

void main() {
  List<int> a = [4, 5, 7, 2, 9, 8, 99, 34, 67, 45];
  print("Array before sorting: $a");
  mergesort(a, 0, a.length - 1);
  print("Array after sorting: $a");
}
