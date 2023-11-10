class Entry {
  final int key;
  final dynamic value;
  Entry? next;

  Entry(this.key, this.value);
}

class HashTable {
static int capacity = 10;  
final List<Entry?> table;

  HashTable() : table = List<Entry?>.filled(capacity, null);

  int hashCod(int key) {
    return key % capacity;
  }

  void insert(int key, dynamic value) {
    int index = hashCod(key);
    Entry? entry = Entry(key, value); 

    if (table[index] == null) {
      table[index] = entry;
    } else {
      Entry? current = table[index];
      while (current!.next != null) {
        current = current.next;
      }
      current.next = entry;
    }
  }

  dynamic lookup(int key) {
    int index = hashCod(key);
    Entry? current = table[index];

    while (current != null) {
      if (current.key == key) {
        return current.value;
      }
      current = current.next;
    }

    return null;
  }

  void remove(int key) {
    int index = hashCod(key);
    Entry? current = table[index];
  

    while (current!.next != null) {
      if (current.next!.key == key) {
        current.next=current.next!.next;
        return;
      }
      current = current.next;
    }
  }
}

void main() {
  HashTable hashTable = HashTable();

  hashTable.insert(1, "John");
  hashTable.insert(2, "Jane");
  hashTable.insert(11, "Bob");
  hashTable.insert(21, "Alice");

  print(hashTable.lookup(1)); // Output: John
  print(hashTable.lookup(2)); // Output: Jane
  print(hashTable.lookup(11)); // Output: Bob
  print(hashTable.lookup(21)); // Output: Alice

  hashTable.remove(1);
  print(hashTable.lookup(1)); 
}
