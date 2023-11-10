class graph{

  Map <int, List<int>> adjlist;

  graph():adjlist={};

  void addver(int ver){
    if(!adjlist.containsKey(ver)){
      adjlist[ver]=[];
    }
  }
 void addedge(int ver1,int ver2){
   if(!adjlist.containsKey(ver1)||!adjlist.containsKey(ver2)){
    return;
   }
   if(!adjlist[ver1]!.contains(ver2)){
    adjlist[ver1]!.add(ver2);
   }
   if(!adjlist[ver2]!.contains(ver1)){
    adjlist[ver2]!.add(ver1);
   }
 }

 void delver(int ver){
    if(!adjlist.containsKey(ver)){
      return;
    }
    for(var n in adjlist[ver]!){
      adjlist[n]!.remove(ver);
    }
 }

 void deled(int ver1,int ver2){
  if(!adjlist.containsKey(ver1)||!adjlist.containsKey(ver2)){
    return;
  }
  
    adjlist[ver1]!.remove(ver2);
    adjlist[ver2]!.remove(ver1);  
 }

void printgr(){
  for (var n in adjlist.keys){
    print('$n <-> ${adjlist[n]}');
  }
}
   
   void dfs(int startvertex){
      Set <int> visited={};
      dfsrec(startvertex,visited);
   }

   void dfsrec(int currentvertex, Set<int> visited){
    visited.add(currentvertex);
    print(currentvertex);

    for(var n in adjlist[currentvertex]!){
      if(!visited.contains(n)){
      dfsrec(n, visited);
      }
    }
   }

   void bfs(int startvertex){
    Set <int> visited={};
    List<int> queue=[];

    visited.add(startvertex);
    queue.add(startvertex);

    while(queue.isNotEmpty){
      int currentvertex=queue.removeAt(0);
      print(currentvertex);

    for(var n in adjlist[currentvertex]!){
      if(!visited.contains(n)){
        queue.add(n);
        visited.add(n);
      }
      }
    }
   }

}

void main(){
  graph gr=graph();

 gr.addver(1);
 gr.addver(2);
 gr.addver(3);
 gr.addver(4);

 gr.addedge(2,3 );
 gr.addedge(3,4);
 gr.addedge(4,2) ;
 gr.addedge(1,3);
 
 gr.delver(4);
 gr.deled(2, 3);
 gr.printgr();
}