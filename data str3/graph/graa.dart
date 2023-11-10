
class graph{
  Map <int, List<int>> adjacencyist;

  graph():  
  adjacencyist={};

  

  void addvertex(int vertex11){
    if(!adjacencyist.containsKey(vertex11)){
      adjacencyist[vertex11]=[];
    }
  }
  void addedge(int vertex111,int verte222){
    if(!adjacencyist.containsKey(vertex111)||!adjacencyist.containsKey(verte222)){
      return;
    }
    if(!adjacencyist[vertex111]!.contains(verte222)){
      adjacencyist[vertex111]!.add(verte222);

    }
    if(!adjacencyist[verte222]!.contains(vertex111)){
      adjacencyist[verte222]!.add(vertex111);
    }
  }
  void printgr(){
    for(var vertex in adjacencyist.keys){
      print("$vertex <-> ${adjacencyist[vertex]}");
    }
  }

  void delver(int vertex){
    if(!adjacencyist.containsKey(vertex)){
      return;
    }
    for(var neighbor in adjacencyist[vertex]!){
      adjacencyist[neighbor]!.remove(vertex);
    }
    adjacencyist.remove(vertex);
  }

  void deled(int vertex1,int vertex2){
    if(!adjacencyist.containsKey(vertex1)||!adjacencyist.containsKey(vertex2)){
      return;
    }
    adjacencyist[vertex1]!.remove(vertex2);
    adjacencyist[vertex2]!.remove(vertex1);
  }

   bool isCyclicUtil(int vertex, Set<int> visited, int parent) {
    visited.add(vertex);

    for (var neighbor in adjacencyist[vertex]!) {
      if (!visited.contains(neighbor)) {
        if (isCyclicUtil(neighbor, visited, vertex)) {
          return true;
        }
      } else if (neighbor != parent) {
        return true;
      }
    }

    return false;
  }

  bool isCyclic() {
    Set<int> visited = Set<int>();

    for (var vertex in adjacencyist.keys) {
      if (!visited.contains(vertex)) {
        if (isCyclicUtil(vertex, visited, -1)) {
          return true;
        }
      }
    }

    return false;
  
}
}

void main(){

 graph gr=graph();

 gr.addvertex(1);
 gr.addvertex(2);
 gr.addvertex(3);
 gr.addvertex(4);

 gr.addedge(2,3 );
 gr.addedge(3,4);
 gr.addedge(4,2) ;
 gr.addedge(1,3);

 gr.printgr();

//  gr.delver(2);
//  gr.deled(1,3);
//  gr.printgr();
print (gr.isCyclic());
}