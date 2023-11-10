bool validanagram(String s1,String s2)
{
 String news1=s1.toLowerCase();
 String news2=s2.toLowerCase();
 List <String> str1=news1.split("");
 List<String> str2=news2.split("");

 str1.sort();
 str2.sort();

 if(str1.length!=str2.length)
 {
  return false;
 }
 for(int i=0;i<s1.length;i++)
 {
   if(str1[i]==str2[i])
   {
    return true;
   }
 }
 return false;
}

void main()
{
  String s="anagram";
  String s2="NagaRAM";
  print("The expression $s is ${validanagram(s,s2) ? "valid" : "not valid"}");
}