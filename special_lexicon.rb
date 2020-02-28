require './lexicon'

class String
  def sorted_letters
    downcase.chars.sort.join
  end
end

class SpecialLexicon < Lexicon

  # Generates an array of all the anagrams of the given word
  # You can find the anagram for marsipobranchiata
  # You do it in better than O(n) time, for n = size of the dictionary

  # Approach is to hash words in the dictionary such that
  # key stores sorted letters; value points to all anagrams in the dictionary
  # Example of [key => value] pair => { "act" => ["cat", "act"] }
  # Call is_word from Lexicon class and if true return values from hash

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
    
    # Checks if the word exists in the dictionary i.e. it's a real word
    # If true returns anagrams from sorted_hash
    # Example: word = act sorted_hash["act"] => ["cat", "act"]
    # else return empty array
    if is_word?(word)
      return @sorted_hash[word.chars.sort.join]
    else 
      return []
    end
  end


  # Generates an array of all the words that have the given word as a prefix
  def get_prefixed_words(prefix)
    # FILL ME IN

    return []
  end


  # Generates the shortest possible word ladder connecting the two words
  def get_word_ladder(start_word, end_word)
    # FILL ME IN
    return []
  end
end
