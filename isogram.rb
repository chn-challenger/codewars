def is_isogram(string)
	array = []
  for i in 0...string.length
  	array[i] = string[i].downcase
  end
  	array.sort!

  	is_iso = 'true'

  for j in 0..(array.length - 2)
  	if array[j] == array[j+1]
  		is_iso = 'false'
  	end
  end

  if is_iso == 'true'
  	return true
  else
  	return false
  end

end

def is_isogram_short(string)
  string.downcase.chars.uniq == string.downcase.chars
end

puts "#{is_isogram('absdfgA').to_s}"
#array = ["a","b"]
#puts array[0] == array[1] ? 'true' : 'false'