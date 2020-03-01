require './lexicon'


class SpecialLexicon < Lexicon

  # Calling Lexicon.is_word?(word)
  def is_word?(word)
    super(word)
  end

  # Generates an array of all the anagrams of the given word
  # Approach : hash words from the dictionary such that
  # key stores sorted letters; value points to corresponding anagrams from dictionary
  # Example of [key => value] pair => { "act" => ["cat", "act"] }

  # NEED TO LOWER COMPLEXITY FROM O(n)!!!!!
  # @param {String} word
  # @return {String[]}
  def get_anagrams(word)
    #returns empty array is empty word is entered
    return [] if word.length < 1

    # If word length is 1 i.e. word is a single letter
    if word.length == 1
      return word
    end

    # A hash containing sorted word as key and values as all corresponding words
    # Example: {"act" => ["act", "cat"]}
    anagrams = Hash.new{|hsh,key| hsh[key] = [] }

    #Hashing dictionary words to appropriate anagram key, value pairs
    @array.each do  |dictionary_word|
      if anagrams[dictionary_word.chars.sort].include?(dictionary_word)
        next # Skips current word so as to not add duplicates
      else
        anagrams[dictionary_word.chars.sort].push(dictionary_word)
      end
    end
    
    # Checks if the word exists in the dictionary i.e. it's a real word
    # If true returns anagrams from anagrams hash
    if is_word?(word.downcase)
      return anagrams[word.downcase.chars.sort]
    else # else return empty array
      return []
    end
  end
  # Time Complexity is O(n) to iterate through dictionary and create hash
  # Space Complexity is O(n) to store hash


  
  # Generates an array of all the words that have the given word as a prefix
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
  def get_word_ladder(start_word, end_word)
    # FILL ME IN
    return []
  end
end

# TESTING
# obj = SpecialLexicon.new

# anagram = obj.get_anagrams("ACT")
# puts anagram

# prefix_words = obj.get_prefixed_words("Abab")
# puts prefix_words


