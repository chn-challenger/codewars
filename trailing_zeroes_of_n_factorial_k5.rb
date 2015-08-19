def zeros2(n)
	return 0 if n == 0
  	num_of_twos = 0; num_of_fives = 0
  	for i in 1..n
  		#puts "i = #{i}"
  		while i%2 == 0
  			#puts "i = #{i} in while."
  			i = i/2
  			num_of_twos += 1
  		end
  	end
  	for i in 1..n
  		#puts "i = #{i}"
  		while i%5 == 0
  			#puts "i = #{i} in while."
  			i = i/5
  			num_of_fives += 1
  		end
  	end
  	puts "num_of_twos #{num_of_twos}"
  	puts "num_of_fives #{num_of_fives}"
  	return num_of_fives
end

def zeros1(n)
	num_of_fives = 0
  	(1..n).each do |i|
   		while i%5 == 0
   			i = i/5
  			num_of_fives += 1
  		end
  	end
   	return num_of_fives
end

def zerosv5(n)
	num_of_fives = 0
	index_of_five = 1
	while true
		power_of_five = 5**index_of_five
		if n >= power_of_five
			num_of_fives += n/power_of_five
			index_of_five += 1
		else
			break
		end
	end
	return num_of_fives
end

def zeros(n)
	num_of_fives = 0
	index_of_five = 1
	while n >= 5**index_of_five
		num_of_fives += n/(5**index_of_five)
		index_of_five += 1
	end
	return num_of_fives
end

def fact(n)
	if n == 1
		return 1
	else
		return n*fact(n-1)
	end
end

#p fact(10)
#p zeros1(10)

#p zeros(1)
#p zeros1(123456789) #2499999
p zeros(12345678900000000000000000) #3086419724999999999999991
