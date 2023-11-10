bool validd(String s){

List <dynamic> stack=[];

for(int i=0;i<s.length;i++){
  String ch=s[i];
  if(ch=='('||ch=='{'||ch=='['){
    stack.add(ch);
  }else{
    if(stack.isEmpty){
      return false;
    }
    String lastch=stack.removeLast();

    if((ch==')'&&lastch=='(')||
    (ch=='}'&&lastch=='{')||
    (ch==']'&&lastch=='[')){
  }
  return true;
  }
}

return stack.isEmpty;

}

void main(){
   String s="{([])}";

  print(validd(s)? 'valid':'invalid');
}