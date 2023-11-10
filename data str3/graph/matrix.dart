class graph{
  late List<List <bool>> adjacencymatrix;
  dynamic vertieces;


  graph(int vertieces){
    this.vertieces=vertieces;

    adjacencymatrix = List.generate(vertieces, (i) => List<bool>.filled(vertieces, false));
  }


  void addedge(int vertex1,int vertex2){
    if(vertex1>=0&&vertex2<vertieces&&vertex2>=0&&vertex2<vertieces){
      adjacencymatrix[vertex1][vertex2]=true;
      adjacencymatrix[vertex2][vertex1]=true;
    }

  }
  void removeedge(int vertex1,int vertex2){
    if(vertex1>0&&vertex2<=vertieces&&vertex2>0&&vertex2<=vertieces){
      adjacencymatrix[vertex1][vertex2]=false;
      adjacencymatrix[vertex2][vertex1]=false;
  }
}
void printg(){
  for(int i=0;i<vertieces;i++){
    String row='';
    for(int j=0;j<vertieces;j++){
      row=row+ ' ${adjacencymatrix[i][j]? 1 : 0 }';
    }
    print(row);
  }
}

}

void main(){

  graph g=graph(4);

  g.addedge(2,3);
  g.addedge(3,1);
  g.addedge(1,2);
  g.printg();
}  




