def oddity(n)
	return ((n.to_f**0.5).to_i**2).to_i == n ? "odd" : "even"
end

puts "#{oddity(12)}"
puts "#{oddity(13)}"
puts "#{oddity(16)}"
puts "#{oddity(25)}"
puts "#{oddity(81)}"