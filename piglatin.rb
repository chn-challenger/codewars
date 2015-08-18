def pig_latin(string)
  vowels = ["a","e","i","o","u"]
  consonants = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","x","z","w","y"]
  letters = consonants + vowels
  temp_consnts = ""  
  string.downcase!

  if string == ""
      return nil
  end
  
  for i in 0...string.length
      return nil unless letters.include?(string[i])
  end

  if vowels.include?(string[0])
      return string + "way"
  else
      i = 1
      while consonants.include?(string[0]) && i <= string.length          
          temp_consnts = string[0]
          string = string.slice(1..string.length) + temp_consnts  
          i += 1
      end
      return string + "ay"
  end
end

def pig_latin2(string)
  str = string.downcase
  return nil if /^[a-z]+$/ !~ str
  v = str.index(/[aeiou]/)
  return "#{str}ay" if !v
  return "#{str}way" if v == 0
  return "#{str[v..-1]}#{str[0..v - 1]}ay"
end


puts "#{"ssdff".index(/[aeiou]/)}"