class Graph {
  Map<int, List<int>> adjacencyList;

  Graph() :
    adjacencyList = {};
  

  void addVertex(int vertex) {
    if (!adjacencyList.containsKey(vertex)) {
      adjacencyList[vertex] = [];
    }
  }

  void addEdge(int vertex1, int vertex2) {
    if (!adjacencyList.containsKey(vertex1) || !adjacencyList.containsKey(vertex2)) {
      return; // Exit if either vertex is not in the graph
    }

    if (!adjacencyList[vertex1]!.contains(vertex2)) {
      adjacencyList[vertex1]!.add(vertex2);
    }

    if (!adjacencyList[vertex2]!.contains(vertex1)) { 
      adjacencyList[vertex2]!.add(vertex1);
    }
  }

  void printGraph() {
    for (var vertex in adjacencyList.keys) {
      print("$vertex -> ${adjacencyList[vertex]}");
    }
  }
}

void main() {
  var graph = Graph();

  graph.addVertex(1);
  graph.addVertex(2);
  graph.addVertex(3);
  graph.addVertex(4);
  

  graph.addEdge(1, 2);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);
  graph.addEdge(4, 1);
  

  graph.printGraph();
}
