$CHAR_TO_MORSE = {"0"=>"-----", "1"=>".----", "2"=>"..---", "3"=>"...--", "4"=>"....-", "5"=>".....", "6"=>"-....", "7"=>"--...", "8"=>"---..", "9"=>"----.", "a"=>".-", "h"=>"....", "o"=>"---", "u"=>"..-", "b"=>"-...", "i"=>"..", "p"=>".--.", "v"=>"...-", "c"=>"-.-.", "j"=>".---", "q"=>"--.-", "w"=>".--", "d"=>"-..", "k"=>"-.-", "r"=>".-.", "x"=>"-..-", "e"=>".", "l"=>".-..", "s"=>"...", "y"=>"-.--", "f"=>"..-.", "m"=>"--", "t"=>"-", "z"=>"--..", "g"=>"--.", "n"=>"-.", "A"=>".-", "H"=>"....", "O"=>"---", "U"=>"..-", "B"=>"-...", "I"=>"..", "P"=>".--.", "V"=>"...-", "C"=>"-.-.", "J"=>".---", "Q"=>"--.-", "W"=>".--", "D"=>"-..", "K"=>"-.-", "R"=>".-.", "X"=>"-..-", "E"=>".", "L"=>".-..", "S"=>"...", "Y"=>"-.--", "F"=>"..-.", "M"=>"--", "T"=>"-", "Z"=>"--..", "G"=>"--.", "N"=>"-."}


$CHAR_TO_MORSE[' '] = ' '
def encryption(string)
  	morse_code = ''
  	string.split('').each do |c|
  		morse_code += $CHAR_TO_MORSE[c]+' '
  	end
  	morse_code.slice!(-1)
  	morse_code
end

def encryption(string)
  string.split('').map{|v| $CHAR_TO_MORSE[v] || ' ' }.join(' ')
end

def encryption(string)
  string.split(" ").map { |w| w.chars.map { |c| $CHAR_TO_MORSE[c] }.join(" ") }.join("   ")
end

def encryption(string)
  string.split('').map { |c| $CHAR_TO_MORSE[c] || c }.join(' ')
end

$dict={"E"=>1, "A"=>1, "I"=>1, "O"=>1, "N"=>1, "R"=>1, "T"=>1, "L"=>1, "S"=>1, "U"=>1, "D"=>2, "G"=>2, "B"=>3, "C"=>3, "M"=>3, "P"=>3, "F"=>4, "H"=>4, "V"=>4, "W"=>4, "Y"=>4, "K"=>5, "J"=>8, "X"=>8, "Q"=>10, "Z"=>10}

def scrabble_score(str)
  	str.upcase.gsub(' ','').split('').inject(0){|result,c| result + $dict[c]}
end

# p 'somestring'.split('').select.with_index{|c, i| i%2 == 0}.join
# p 'somestring'.split('').select.with_index{|c, i| i%2 == 1}.join


# string = ''
#     'Thisisatest'.each_char.with_index do |char, index|
#          if index.even?
#              string << char
#          end
#     end
# p string

# string = ''
# 'Thisisatest'.each_char.with_index{|char, index| string << char if index.even?}
   
def list_in_range(hash, range)
	result = ''
	hash.sort_by{|x,y| y}.to_h.select{|x,y| y >= range.first && y <= range.last}.each{|x,y| result += "#{x} (#{y}), "}
	result.slice!(-2..-1)
	return result
end

def list_in_range(hash, range)
  hash
    .select { |k, v| range.include?(v) }
    .sort_by { |k, v| v }
    .map { |k, v| "#{k} (#{v})" }
    .join(", ")
end

def solution1(array, key)
	sorted_array = array.sort_by{|h| h[key]}
	return sorted_array
end

def solution(pairs)
  	result = ''
  	pairs.each{|x,y| result += "#{x} = #{y},"}
  	result.slice!(-1)
  	return result
end

def solution(pairs)
  # TODO: complete
  pairs.map{|k,v| "#{k} = #{v}"}.join(',')
end

def keysAndValues(hash)
  	keys = []; values = []
  	hash.each{|x,y| keys << x; values <<y}
  	result = []; result << keys; result << values
end

hash1 = {'awef'=> 123,'fawef'=> 555}


def keysAndValues(data)
  [data.keys, data.values]
end

def solution11(keys, default_value)
  	hash = Hash.new
  	keys.each{|key| hash[key] = default_value}
  	return hash
end











