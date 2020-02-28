class Lexicon

  def initialize
    # The full array of all words
    @array = []
    # A hash containing all the words as keys
    @hash = {}
    # A hash containing sorted word as key and values as all corresponding words
    # Example: {"act" => ["cat", "act"]}
    @sorted_hash = Hash.new{|hsh,key| hsh[key] = [] }

    file = File.new('words.txt', 'r')
    while (line = file.gets)
      line.strip!.downcase!
      @array.push line
      @hash[line] = true
      word = line
      word.chars.sort.join
      if is_sorted_key?(word)
        @sorted_hash[@word] << line
      else
        @sorted_hash[@word] = []
        @sorted_hash[@word] << line
      end
    end
    file.close
  end

  def is_sorted_key?(word)
    return @sorted_hash.has_key?(word)
  end

  # Returns true if the given word is in the lexicon
  def is_word?(word)
    return @hash.has_key?(word.downcase)
  end
end
