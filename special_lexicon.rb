require './lexicon'
require "set"
# require 'Tuple'

class SpecialLexicon < Lexicon

  # Calling Lexicon.is_word?(word)
  def is_word?(word)
    super(word)
  end

  # Here we preprocess the dictionary into two hash maps 
  # words_to_sorted stores in the format { "tar" => "art", "rat" => "art"}
  # anagrams stores in the format: { "act" => ["cat", "act"] }
  def preprocess_anagrams
    # A hash containing word as key and the sorted word as value
    @words_to_sorted = Hash.new{|hsh,key| hsh[key] = ""}
    # Initializing words_to_sorted hash
    @array.each do |dictionary_word|
      @words_to_sorted[dictionary_word] = dictionary_word.chars.sort
    end

    # A hash containing sorted word as key and values as all corresponding words
    @anagrams = Hash.new{|hsh,key| hsh[key] = [] }
    # Initializing anagrams Hash
    @array.each do  |dictionary_word|
      if @anagrams[dictionary_word.chars.sort].include?(dictionary_word)
        next # Skips current word so as to not add duplicates
      else
        @anagrams[dictionary_word.chars.sort].push(dictionary_word)
      end
    end
  end
  # Time Complexity is O(n) to iterate through dictionary and create both hashes
  # Space Complexity is O(n) to store hash

  # Generates an array of all the anagrams of the given word
  # Approach : call preprocess_anagrams
  # return anagrams[words_to_sorted[word]]
  # @param {String} word
  # @return {String[]}
  def get_anagrams(word)
    #returns empty array is empty word is entered
    return [] if word.length < 1

    # If word length is 1 i.e. word is a single letter
    if word.length == 1
      return word
    end
    # Calling preprocess method to initialize both hashes
    preprocess_anagrams
    # Checks if the word exists in the dictionary i.e. it's a real word
    # If true returns anagrams from anagrams hash
    if is_word?(word.downcase)
      return @anagrams[@words_to_sorted[word.downcase]]
    else # else return empty array
      return []
    end
  end
  # Time Complexity is O(1) to get result from @anagrams hash

  
  # Generates an array of all the words that have the given word as a prefix
  # @param {String} prefix
  # @return {String[]}
  def get_prefixed_words(prefix)
    if (prefix.length < 0) 
      return []
    end
    # Return array containing all words that have given word as prefix
    result = []

    #traversing through dictionary by accessing array from lexicon class
    @array.each do | word |
      # If the word starts with given prefix then adds to result array
      if word.start_with?(prefix.downcase)
        result.push word
      else
        # Breaking loop when words of given prefix have passed
        # i.e. if prefix = "a", exits loop when arrived at words beginning with "b"
        break if result.length > 0
      end
    end 
    return result
  end
  # Time: O(x) where x is the index of last word beginning with prefix in dictionary
  # In worst case O(n) where the last word occurs at end of array


  # Generates the shortest possible word ladder connecting the two words
  # Approach: Using BFS find shortest path b/w start_word and end_word
  # @param {String} start_word, end_word
  # @return {String[]}
  def get_word_ladder(start_word, end_word)
    return 0 unless @array.include?(end_word)
    word_set = Set.new @array #all words
    result = []
    path = []
    path << start_word
    # queue [current_word, path from start_word to current_word]
    queue = [[start_word, path]] 
    while !queue.empty? do 
        prev = queue.first
        current_word = queue.first.first # current objects in queue
        current_path = queue.first.last # Path from start_word to current_word
        if current_word == end_word
          return current_path
        end
        queue.shift # Pops the queue
        current_word.size.times do |i| # Iterate through every character in current_word to find adjacent words with 1 letter difference
            left = current_word[0...i]
            right = current_word[(i + 1)...current_word.size]
            # For each current_word[i], replace it with every alphabet letter and find adjacent words to add in queue
            for c in "a".."z" do 
                if c == current_word[i]
                  next # Skips if it's the same alphabet
                end
                temp_word = left + c + right # Forms new word Example: "hit" to "hjt"
                if word_set.include?(temp_word) then # checks the word exists
                    word_set.delete(temp_word) # deletes from set so as to not repeatedly visit the same word
                    temp_path = Array.new current_path # Create a new array everytime so that we don't continue from previous word's path
                    temp_path << temp_word 
                    queue << [temp_word, temp_path] # Adding the new tuple onto the queue with word and corresponding path
                end
            end
        end
    end
    return [] # Returns empty array if no path is found
  end

end
# Time complexity is O(L * N) where L = start_word.length/end_word.length, N is the total number of words in the dictionary. 
# Finding out all the transformations takes M iterations for each of the N words. 
# Also, breadth first search in the worst case might go to each of the N words.
# Space complexity is O(N) where N is the total number of words in the dictionary for storing all words in set.
# In the worst case, Queue for BFS would need space for all N words.



# TESTING
# obj = SpecialLexicon.new

# Output: act cat
# anagram = obj.get_anagrams("ACT")
# puts anagram

# Output: ababdeh ababua
# prefix_words = obj.get_prefixed_words("abab")
# puts prefix_words

#Output should be 5
# wordList = ["hot","dot","dog","lot","log","cog"]
# "hit" -> "hot" -> "dot" -> "dog" -> "cog"
# # cold -> cord -> card -> ward -> warm
# # chair -> charr -> chirr -> shirr -> shire -> spire -> spiry -> sairy -> saily -> sably -> sable -> table 12
# ladder = obj.get_word_ladder("cold", "warm")
# puts ladder
# puts ladder.length


