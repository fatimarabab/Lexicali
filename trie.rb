require './lexicon'

# Here we define a Trie class to handle get_prefixes method more efficiently
# Trie - A prefix tree that organizes a list of words to quickly find words with given "prefix"

# Defining Node class to be used in Trie
class Node
    attr_reader   :value, :next
    attr_accessor :word
    def initialize(val)
      @value = val # Stores character of the word
      @word  = false # tracks if word is valid or not
      @next  = [] # Stores all characters (as Nodes) that come after value in the tree in an array
    end
end


class Trie < Lexicon

    def initialize
        @root = Node.new("*")
        super
    end

    # Adds Lexicon onto the Trie
    # Breaks down words into an array of characters
    def add_word()
        @array.each do |word| 
            letters = word.chars
            base = @root
            letters.each { |letter| base = add_character(letter, base.next) }
            base.word = true
        end
    end
    
    # Find's word in the Trie
    def find_word(word)
        letters = word.chars
        base = @root
        word_found =
        letters.all? { |letter| base = find_character(letter, base.next) }
        yield word_found, base if block_given?
        base
    end

    # Helper method for add_word
    # First check if character already exists. If true => return the character node
    # Else create & return new character node
    def add_character(character, trie)
        trie.find { |n| n.value == character } || add_node(character, trie)
    end
    
    # Helper method for find_word
    def find_character(character, trie)
        trie.find { |n| n.value == character }
    end
    
    # Helper method for add_character
    # To add new node in Trie
    def add_node(character, trie)
        Node.new(character).tap { |new_node| trie << new_node }
    end

    # Using Depth First Search we find words in the Lexicon beginning with given prefix
    # Using 2 stacks; unvisited_stack => tracks unvisited nodes, prefix_stack => keeps track of current string
    # Loop until visited all the nodes & add the value of the node to the prefix_stack. 
    # Since 1 node holds value for one character, we collect these characters to form a valid word.
    # To remove characters from prefix_stack at the right time, we use bracktracking
    # To know when we are backtracking :guard_node symbol is added to the prefix_stack 
    # If node.word is true it means we found a full word & we add it to our list of words.
    def find_words_starting_with(prefix)
        unvisited_stack = []
        words = []
        prefix_stack = []
        unvisited_stack << find_word(prefix)
        prefix_stack << prefix.chars.take(prefix.size-1)
        return [] unless unvisited_stack.first
        until unvisited_stack.empty?
          node = unvisited_stack.pop
          prefix_stack.pop and next if node == :guard_node
          prefix_stack << node.value
          unvisited_stack << :guard_node
          words << prefix_stack.join if node.word
          node.next.each { |n| unvisited_stack << n }
        end
        return words
    end
end

# TESTING
# MAIN
# obj = Lexicon.new

# trie = Trie.new
# trie.add_word()

# p trie.find_words_starting_with("abu")

# Expected Output:
# ["abu", "abuzz", "abut", "abutting", "abutter", "abuttal", "abutment", "abutilon", "abuta", "abusive", "abusiveness", "abusively", "abusious", "abusion", "a
#     buse", "abuser", "abuseful", "abusefulness", "abusefully", "abusee", "abusedly", "abusable", "aburton", "aburst", "aburban", "abura", "aburabozu", "abundant
#     ", "abundantly", "abundantia", "abundancy", "abundance", "abuna", "abulomania", "abulic", "abulia", "abucco"]