class Graph {
  Map<int, List<int>> adjacencyList;

  Graph() : adjacencyList = {};

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

  void dfs(int startVertex) {
    Set<int> visited = {};
    dfsRecursive(startVertex, visited);
  }

  void dfsRecursive(int currentVertex, Set<int> visited) {
    visited.add(currentVertex);
    print(currentVertex);

    for (var neighbor in adjacencyList[currentVertex]!) {
      if (!visited.contains(neighbor)) {
        dfsRecursive(neighbor, visited);
      }
    }
  }

 void bfs(int startVertex) {
  Set<int> visited = {};
  List<int> queue = [];

  visited.add(startVertex);
  queue.add(startVertex);

  while (queue.isNotEmpty) {
    int currentVertex = queue.removeAt(0);
    print(currentVertex);

    for (var neighbor in adjacencyList[currentVertex]!) {
      if (!visited.contains(neighbor)) {
        visited.add(neighbor);
        queue.add(neighbor);
      }
    }
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

  print("Graph:");
  graph.printGraph();

  // print("\nDFS starting from vertex 1:");
  // graph.dfs(1);

  print("\nBFS starting from vertex 1:");
  graph.bfs(1);
}
