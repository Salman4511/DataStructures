

class Node {
  Node? next;
  int data;
  Node(this.data);
}

class Linkedlist {
  Node? head;
  void insertfront(int data) {
    Node newnode = Node(data);
    newnode.next = head;
    head = newnode;
  }

  void insertback(int data) {
    Node newnode = Node(data);
    if (head == null) {
      head = newnode;
      return;
    }
    Node? current = head;
    while (current!.next != null) {
      current = current.next;
    }
    current.next = newnode;
  }

  void insertbefore(int data, int target) {
    Node newnode = Node(data);
    if (head == null) {
      head = newnode;
    }

    Node? current = head;
    while (current!.next != null) {
      if (current.next!.data == target) {
        newnode.next = current.next;
        current.next = newnode;
        return;
      }
      current = current.next;
    }
  }

  void insertafter(int data, int target) {
    Node newnode = Node(data);
    if (head == null) {
      head = newnode;
    }

    Node? current = head;
    while (current != null) {
      if (current.data == target) {
        newnode.next = current.next;
        current.next = newnode;
        return;
      }
      current = current.next;
    }
  }

  void delfront() {
    if (head == null) return null;

    head = head!.next;
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

  void delany(int target) {
    if (head == null) return null;

    if (head!.data == target) {
      head = head!.next;
      return;
    }
    Node? current = head;
    while (current!.next != null) {
      if (current.next!.data == target) {
        current.next = current.next!.next;
        return;
      }
      current = current.next;
    }
  }

  void delbefore(int target) {
    if (head == null) {
      return null;
    }
    Node? current = head;
    Node? prev;
    while (current!.next != null) {
      if (current.next!.data == target) {
        prev!.next = current.next;
        return;
      }
      prev = current;
      current = current.next;
    }
  }

int? middleelement()
  {
 if(head==null)
 {
  print("Empty");
 }
 Node? a=head;
 Node? b=head;
 Node? prev;
 while(b!.next!=null&&b.next!.next!=null)
 {
  prev=a;
  a=a!.next;
  b=b.next!.next;
 }
   var sum=prev!.data+ a!.data+ a.next!.data;
   return sum;
  }
  bool isprime(int data)

  {
    for(int i=2;i<=data/2;i++)
    {
      if(data%i==0)
      {
        return false;
      }
    }
    return true;
  }
   void bubbleSort()
    {
      if(head==null || head!.next==null)
      {
        return;
      }
      Node? current=head;
     while(current!.next!=null)
     {
      Node? temp=current.next;
      while(temp!=null){
        if(current.data>temp.data){
          int tmp=current.data;
          current.data=temp.data;
          temp.data=tmp;
          temp=temp.next;
        }
      }
      current=current.next;
     }
      
    }
      void reverse()
  {
    Node? next;
    Node? prev=null;
    Node? current=head;

    while(current!=null)
    {
      next=current.next;
      current.next=prev;
      prev=current;
      current=next;
    }
    head=prev;
  }

    void duplicate()
    {
      if (head == null) {
        print("Nothing here");
      } else {
        Node? current = head;
        Node temp;
        while (current?.next != null) {
          if (current?.data == current?.next?.data) {
            temp = current!.next!;
            delany(current.data);
            current = temp;
          } else {
            current = current!.next;
          }
        }
      }
    }

    void dupliacte()
    {
      if(head==null)
      {
        print("Nothing here");
      }
      else
      {
        Node? current=head;
        Node? temp;
        while(current!.next!=null)
        {
          if(current.data==current.next!.data)
          {
            temp=current.next;
            delany(current.data);
            current=temp;
          }
          current=current!.next;
        }
      }
    }

  void display() {
    if (head == null) {
      print("Empty Linkedlist");
    }
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
   
  }
}

void main() {
  Linkedlist l = Linkedlist();

  l.insertback(6);
  l.insertback(1);
  l.insertback(5);


  l.bubbleSort();
  l.display();
 
 



}

  
