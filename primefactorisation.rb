def primeFactors_old(n)
	require 'prime'

	prime_factors = []

	my_primes = Prime.take_while {|p| p <= n }	 

	my_primes.each do |x|
		while n % x == 0 && n != 0
			prime_factors << x
			n = n / x
		end		
	end	
	return prime_factors


	until n == 1
		while n % current_prime == 0
			prime_factors << current_prime
			n = n / current_prime
		end	
		current_prime = next_prime(current_prime)
	end
	return prime_factors.collect!(&:to_s)	




end




def next_prime(p)
	require 'prime'
	i = p+1 
	until Prime.prime?(i)
		i += 1
	end
	return i
end


def primeFactors(n)
	require 'prime'
	current_prime = 2
	result = ""
	until n == 1
		count = 0 
		while n % current_prime == 0
			count += 1
			n = n / current_prime
		end	
		if count == 0
		elsif count == 1
			result = result +"("+ current_prime.to_s + ")"
		else
			result = result +"("+ current_prime.to_s + "**" + count.to_s + ")"
		end
		current_prime = next_prime(current_prime)
	end
	return result
end


#SOLUTIONS


require "mathn"
def primeFactors(n)
  n.prime_division.map{|p,k|
    if k == 1
      "(#{p})"
    else
      "(#{p}**#{k})"
    end
  }.join
end

def primeFactors(n)
    res = ""
    fac = 2
    while (fac <= n) do
        count = 0
        while (n.modulo(fac) == 0)
            count += 1
            n = n / fac
        end
        if (count > 0) then
            res << "(" + fac.to_s + (count > 1 ? "**" + count.to_s : "") + ")"
        end
        fac += 1
    end
    res
end