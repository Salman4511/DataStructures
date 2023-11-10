
class node<K,V> {
  K? key;
  V? value;
  node<K,V>? next;


  node(this.key,this.value);
}

class hashTable<K,V>{

  late List< node<K,V>?> buckets;
  int capacity;

  hashTable(this.capacity){
  buckets= List.filled(capacity, null);
  }

  int hash(K key){
    int hashcode= key.hashCode;
    return hashcode.abs()% capacity;
  }

  void add(K key, V value){
    int index=hash(key);
    node<K,V> newnode= node(key, value);

    if(buckets[index]==null){
      buckets[index]=newnode;
    }else{
      node<K,V>? current= buckets[index];
      while(current?.next!=null){
        if(current?.key==key){
          current?.value=value;

        }
        current=current?.next;
      }
      current?.next=newnode;
    }
  }

  V? get(K key){
    int index=hash(key);
    node<K,V>? current=buckets[index];
    while(current!=null){
      if(current.key==key){
      
       return current.value;
    }
    current=current.next;
    }
   return null;
    }


    void delete(K key){
      int index=hash(key);
      node<K,V>? current=buckets[index];
      node<K,V>? prev;

      while(current!=null){
        if(current.key==key){
          if(prev==null){
            buckets[index]=current.next;
          }
          else{
            prev.next=current.next;

          }
          return;
        }
        prev=current;
        current=current.next;
      }
    }
     void printHashTable(){
      for(int i=0;i<buckets.length;i++){
        node<K,V>? current=buckets[i];
        while(current!=null){
          print("index:$i,[key:${current.key},value:${current.value} ]");
          current=current.next;
        }
      }
     }
  }


  void main(){
    hashTable hash=hashTable(10);

    hash.add("hi", 10);
    hash.add("sal", 20);
    hash.add("ih", 40);

    hash.printHashTable();
    print(hash.get("hi"));

  }

