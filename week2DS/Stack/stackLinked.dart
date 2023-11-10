class Node {
  int? data;
  Node? next;

  Node(this.data);
}

class Linkedlist
{
  Node? top;
  int size=0;

  void isEmpty()
  {
    if(top==null)
    {
     print("Empty Linkedlist");
    }
  }

  void push(int data)
  {
    Node newnode=Node(data);
    newnode.next=top;
    top=newnode;
    size++;
  }

  void pop()=>  top=top!.next;
  int? peek()=> top!.data;
  
}
void main()
{
  Linkedlist l=Linkedlist();
  for(int i=1;i<=5;i++)
  {
    l.push(i);
  }
  print(l.size);
  print("The peeked element ${l.peek()}");
 l.pop();
}