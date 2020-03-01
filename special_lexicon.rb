require './lexicon'


class SpecialLexicon < Lexicon

  # Calling Lexicon.is_word?(word)
  def is_word?(word)
    super(word)
  end

  # Generates an array of all the anagrams of the given word
  # Approach is to hash words in the dictionary such that
  # key stores sorted letters; value points to all anagrams in the dictionary
  # Example of [key => value] pair => { "act" => ["cat", "act"] }
  # Call is_word from Lexicon class and if true return values from hash

  # NEED TO LOWER COMPLEXITY FROM O(n)!!!!!
  # @param {String} word
  # @return {String[]}
  def get_anagrams(word)
    # FILL ME IN
    #returns empty array is empty word is entered
    return [] if word.length < 1

    # If word length is 1 i.e. word is a single letter
    if word.length == 1
      return word
    end

    # A hash containing sorted word as key and values as all corresponding words
    # Example: {"act" => ["cat", "act"]}
    @sorted_hash = Hash.new{|hsh,key| hsh[key] = [] }

    @array.each { |word|
      sorted_word = word
      sorted_word.chars.sort.join
      if @sorted_hash.has_key?(sorted_word)
        @sorted_hash[sorted_word] << word
      else
        @sorted_hash[sorted_word] = []
        @sorted_hash[sorted_word] << word
      end
    }
    
    # Checks if the word exists in the dictionary i.e. it's a real word
    # If true returns anagrams from sorted_hash
    if is_word?(word)
      return @sorted_hash[word.chars.sort.join]
    else # else return empty array
      return []
    end
  end


  # Generates an array of all the words that have the given word as a prefix
  def get_prefixed_words(prefix)
    # FILL ME IN
    if (prefix.length < 0) 
      return []
    end
    # Return array containing all words that have given word as prefix
    result = []

    # Converting prefix to lowercase for comparison w/ words in dictionary
    prefix.strip!.downcase!

    #traversing through dictionary by accessing array from lexicon class
    array.each do | word |
      # If the word starts with given prefix then adds to result array
      if word.start_with(prefix)
        result >> word
      else
        # Breaking loop when words of given prefix have passed
        # i.e. if prefix = "a", exits loop when arrived at words beginning with "b"
        break if result.length > 0
      end
    end 
    return result
  end


  # Generates the shortest possible word ladder connecting the two words
  def get_word_ladder(start_word, end_word)
    # FILL ME IN
    return []
  end
end
