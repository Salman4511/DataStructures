class Graph {
  late List<List<bool>> adjacencyMatrix; // Adjacency matrix to represent the graph
  dynamic vertices; // Total number of vertices in the graph

  // Constructor to create the graph with a given number of vertices
  Graph(int vertices) {
    this.vertices = vertices;
    // Initialize the adjacency matrix with 'vertices' rows and columns, filled with 'false'
    adjacencyMatrix = List.generate(vertices, (i) => List<bool>.filled(vertices, false));
  }

  // Method to add an edge between two vertices
  void addEdge(int vertex1, int vertex2) {
    if (vertex1 >= 0 && vertex1 < vertices && vertex2 >= 0 && vertex2 < vertices) {
      adjacencyMatrix[vertex1][vertex2] = true; // Mark the edge between vertex1 and vertex2 as true
      adjacencyMatrix[vertex2][vertex1] = true; // Since the graph is undirected, mark the reverse edge as true
    }
  }

  // Method to remove an edge between two vertices
  void removeEdge(int vertex1, int vertex2) {
    if (vertex1 >= 0 && vertex1 < vertices && vertex2 >= 0 && vertex2 < vertices) {
      adjacencyMatrix[vertex1][vertex2] = false; // Mark the edge between vertex1 and vertex2 as false
      adjacencyMatrix[vertex2][vertex1] = false; // Mark the reverse edge as false
    }
  }

  // Method to print the adjacency matrix of the graph
  void printGraph() {
    for (int i = 0; i < vertices; i++) {
      String row = '';
      for (int j = 0; j < vertices; j++) {
        row += '${adjacencyMatrix[i][j] ? 1 : 0} '; // Print '1' for true, '0' for false
      }
      print(row);
    }
  }
}

void main() {
  int numVertices = 4;
  Graph graph = Graph(numVertices);

  graph.addEdge(0, 1);
  graph.addEdge(1, 2);
  graph.addEdge(2, 3);
  graph.addEdge(3, 0);

  print('Adjacency Matrix:');
  graph.printGraph();

  graph.removeEdge(1, 2);
  graph.removeEdge(3, 0);

  print('\nAdjacency Matrix after removals:');
  graph.printGraph();
}
