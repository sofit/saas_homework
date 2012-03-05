def palindrome?(string)
  x = string.downcase.gsub(/\W/, "")
  x == x.reverse
end

def count_words(string)
  result = Hash[]
  string.downcase.gsub(/\b\w+/) { |word| result[word] == nil ? result[word] = 1 : result[word] = result[word] + 1}
  result
end