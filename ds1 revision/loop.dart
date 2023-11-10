int sum(){
   int sum=0;
  for (int i=0;i<=100;i++){
    sum=sum+i;
  }
  return sum;
}

void main(){
  print(sum());
}