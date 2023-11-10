class Solution {
  int calPoints(List<String> operations) {
    List<int> st = [];

    for (var i = 0; i < operations.length; i++) {
      if (operations[i] == "C") {
        st.removeLast();
      } else if (operations[i] == "D") {
        st.add(st.last * 2);
      } else if (operations[i] == "+") {
        int sm = st[st.length - 2] + st.last;
        st.add(sm);
      } else {
        st.add(int.parse(operations[i]));
      }
    }
    int sum = 0;
    print(st);
    for (int i = 0; i < st.length; i++) {
      sum += st[i];
    }
    return sum;
  }
}

void main() {
  Solution solution = Solution();
  List<String> operations = ["5", "2", "C", "D", "+"];
  int result = solution.calPoints(operations);
  print("Result: $result");
}
