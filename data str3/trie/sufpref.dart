class trienode {
  final Map<String, trienode> children;
  bool isword;

  trienode() : children = {}, isword = false;
}

class trie {
  trienode root;

  trie() : root = trienode();

  void insert(String word) {
    trienode current = root;

    for (int i = 0; i < word.length; i++) {
      final char = word[i];
      if (!current.children.containsKey(char)) {
        current.children[char] = trienode();
      }
      current = current.children[char]!;
    }
    current.isword = true;
  }

  bool search(String word) {
    trienode current = root;
    for (int i = 0; i < word.length; i++) {
      final char = word[i];
      if (!current.children.containsKey(char)) {
        return false;
      }
      current = current.children[char]!;
    }
    return current.isword;
  }

  List<String> keysWithPrefix(String prefix) {
    trienode current = root;
    for (int i = 0; i < prefix.length; i++) {
      final char = prefix[i];
      if (!current.children.containsKey(char)) {
        return [];
      }
      current = current.children[char]!;
    }
    return collectKeysWithPrefix(current, prefix);
  }

  List<String> collectKeysWithPrefix(trienode current, String word) {
    List<String> arr = [];
    if (current.isword) {
      arr.add(word);
    }
    for (var entry in current.children.entries) {
      arr.addAll(collectKeysWithPrefix(entry.value, word + entry.key));
    }
    return arr;
  }

  List<String> suffix(String key) {
  List<String> suff = [];
  for (int i = 0; i < key.length; i++) {
    String suffix = key.substring(i);
    suff.add(suffix);
  }
  return suff;
}

int countSuffixOccurrences(trie t, String suffix) {
  List<String> keys = t.keysWithPrefix(suffix);
  return keys.length;
}
}

void main() {
  trie tr = trie();
  tr.insert("hi");
  tr.insert("hello");
    tr.insert("hey");
  tr.insert("hemme");
  tr.insert("helooooo");
  tr.insert("hiii");

  print(tr.search("hi"));
  print(tr.search("hello"));

  List<String> keysPrefix = tr.keysWithPrefix("he");
  print("Keys with prefix 'he': $keysPrefix");

  print(tr.suffix("hello"));
  print(tr.countSuffixOccurrences(tr, "hello"));
}
