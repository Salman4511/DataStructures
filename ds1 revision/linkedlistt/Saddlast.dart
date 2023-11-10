int sum(List <int> arr,int left,int right,int target){
 if(left>right){
  return 0;
 }
 int mid=(left+right)~/2;
  if(arr[mid]==target){
    return mid;
  }
  else if(arr[mid]>target){
    return sum(arr, left, mid-1, target);
  }
  return sum(arr, mid+1, right, target);
}

void main(){
 List <int> arr=[1,2,3,4,5];
 print(sum(arr, 0, arr.length-1, 3));
} 