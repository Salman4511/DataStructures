import 'dart:ffi';

class Graph{
 late List<List<int>> admat;

 Graph(int vertices){
  admat=List.generate(vertices, (_) => List.filled(vertices, 0));
 }


 void addEdge(int s,int d){
  if(s>=0 && s<admat.length && d>=0 && d<admat.length){
    admat[s][d]=1;
    admat[d][s]=1;
  }
 }
  void remove(int s,int d){
  if(s>=0 && s<admat.length && d>=0 && d<admat.length){
    admat[s][d]=0;
    admat[d][s]=0;
  }
 }
 bool hasEdge(int s,int d){
   if(s>=0 && s<admat.length && d>=0 && d<admat.length){
    return admat[s][d]==1;
   }
   return false;

 }
   void removeVertex(int vertex) {
    if (vertex >= 0 && vertex < admat.length) {
      admat.removeAt(vertex); 

      for (var row in admat) {
        row.removeAt(vertex); 
      }
    }
  }

 void display(){
  for(int i=0;i<admat.length;i++){
    print(admat[i]);
  }
 }
}
void main(){
   
  Graph graph = Graph(5);

  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);

  print("Original Graph:");
  graph.display();
print(graph.hasEdge(0, 1));


  print("Graph after adding a new vertex:");
  graph.display();
}