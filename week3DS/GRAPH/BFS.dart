import 'dart:collection';

class Graph {
  late Map<int, List<int>> adjacencyList;

  Graph() {
    adjacencyList = {};
  }

  void addEdge(int source, int destination) {
    adjacencyList.putIfAbsent(source, () => []);
    adjacencyList.putIfAbsent(destination, () => []);

    adjacencyList[source]!.add(destination);
    adjacencyList[destination]!.add(source); // For undirected graph
  }

  void bfs(int startVertex) {
    Set<int> visited = {};
    Queue<int> queue = Queue<int>();

    visited.add(startVertex);
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();
      print(currentVertex);

      for (int neighbor in adjacencyList[currentVertex]!) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
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

  print("BFS Traversal starting from vertex 0:");
  graph.bfs(0);
}
