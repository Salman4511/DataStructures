List<int>? bubbleSort(List<int> array) {
  int n= array.length;
  dynamic swap;
  do 
  {
    swap=false;
    for(int i=0 ; i<n-1;i++){
      if(array[i+1]>array[i]){
       int temp=array[i];
       array[i]=array[i+1];
       array[i+1]=temp;
       swap=true;
      }
    }
   
  }
   while(swap);
   return array;
}



void main() {
  List<int> array = [23, 4, 5, 67, 5, 45, 6];
 print(bubbleSort(array));
}
