List <int> selectiosort(List <int> arr){
int n= arr.length;
for(int i=0;i<n;i++){
  int min=i;
  for(int j=i+1;j<n;j++){
    if(arr[j]>arr[min]){
      min=j;
    }
  }
  int temp=arr[i];
  arr[i]=arr[min];
  arr[min]=temp;
}
return arr;
}

void main(){
  List <int> arr=[5,8,6,7,3,9,1,2,5];

  print(selectiosort(arr));
}