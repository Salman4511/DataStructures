
class graph {
  Map <int, List<int>> adjlist;

  graph():
  adjlist={};


  void addver(int key){
    if(!adjlist.containsKey(key)){
      adjlist[key]=[];
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

    void priii(){
      for(var n in adjlist.keys){
        print('$n <-> ${adjlist[n]}');
      }
    }

    void remver(int ver){
      if(!adjlist.containsKey(ver)){
        return;
      }else{
        for(var neighbor in adjlist[ver]!){
          adjlist[neighbor]!.remove(ver);
        }
        adjlist.remove(ver);
      }
    }

    void remed(int ver1,int ver2){
      if(!adjlist.containsKey(ver1)||!adjlist.containsKey(ver2)){
        return;
      }
     
         adjlist[ver1]!.remove(ver2);
        adjlist[ver2]!.remove(ver1);
      
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

 gr.priii();

//  gr.delver(2);
//  gr.deled(1,3);
//  gr.printgr();
}
  




