import 'dart:math';

class Entry{
  int? key;
  dynamic value;
  Entry? next;
  Entry(this.key,this.value);

}

class HashTable{
  static int capacity=10;
  List<Entry?> table=[];

  HashTable() : table = List<Entry?>.filled(capacity, null);

  int hash(int key)
  {
    return key %capacity;
  }

   void insert(int key, dynamic value) {
    int index = hash(key);
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

    void display() {
    for (int i = 0; i < capacity; i++) {
      Entry? current = table[i];
      if (current != null) {
        print('Bucket $i:');
        while (current != null) {
          print('${current.key}: ${current.value}');
          current = current.next;
        }
        print('------------------');
      }
    }
  }
}

 


void main()
{
    HashTable hashTable = HashTable();

  hashTable.insert(1, "John");
  hashTable.insert(3, "Jane");
  hashTable.insert(10, "Bob");
  hashTable.insert(21, "Alice");
   hashTable.display();

  
  }
