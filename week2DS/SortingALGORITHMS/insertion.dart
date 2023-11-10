import 'dart:io';

void Insertion(List<int> a) {
  int tmp;
  int n = a.length;
  for (int i = 1; i < n; i++) {
    tmp = a[i];
    int j = i - 1;
    while (j >= 0 && a[j] > tmp) {
      a[j + 1] = a[j];
      j--;
    }
    a[j + 1] = tmp;
  }
}

void main() {
  List<int> a = [1, 3, 8, 9, 23, 5, 4, 0];

  print(a);
  Insertion(a);
  print(a);
}
