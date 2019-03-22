
def first_anagram?(string1)
  return [string1] if string1.length <= 1
  first = string1.chars.first
  perms = first_anagram?(string1[1..-1])
  anagrams = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      anagrams << (perm[0...i] + first + perm[i..-1])
    end
  end
  anagrams
end

def second_anagram?(string1, string2)
  string1.each_char.with_index do |el, i|
    string2.delete!(el) #mutate or else letter will come back with vengance 
  end

  string2.empty?
end

def third_anagram?(string1, string2)
  jumble_sort(string1) == jumble_sort(string2)
end

def jumble_sort(string)
  alphabet = ("a".."z").to_a

  is_sorted = false
  while !is_sorted
    is_sorted = true

    (string.length).times do |j|
      break if j == string.length - 1
      if alphabet.index(string[j]) > alphabet.index(string[j+1])
        string[j], string[j+1] = string[j+1], string[j]
        is_sorted = false
      end
    end
  end
  string
end