def makeacopy(n)
	originaln = n  #save this!
	n = n + 1
	if n == originaln
		"Same stuff"
	else
		return [originaln,n]
	end
end

puts "#{makeacopy(015)}"