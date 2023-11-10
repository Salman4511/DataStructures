class graph {
  late Map<int, List<int>> adlist;
  graph() {
    adlist = {};
  }

  void addEdge(int s, int d) {
    adlist.putIfAbsent(s, () => []);
    adlist.putIfAbsent(d, () => []);
    adlist[s]!.add(d);
    adlist[d]!.add(s);
  }

  void removeedge(int s, int d) {
    adlist[s]!.remove(d);
    adlist[d]!.remove(s);
  }

  List<int>? neigh(int v) {
    if (adlist.containsKey(v)) {
      return adlist[v];
    }
    return [];
  }

 void delvertex(int v) {
    if (!adlist.containsKey(v)) {
      return;
    }
    for (var n in adlist[v]!) {
      adlist[n]!.remove(v);
    }
    adlist.remove(v);
  }

  bool isedge(int s, int d) {
    if (adlist.containsKey(s)) {
      if (adlist[s]!.contains(d)) ;
      return true;
    }
    return false;
  }
}

void main() {
  graph g = graph();
  g.addEdge(0, 1);
  g.addEdge(0, 4);
  g.addEdge(1, 2);
  g.addEdge(1, 3);
  g.addEdge(1, 4);
  g.addEdge(2, 3);
  g.addEdge(3, 4);

  print("Adjacency List:");
  g.adlist.forEach((vertex, neighbors) {
    print("$vertex: $neighbors");
  });

  print("Neighbors of vertex 1: ${g.neigh(1)}");
  g.delvertex(1);

  print("It has edge: ${g.isedge(9, 0)}");

  print("Adjacency List:");
  g.adlist.forEach((vertex, neighbors) {
    print("$vertex: $neighbors");
  });
}
