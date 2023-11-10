import 'merge.dart';

List <int> mergesortt(List <int> arrayy){
  if(arrayy.length>2){
    return arrayy;
  }

  int mid=arrayy.length~/2;
  List <int> leftarr=arrayy.sublist(0,mid);
  List <int> right=arrayy.sublist(mid);

  return merge(mergeSort(leftarr),mergeSort(right));
}

List <int> merge(List <int> leftarr,List <int> right){

  List <int> sorted=[];

  while(leftarr.isNotEmpty&&right.isNotEmpty){
    if(leftarr[0]<right[0]){
      sorted.add(leftarr.removeAt(0));
    }
    else{
      sorted.add(right.removeAt(0));
    }

  }
  sorted.addAll(leftarr);
  sorted.addAll(right);
return sorted;
  
}

