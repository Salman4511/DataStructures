
void arr(List <int> array){
int n=array.length;
for(int i=0;i<n;i++){
int temp=array[i];
int j=i-1;

while(j>=0 && array[j]>temp){

  array[j+1]=array[j];
  j--;
}
array[j+1]=temp;
}

}
void main(){
  List <int> array=[3,5,2,4,150,9,8,0,43];

  arr(array);
  print(array);  
}