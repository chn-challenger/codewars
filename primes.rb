def primes(n)
	primes = [2]
	for i in 3..n		
		is_prime = true		
		primes.each do |x|
			if i % x == 0 || is_prime == false
				is_prime = false
			end		
		end

		if is_prime == true
			primes << i
		end
	end
	return primes	
end

def primes2(n)
	primes = [2]
	for i in 3..n		
		is_prime = true		
		primes.each { |x| is_prime = false if i % x == 0 || is_prime == false } 
		primes << i if is_prime == true
	end
	return primes	
end

def backwardsPrime(start, stop)
	return [] if stop == 2
	result = []
	primes = [2]
	for i in 3..10**stop.to_s.length.to_i		
		is_prime = true		
		primes.each { |x| is_prime = false if i % x == 0 || is_prime == false } 
		primes << i if is_prime == true
	end
	primes.collect!{|x| x.to_s}

	primes.each do |x| 
		if  primes.include? x.reverse 
			if x != x.reverse 
			 	result << x
			end
		end
	end
	return result.collect!(&:to_i).delete_if{|x| x < start || x > stop}
end

#primes.include? x.reverse

require 'prime'

array = Prime.first 5

puts "#{array}"
#puts "#{backwardsPrime(1,7)}"
#puts "#{primes2(100)}"