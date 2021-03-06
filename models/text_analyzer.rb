# Your TextAnalyzer model code will go here.
class TextAnalyzer
  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end

  def count_of_words
    words = text.split(" ")
    words.count
  end

  def count_of_vowels
    text.scan(/[aeoui]/).count
  end

  def count_of_consonants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end

  def most_used_letter
    s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces
    arr = s1.split('')
    arr1 = arr.uniq #gives you an array of the letters used, no repeats
    arr2 = {} #empty hash

    arr1.map do |c|
      arr2[c] =  arr.count(c) #makes the letter a key and sets the value to the count of that letter in the original array of all letters, filling the hash with letters and their associated counts
    end

    biggest = { arr2.keys.first => arr2.values.first } #sets the hash which is used for base comparison

    arr2.each do |key, value| #iterates through the hash, and finds the letter with the biggest count
      if value > biggest.values.first #if the letter count is bigger than the base of comparison
        biggest = {} #empty the hash
        biggest[key] = value #set the hash equal to the new bigger letter count
      end
    end

    biggest
  end
end
