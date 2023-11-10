class TrieNode {
 late Map<String, TrieNode> children;
 late bool isEndOfWord;

  TrieNode() {
    children = {};
    isEndOfWord = false;
  }
}

class Trie {
 late TrieNode root;

 Trie() {
    root = TrieNode();
  }

  void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!node.children.containsKey(char)) {
        node.children[char] = TrieNode();
      }
      node = node.children[char]!;
    }
    node.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!node.children.containsKey(char)) {
        return false;
      }
      node = node.children[char]!;
    }
    return node.isEndOfWord;
  }

  bool startsWith(String prefix) {
    TrieNode node = root;
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!node.children.containsKey(char)) {
        return false;
      }
      node = node.children[char]!;
    }
    return true;
  }
}

void main() {
  Trie trie = Trie();

  trie.insert("apple");
  trie.insert("app");
  trie.insert("banana");
  trie.insert("bat");

  print(trie.search("apple")); // Output: true
  print(trie.search("app")); // Output: true
  print(trie.search("orange")); // Output: false

  print(trie.startsWith("ban")); // Output: true
  print(trie.startsWith("bat")); // Output: true
  print(trie.startsWith("ball")); // Output: false
}
