def combine_anagrams(words)
  hash = Hash.new();
  words.each do |word|
    key = word.downcase.chars.sort
    array = hash[key]
    if array == nil
      array = Array.new()
    end
    array << word
    hash[key] = array
  end
  return hash.values
end
