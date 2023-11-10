class Entry {
   String key;
   dynamic value;

  Entry(this.key, this.value);
}

class HashTable {
  int capacity;
   List<List<Entry>> table;

  HashTable(this.capacity) : table = List<List<Entry>>.generate(capacity, (_) => []);

  int _hashCode(String key) {
    int hash = 0;
    for (int i = 0; i < key.length; i++) {
      hash += key.codeUnitAt(i);
    }
    return hash % capacity;
  }

  void insert(String key, dynamic value) {
    int index = _hashCode(key);
    table[index].add(Entry(key, value));
  }

  dynamic get(String key) {
    int index = _hashCode(key);
    for (var entry in table[index]) {
      if (entry.key == key) {
        return entry.value;
      }
    }
    return null;
  }

  void remove(String key) {
    int index = _hashCode(key);
    table[index].removeWhere((entry) => entry.key == key);
  }
}

void main() {
  HashTable hashTable = HashTable(10);

  hashTable.insert("name", "John");
  hashTable.insert("age", 30);
  hashTable.insert("city", "New York");


  print(hashTable.get("name")); 
  print(hashTable.get("age")); 
  print(hashTable.get("city")); 

  
  hashTable.remove("age");
  print(hashTable.get("age")); 
}
