void maxheap(List <int> arr){
  int n= arr.length;
  for(int i=(n~/2)-1;i>=0;i--){
    heapify(arr,n,i);
  }
  for(int i=n-1;i>=0;i--){
    int temp=arr[0];
    arr[0]=arr[i];
    arr[i]=temp;

    heapify(arr, i, 0);
  }
}

void heapify(List <int> arr,int n ,int i){
  int larg=i;
  int left=2*i+1;
  int right=2*i+2;

  if(left<n&& arr[left]>arr[larg]){
    larg=left;
  }
  if(right<n&& arr[right]>arr[larg]){
    larg=right;
  }
  if(larg!=i){
  int temp =arr[i];
  arr[i]=arr[larg];
  arr[larg]=temp;

  heapify(arr, n, larg);
  }
}


void heapifyup(List <int> arr, int n){
  int larg=(n-1)~/2;

    while(n>0&& arr[n]<arr[larg]){
      int temp =arr[n];
      arr[n]=arr[larg];
      arr[larg]=temp;

      n=larg;
      larg=(n-1)~/2;
    }
  }


void insert(List <int > arr,int value){
   arr.add(value);
   heapifyup(arr, arr.length-1);
}

void main() {
  List<int> numbers = [4, 10, 3, 5, 1];
  
  print("Original array:");
  print(numbers);

  maxheap(numbers);

  print("Min Heap:");
  print(numbers);

  // print(deleteMax(numbers));

  // insert(numbers, 20);
  // maxheap(numbers);
  // print(numbers);
}