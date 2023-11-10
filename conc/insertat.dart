dynamic bubble(List<int> arr){
int n = arr.length;
for(int i=1;i<n;i++){
  int temp=arr[i];
  int j=i-1;

  while(j>=0 && arr[j]>temp){
     arr[j+1]=arr[j];
     j--;
  }
  arr[j+1]=temp;
}
return arr;
 }


void main(){
  List <int> arra=[4,5,8,7,9,6,8,5,1];
  print(bubble(arra));
}