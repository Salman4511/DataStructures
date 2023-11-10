import 'dart:io';

int sumofn(int num)
{
  if(num<=1)
  {
    return 1;
  }
  else{
    return num+sumofn(num-1);
  }
}
void printarray(List<int> array,int index)
{
  if(index<array.length)
  {
    if(array[index]%2==1)
    print(array[index]);
    printarray(array, index+1);
  }

}
int sumofarray(List <int> array,int index)
{
  if(index==array.length)
  {
    return 0;
  }
  else{
    return array[index]+sumofarray(array, index+1);
  }
  
}
int BinarySearch(List<int> array,int low,int high,int target)
{
  
  if(low<=high)
  {
    int mid=low+high~/2;
    if(array[mid]==target){
      return mid;
    }
    if(array[mid]<target)
    {
      return BinarySearch(array, mid+1, high, target);
    }
    if(array[mid]>target)
    {
      return BinarySearch(array, low, mid-1, target);
    }

  }
  return -1;
}

int LinearSearch(List <int> array,int target,int size)
{
  if(size==0)
  {
    return -1;
  }
  if(array[size-1]==target)
{
  return size-1;
}
return LinearSearch(array, target, size-1);
}

int fact(int n)
{
  if(n<=1)
  {
    return 1;
  }
  return n*fact(n-1);
}

int fibonacci(int num)
{
  if(num==0)
  return 0;
  if(num==1)
  return 1;

  return fibonacci(num-1)+fibonacci(num-2);
}
void main()
{
  List <int> array=[1,2,3,4,5,6,7];

  for(int i=0;i<6;i++)
  print(fibonacci(i));
}