
import 'dart:io';

  bool isAnagram(String s, String t) {
    List<String> s1 = s.split('');
    List<String> s2 = t.split('');
    s1.sort();
    s2.sort();
    bool result = true;
    if(s1.length != s2.length){
     return false;
    }
    else{
      for(int i=0; i<s1.length; i++){
        if(s1[i] == s2[i]){
        return true;
        }
      }
    }
    return false;
  }


void main()
{
  
  String s="anagram";
  String t="nagaram";
  if(isAnagram(s,t))
  {
    print("Anagram");
  
  }
  else{
    print("False");
  }
}