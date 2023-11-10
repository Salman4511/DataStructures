class trienode{
  Map <String,trienode> children;
  bool isword;

  trienode(): 
  children={},
  isword=false;
}

class trie{
  trienode root;

  trie(): root=trienode();


  void  insert(String word){
    trienode current=root;
    for(int i=0;i<word.length;i++){
      String char=word[i];
      if(!current.children.containsKey(char)){
       current.children[char]=trienode(); 
      }
      current=current.children[char]!;
    }
    current.isword=true;
  }


  bool search(String word){
    trienode current= root;
    for(int i=0;i<word.length;i++){
      final char=word[i];
      if(!current.children.containsKey(char)){
        return false;
      }
      current=current.children[char]!;
    }
    return current.isword;


  }
}