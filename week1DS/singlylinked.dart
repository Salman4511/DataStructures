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
    } else {
      Node? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newnode;
    }
  }
  void after(int data,int target)
  {
        Node newnode = Node(data);

    if(head==null)
    {
      head=newnode;
      return;
    }
      Node? current=head;
      while(current!=null)
      {
        if(current.data==target)
        {
          newnode.next=current.next;
          current.next=newnode;
          return;
        }
        current=current.next;
      }
  }
  void before(int data,int target)
  {
        Node newnode = Node(data);

    if(head==null)
    {
      head=newnode;
      return;
    }
    if(head!.data==target)
    {
      newnode.next=head;
      head=newnode;
      return;
    }
     Node? current=head;
      while(current!.next!=null)
      {
        if(current.next!.data==target)
        {
          newnode.next=current.next;
          current.next=newnode;
          return;
        }
        current=current.next;
      }

  }

  void delfront()
  {
  
    if(head==null)
    {
      return null;
    }
    head=head!.next;
    
  } 
  void delback()
  {
    if(head==null)
    return null;
    Node? current=head;
    while(current!.next!.next!=null)
    {
      current=current.next;
    }
   current.next=null;
  }
  void delvalue(int target)
  {

    if(head==null)
    {
      return null;
    }
    if(head!.data==target){
      head=head!.next;
    }
    Node? current=head;
    while(current!.next!=null)
    {
      if(current.next!.data==target)
      {
        current.next=current.next!.next;
        return; 
      }
      current=current.next;
    }
  }
  void delbefore(int value){
    if(head==null)
    {
      return null;
    }
  
    Node? current=head;
   while(current !=null)
   {
    if(current.data ==value)
    {
         current.next=current.next!.next;
         return;
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
 bool prime(int data)
  {
    int flag=0;
    for(int i=2;i<data;i++)
    {
      if(data%i==0)
      {
        return false;
      }
    }
    return true;
  }

 int? secondlargest()
  {
    int? m1=head!.data;
    int? m2=head!.next!.data;
    Node? current=head!.next;

    while(current!=null)
    {
      if(current.data>m1!)
      {
        m2=m1;
        m1=current.data;
      }
      if(current.data>m2!&& current.data<m1)
      {
        m2=current.data;
      }
      current=current.next;
    }
    return m2;
    
  }


int sumOfLastThree() {
  if (head == null || head!.next == null || head!.next!.next == null) {
    print("The linked list does not have at least three elements.");
    return 0;
  }

  Node? last = head;
  Node? secondLast = head!.next;
  Node? thirdLast = head!.next!.next;

  while (thirdLast!.next != null) {
    last = secondLast;
    secondLast = thirdLast;
    thirdLast = thirdLast.next;
  }

  int sumLastThree = last!.data + secondLast!.data + thirdLast.data;
  return sumLastThree;
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
            delvalue(current.data);
            current = temp;
          } else {
            current = current!.next;
          }
        }
      }
    }
     Node? bubbleSort() {
Node? head;
  if (head == null || head.next == null) 
  return head;

  bool swapped;
  Node? current;
  Node? tail = null;

  while (true) {
    swapped = false;
    current = head;

    while (current?.next != tail) {
      if (current!.data < current.next!.data) {
        int temp = current.data;
        current.data = current.next!.data;
        current.next!.data = temp;
        swapped = true;
      }
      current = current.next;
    }
    if (!swapped) 
    break; 
    tail = current;
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
  Linkedlist l = Linkedlist();



}




