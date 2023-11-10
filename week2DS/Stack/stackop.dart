import 'dart:io';


class stack {
  List<int> array = [];

  bool isEmpty() {
    return array.isEmpty;
  }

  int size() {
    return array.length;
  }

  void push(int data) {
      return array.add(data);
  }

  int pop() {
    if (array.isEmpty) {
      print("Nothing to delete");
    }
    return array.removeLast();
  }

  int peek() {
    if (array.isEmpty) {
      print("Nothing");
    }
    return array.last;
  }

  int delmid() {
    stack tempstack = stack();
    int size = this.size();
    int mid = size ~/ 2;

    for (int i = 0; i < mid; i++) {
      tempstack.push(this.pop());
    }
    int a=this.pop();

    while (!tempstack.isEmpty()) {
      this.push(tempstack.pop());
    }
    return a;
  }
  void delany(int value)
  {
    stack tempstack = stack();
    while(array.isNotEmpty)
    {
      if(value!=array.last)
      {
        tempstack.push(this.pop());
      }
      else{
      this.pop();

      }
    }

    while(!tempstack.isEmpty())
    {
      this.push(tempstack.pop());
    }
    
  }

  bool prime(int n) {
    for (int i = 2; i <= n / 2; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  int secondlargesteven() {
    int m1 = 0;
    int m2 = 0;
    for (int j = 0; j < array.length; j++) {
      if (array[j] % 2 == 0) {
        for (int i = 0; i < array.length; i++) {
          if (array[i] > m1) {
            m2 = m1;
            m1 = array[i];
          } else if (array[i] > m2 && array[i] < m1) {
            m2 = array[i];
          }
        }
      }
    }
    return m2;
  }

  void display() {
    for (var items in array.reversed) {
       print(items);
    }
  }
}

void main() {
  stack s = stack();
  for (int i = 0; i <= 6; i++) {
    s.push(i);
  }
 s.delany(2);
 s.display();

}
