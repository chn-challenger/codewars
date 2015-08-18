def reverse_it(data)
	if data.is_a?(String)
		return data.to_s.reverse
	elsif data.is_a?(Integer)
		return data.to_s.reverse.to_i
	elsif data.is_a?(Float)
		return data.to_s.reverse.to_f
	else
		return data
	end	
end

def reverse_it2(data)
  return data.reverse if data.is_a? String
  return data.to_s.reverse.to_i if data.is_a? Fixnum
  return data.to_s.reverse.to_f if data.is_a? Float
  data
end

puts "#{'dfasdf'.is_a? (String)}"
puts "#{reverse_it(1.2341)}"
