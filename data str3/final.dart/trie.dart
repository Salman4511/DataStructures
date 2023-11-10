class trienode{
  Map<String,trienode>children;
  bool isword;

  trienode():children={},isword=false;
}

class trie{
  trienode root;

  trie(): root=trienode();

  void insert(String word){
    trienode current=root;
    
    for(int i=1;i<word.length;i++){
      String char=word[i];

      if(!current.children.containsKey(char)){
        current.children[char]=trienode();
      }
      current=current.children[char]!;
    }
    current.isword=true;
  }

  bool search(String word){
    trienode current =root;
  
    for(int i=1;i<word.length;i++){
      String char=word[i];

      if(!current.children.containsKey(char)){
        return false;
      }
      current=current.children[char]!;

  }
return current.isword;
}
   List<String> prefix(String word){
    trienode current=root;
    for(int i=1;i<word.length;i++){
      String char=word[i];

      if(!current.children.containsKey(char)){
        return [];
      }
      current=current.children[char]!;
    }
    return keywthpref(current,word);
   }

   List <String> keywthpref(trienode current,String word){
    
    List <String> arr=[];
     if(current.isword){
  arr.add(word);
     }
     for (var n in current.children.entries){
      arr.addAll(keywthpref(n.value, word + n.key));
     }
    return arr;
   }

   List <String> suffix(String word){
    List <String> suf=[];
    for(int i=0;i<word.length;i++){
      String suffixx= word.substring(i);
      suf.add(suffixx);
    }
    return suf;
   }
}

void main(){
  trie tr=trie();
  tr.insert("hi");
  tr.insert("helloo");
  tr.insert("heey");
  tr.insert("sal");
  tr.insert("aaa");

 print( tr.search("i"));

print( tr.prefix('he'));

print(tr.suffix("hello"));
 
}