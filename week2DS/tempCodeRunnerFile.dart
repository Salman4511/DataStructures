List<int> common(List<int> a1, List<int> a2) {
  Map<int, int> HashTable = {};

  for (var items in a1) {
    HashTable[items] = 1;
  }

  List<int> commonelements = [];
  for (var items in a2) {
    if (HashTable.containsKey(items)) {
      commonelements.add(items);
    }
  }
  return commonelements;
}

void main() {
  List<int> a1 = [1, 2, 3, 5, 6, 7, 8, 9];
  List<int> a2 = [2, 3, 4, 5, 6, 7, 8];
  List<int> c = common(a1, a2);
  print(c);
}
