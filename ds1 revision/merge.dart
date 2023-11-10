List<int> mergeSort(List<int> array) {
  if (array.length < 2) {
    return array;
  }

  int mid = array.length ~/ 2;
  List<int> leftArray = array.sublist(0, mid);
  List<int> rightArray = array.sublist(mid);

  return merge(mergeSort(leftArray), mergeSort(rightArray));
}

List<int> merge(List<int> leftArray, List<int> rightArray) {
  List<int> sorted = [];
  while (leftArray.isNotEmpty && rightArray.isNotEmpty) {
    if (leftArray[0] > rightArray[0]) {
      sorted.add(leftArray.removeAt(0));
    } else {
      sorted.add(rightArray.removeAt(0));
    }
  }
  sorted.addAll(leftArray);
  sorted.addAll(rightArray);

  return sorted;
}

void main() {
  List<int> array = [23, 4, 5, 67, 5, 45, 6];
  // List<int> sortedArray = mergeSort(array);
  print(mergeSort(array));
}
