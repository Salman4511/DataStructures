void maxheap(List <int> arr){
  int n=arr.length;

  for(int i=(n~/2)-1;i>=0;i--){
    heapify(arr,n,i);
  }

  for(int i=n-1 ;i>=0;i--){
    int temp=arr[0];
    arr[0]=arr[i];
    arr[i]=temp;

    heapify(arr, i, 0);
  }
}

void heapify(List <int> arr, int n,int i){
   int larg=i;
   int left=2*i +1;
   int right=2*i +2;

   if(left<n && arr[left]>arr[larg]){
    larg=left;
   }
   if(right<n && arr[right]>arr[larg]){
    larg=right;
   }
   if(larg!=i){
    int temp= arr[i];
    arr[i]=arr[larg];
    arr[larg]=temp;

    heapify(arr, n, larg);
   }
}


void main(){
  List <int> arr=[4, 10, 3, 5, 1];
  print(arr);

  maxheap(arr);

  print(arr);
}
