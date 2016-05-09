def sumOfDivided(lst)
	max = lst.map{|x| x = x.abs}.max
	require 'prime'
 	prime_factors = Prime.take_while {|p| p < max}
 	result = []
 	prime_factors.each do |p|
 		sum = 0
 		divides_p = false
 		lst.each do |num|
 			if num%p == 0
 				sum += num
 				divides_p = true
 			end
 		end 
		if divides_p == true
	 		to_append = []
	 		to_append << p
	 		to_append << sum
	 		result << to_append
 		end	
 	end
 	result
end

#p [-20,4,14].map{|x| x = x.abs}.max
p sumOfDivided([12, 15,-40,26])
p sumOfDivided([12,15])