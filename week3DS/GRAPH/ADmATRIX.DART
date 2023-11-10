class Graph {
  late List<List<int>> adjacencyMatrix;

  Graph(int vertices) {
    adjacencyMatrix = List.generate(vertices, (_) => List.filled(vertices, 0));
  }

  void addEdge(int source, int destination) {
    if (source >= 0 && source < adjacencyMatrix.length &&
        destination >= 0 && destination < adjacencyMatrix.length) {
      adjacencyMatrix[source][destination] = 1;
      adjacencyMatrix[destination][source] = 1; 
    }
  }

  void removeEdge(int source, int destination) {
    if (source >= 0 && source < adjacencyMatrix.length &&
        destination >= 0 && destination < adjacencyMatrix.length) {
      adjacencyMatrix[source][destination] = 0;
      adjacencyMatrix[destination][source] = 0; 
    }
  }

  void addVertex() {
    int newVertexIndex = adjacencyMatrix.length;
    for (var row in adjacencyMatrix) {
      row.add(0); 
    }
    adjacencyMatrix.add(List<int>.filled(newVertexIndex + 1, 0)); 
  }

  void removeVertex(int vertex) {
    if (vertex >= 0 && vertex < adjacencyMatrix.length) {
      adjacencyMatrix.removeAt(vertex); 

      for (var row in adjacencyMatrix) {
        row.removeAt(vertex); 
      }
    }
  }

  bool hasEdge(int source, int destination) {
    if (source >= 0 && source < adjacencyMatrix.length &&
        destination >= 0 && destination < adjacencyMatrix.length) {
      return adjacencyMatrix[source][destination] == 1;
    }
    return false;
  }

  List<int> getNeighbors(int vertex) {
    if (vertex >= 0 && vertex < adjacencyMatrix.length) {
      List<int> neighbors = [];
      for (var i = 0; i < adjacencyMatrix.length; i++) {
        if (adjacencyMatrix[vertex][i] == 1) {
          neighbors.add(i);
        }
      }
      return neighbors;
    }
    return [];
  }

  void display() {
    for (var i = 0; i < adjacencyMatrix.length; i++) {
      print(adjacencyMatrix[i]);
    }
  }
}
 void main(){
   int numVertices = 5;
  Graph graph = Graph(numVertices);

  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);

  print("Original Graph:");
  graph.display();



  print("Graph after adding a new vertex:");
  graph.display();
 }