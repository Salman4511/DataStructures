import 'GRAPH/adjacencylIST.dart';

class Graph{
 late Map <int,List<int>> adjacent;
 Graph(){
  adjacent={};
 }
 void addEdge(int s,int d){
  adjacent.putIfAbsent(s,()=>[]);
  adjacent.putIfAbsent(d, () => []);

  adjacent[s]!.add(d);
  adjacent[d]!.add(s);
 }

 void removeEdge(int s,int d){
  adjacent[s]!.remove(d);
  adjacent[d]!.remove(s);
 }

 List<int>? neighbour(int vertex){
  if(adjacent.containsKey(vertex)){
    return adjacent[vertex];
  }
  return [];
 }
  void delvertex(int v){
    if(!adjacent.containsKey(v)){
      return;
    }
    for(var n in adjacent[v]!){
      adjacent[n]!.remove(v);
    }
     adjacent.remove(v);
  }

  bool hasedge(int s,int d){
    if(adjacent.containsKey(s)){
      if(adjacent.containsKey(d)){
        return true;
      }
    }
    return false;
  }

  void bfs(int start){
    Set <int> visited={};
    List <int> queue=[];

    visited.add(start);
    queue.add(start);

    while(queue.isNotEmpty){
      int current=queue.removeAt(0);

      print(current);
      for(var neigh in adjacent[current]!){
        if(!visited.contains(neigh)){
          visited.add(neigh);
          queue.add(neigh);
        }
      }
    }
  }
    void dfs(int start){
    Set <int> visited={};
    List <int> stack=[];

    
    stack.add(start);

    while(stack.isNotEmpty){
      int current=stack.removeLast();
      visited.add(start);

      print(current);
      for(var neigh in adjacent[current]!){
        if(!visited.contains(neigh)){
          stack.add(neigh);
        }
      }
    }
  }



}
void main(){
  Graph g = Graph();
  g.addEdge(0, 1);
  g.addEdge(0, 4);
  g.addEdge(1, 2);
  g.addEdge(1, 3);
  g.addEdge(1, 4);
  g.addEdge(2, 3);
  g.addEdge(3, 4);

  g.adjacent.forEach((vertex, neighbour) {
 print("$vertex : $neighbour");
   });

   g.removeEdge(1, 2);
    g.adjacent.forEach((vertex, neighbour) {
 print("$vertex : $neighbour");
   });

     print("Neighbors of vertex 1: ${g.neighbour(1)}"); 
       print("BFS Traversal starting from vertex 0:");
  g.dfs(0);

}
