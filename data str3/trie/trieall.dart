class TrieNode {
  final Map<String, TrieNode> children;
  bool isEndOfWord;

  TrieNode() : children = {}, isEndOfWord = false;
}

class Trie {
  TrieNode root;

  Trie() : root = TrieNode();

  void insert(String word) {
    TrieNode currentNode = root;

    for (int i = 0; i < word.length; i++) {
      final char = word[i];
      if (!currentNode.children.containsKey(char)) {
        currentNode.children[char] = TrieNode();
      }
      currentNode = currentNode.children[char]!;
    }

    currentNode.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode currentNode = root;

    for (int i = 0; i < word.length; i++) {
      final char = word[i];
      if (!currentNode.children.containsKey(char)) {
        return false;
      }
      currentNode = currentNode.children[char]!;
    }

    return currentNode.isEndOfWord;
  }

  bool delete(String word) {
  return _delete(root, word, 0); // Start delete process from the root node
}

bool _delete(TrieNode node, String word, int depth) {
  if (depth == word.length) {
    if (!node.isEndOfWord) {
      return false; // Word not found, can't delete
    }
    node.isEndOfWord = false; // Mark the end of word as false (unmark the word)
    return node.children.isEmpty; // Return true if this node has no children
  }

  final char = word[depth]; // Get the character at current depth
  final childNode = node.children[char]; // Find the child node for the character
  if (childNode == null) {
    return false; // Word not found, can't delete
  }

  bool shouldDeleteChild = _delete(childNode, word, depth + 1); // Recursively delete in child node

  if (shouldDeleteChild) {
    node.children.remove(char); // Remove the child node if it's marked for deletion
    return node.children.isEmpty && !node.isEndOfWord; // Return true if this node has no children and is not marked as a word
  }

  return false; // Return false if deletion was not successful
}

}

void main() {
  Trie trie = Trie();

  trie.insert("apple");
  trie.insert("app");
  trie.insert("banana");
  trie.insert("banaaa");

  print(trie.search("apple")); // Output: true
  print(trie.search("app"));   // Output: true
  print(trie.search("orange")); // Output: false
  print(trie.search("banaaa"));

  // print(trie.delete("app")); // Output: true (successfully deleted)
  // print(trie.search("app")); // Output: false

  print("Trie insertion, search, and delete completed.");
}
