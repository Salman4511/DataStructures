List <int> insert(List <int> arra){
int n=arra.length;

for(int i=1;i<n;i++){
int temp=arra[i];
int j=i-1;

while(j>=0&&arra[j]>temp){
  arra[j+1]=arra[j];
  j--;
}
  arra[j+1]=temp;
}
return arra;
}

void main(){
  List <int> arra=[8,4,6,5,2,3,8,9,1,4];
  print(insert(arra));
}