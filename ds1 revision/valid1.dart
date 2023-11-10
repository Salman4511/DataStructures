
bool valid(String s) {
  List<String> stack = [];

  for (int i = 0; i < s.length; i++) {
    String ch = s[i];
    if (ch == '(' || ch == '{' || ch == '[') {
      stack.add(ch);
    } else {
      if (stack.isEmpty) {
        return false;
      }
      String lastch = stack.removeLast();
      if ((ch == ")" && lastch == "(") ||
          (ch == "}" && lastch == "{") ||
          (ch == "]" && lastch == "[")) 
          {
        return true;
           }
    }
  }
  return stack.isEmpty;
}

void main()
{
  String s1="[{()}]";

print("${valid(s1) ? "valid" :"invalid"}");
}