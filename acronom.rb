def make_acronym(phrase)
    letters = ("a".."z").to_a << " "
    if phrase.is_a? String
      for i in 0...phrase.length
          unless letters.include?(phrase.downcase[i])
              return "Not letters"
          end
      end
      array = phrase.split(" ")
      array = array.map!{|x| x[0].upcase}.join("")
      return array
    else
        return "Not a string"
    end
end


#letters = ("a".."z").to_a
#puts "#{array3[2]}"

puts "#{make_acronym("asd2 df")}"
