class node{
  dynamic data;
  node? next;

  node(this.data);
}

class linkedlist{
  node? head;

  void add(dynamic data){
    node? newnode=node(data);

    if(head==null){
      head=newnode;
      return;
    }
    node? current= head;

    while(current?.next!=null){
      current=current?.next;
    }
    current?.next=newnode;

  }

  

  void display(){
    if(head==null){
      print('empty');
      return;
    }
    node? current=head;
    while(current!=null){
      print(current.data);
      current=current.next;
    }
  }
}

void main(){

  linkedlist list=linkedlist();

  list.add(10);
  list.add(20);
  list.add(30);
  list.add(40);

  list.display();
}