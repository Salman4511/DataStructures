class Node {
  int data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class Doubly {
  Node? head;
  

  void insertfront(int data) {
    Node newnode = Node(data);
    newnode.next = head;
    head = newnode;
    newnode.prev = null;
    head!.prev = newnode;
  }

  void insertback(int data) {
    Node newnode = Node(data);
    if (head == null) {
      head = newnode;
    }
    Node? current = head;
    while (current!.next != null) {
      current = current.next;
    }
    newnode.prev = current;
    current.next = newnode;
  }

  void insertbefore(int data, int target) {
    Node newnode = Node(data);

    if (head == null) {
      head = newnode;
      return;
    }
    Node? current = head;
    while (current!.next != null) {
      if (current.next!.data == target) {
        newnode.next = current.next;
        newnode.prev = current;
        current.next = newnode;
        current.next!.prev = newnode;
        return;
      }
      current = current.next;
    }
  }

  void insertafter(int data, int target) {
    Node newnode = Node(data);

    if (head == null) {
      head = newnode;
      return;
    }
    Node? current = head;
    while (current != null) {
      if (current.data == target) {
        newnode.next = current.next;
        newnode.prev = current;
        current.next = newnode;
        current.next!.prev = newnode;
        return;
      }
      current = current.next;
    }
  }

  void delfront() {
    if (head == null) {
      return null;
    }
    head = head!.next;
    head!.prev = null;
  }

  void delback() {
    if (head == null) {
      return null;
    }
    Node? current = head;
    while (current!.next!.next != null) {
      current = current.next;
    }
    current.next = null;
  }

  void delany(int value) {
    if (head == null) {
      print("Doubly linked list is empty. Nothing to delete.");
      return;
    }

    if (head!.data == value) {
      head = head!.next;
      head!.prev = null;
      return;
    }
    Node? current = head;

    while (current != null) {
      if (current.data == value) {
        current.prev!.next = current.next;
        return;
      }
      current = current.next;
      if (current == null) {
        print("Node with value $value not found.");
        return;
      }
    }
  }
  

  void traverseBackward() {
    if (head == null) {
      print("Doubly linked list is empty.");
      return;
    }

    Node? current = head;
    while (current?.next != null) {
      current = current!.next;
    }

    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }
 


  void display() {
    if (head == null) {
      print("Empty");
    }
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}



void main() {
  Doubly a = Doubly();
for(int i=1;i<=7;i++)
{
  a.insertback(i);
}
 
  a.traverseBackward();
}
