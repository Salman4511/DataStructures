class trienode{
  late Map<String,trienode> children;
  late bool isend;

  trienode(){
    children={};
    isend=false;
  }
}
class trie{
  late trienode root;

  trie(){
    root=trienode();
  }

  void insert(String s){
    trienode node=root;
    for(int i=0;i<s.length;i++){
      String ch=s[i];
      if(!node.children.containsKey(ch)){
        node.children[ch]=trienode();
      }
      node=node.children[ch]!;
    }
    node.isend=true;
  }
  
}