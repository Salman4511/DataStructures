void main() {
  List<int> array = [1, 1,1,2, 1, 3, 4, 5, 6, 2, 3];
  print("Original array: $array");

  int n = array.length;
 

  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      if (array[i] == array[j]) {
          array.removeAt(j);
        n--;
        j--;
      }
    }
  }

  print("Array after removing duplicates: $array");
}


