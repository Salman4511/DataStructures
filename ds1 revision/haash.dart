class Node<K, V> {
  K key;
  V value;
  Node<K, V>? next;

  Node(this.key, this.value);
}

class HashTable<K, V> {
  late List<Node<K, V>?> _buckets;
  int _capacity;

  HashTable(this._capacity) {
    _buckets = List.filled(_capacity, null);
  }

  int _hash(K key) {
    int hashCode = key.hashCode;
    return hashCode.abs() % _capacity;
  }

  void insert(K key, V value) {
    int index = _hash(key);
    Node<K, V>? newNode = Node(key, value);

    if (_buckets[index] == null) {
      _buckets[index] = newNode;
    } else {
      Node<K, V>? current = _buckets[index];

      // Traverse the linked list to find the last node
      while (current!.next != null) {
        if (current.key == key) {
          // Update value if the key already exists
          current.value = value;
          return;
        }
        current = current.next;
      }

      // Append the new node to the end of the linked list
      current.next = newNode;
    }
  }

  V? get(K key) {
    int index = _hash(key);
    Node<K, V>? current = _buckets[index];

    while (current != null) {
      if (current.key == key) {
        return current.value;
      }
      current = current.next;
    }

    return null; // Key not found
  }

  void remove(K key) {
    int index = _hash(key);
    Node<K, V>? current = _buckets[index];
    Node<K, V>? prev;

    while (current != null) {
      if (current.key == key) {
        if (prev == null) {
          // Remove the first node in the list
          _buckets[index] = current.next;
        } else {
          // Remove a node in the middle or end of the list
          prev.next = current.next;
        }
        return;
      }
      prev = current;
      current = current.next;
    }
  }

  void printHashTable() {
    for (int i = 0; i < _buckets.length; i++) {
      Node<K, V>? current = _buckets[i];
      while (current != null) {
        print("Index: $i, [Key: ${current.key}], [Value: ${current.value}]");
        current = current.next;
      }
    }
  }
}

void main() {
  HashTable hashTable = HashTable(10);
  hashTable.insert("apple", 1);
  hashTable.insert("banana", 2);
  hashTable.insert("orange", 3);
  hashTable.insert("orange", 15);
    hashTable.insert("2", 3);
  hashTable.insert("2", 4);


  

  hashTable.remove("banana");
  print(hashTable.get("banana"));  // Output: null (key not found)
  hashTable.printHashTable();
}
