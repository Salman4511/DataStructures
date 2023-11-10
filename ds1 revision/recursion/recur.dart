dynamic linear(List <int> arr,int target){

for(int i=0;i<arr.length;i++){
  if(arr[i]==target){
    return i;
  }
}
return 'no such value';
}

void main(){

List <int> arr=[2,3,4,5,6,7,8,9];
print(linear(arr,3));
}