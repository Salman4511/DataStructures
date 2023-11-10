class Graph {
  late Map<int, List<int>> adjacencyList;

  Graph() {
    adjacencyList = {};
  }

  void addEdge(int source, int destination) {
    adjacencyList.putIfAbsent(source, () => []);
    adjacencyList.putIfAbsent(destination, () => []);

    adjacencyList[source]!.add(destination);
    adjacencyList[destination]!.add(source); 
  }
  void dfs(int startVertex) {
    Set<int> visited = {};
    List<int> stack = [];

    stack.add(startVertex);

    while (stack.isNotEmpty) {
      int currentVertex = stack.removeLast();

      if (!visited.contains(currentVertex)) {
        visited.add(currentVertex);
        print(currentVertex);

        for (int neighbor in adjacencyList[currentVertex]!) {
          if (!visited.contains(neighbor)) {
            stack.add(neighbor);
          }
        }
      }
    }
  }
}

void main() {
  Graph graph = Graph();

  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 3);
  graph.addEdge(3, 3);

  print("DFS Traversal using Stack starting from vertex 0:");
  graph.dfs(0);
}
