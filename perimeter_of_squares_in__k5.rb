

def perimeter2(n)
	return 4 if n == 0
	return 8 if n == 1
	fib_n__2 = 1; fib_n__1 = 1
	for i in 2..(n+2)
		fib_n = fib_n__2 + fib_n__1
		fib_n__2, fib_n__1 = fib_n__1 , fib_n
	end
	return (fib_n - 1)*4
end

def perimeter3(n)
	return 4 if n == 0
	return 8 if n == 1
	fib_n__2 = 1; fib_n__1 = 1
	for i in 2..(n+2)
		fib_n = fib_n__2 + fib_n__1
		fib_n__2, fib_n__1 = fib_n__1 , fib_n
	end
	return (fib_n - 1)*4
end

def fib_f(n)
    phi_plus = (1+ Math.sqrt(5)) / 2 ; phi_minus = (1 - Math.sqrt(5)) / 2
	((1/Math.sqrt(5))*(phi_plus**(n) - phi_minus**(n))).to_i
end

# def fib_f(n)
#   return 0 if n == 0
#   return 1 if n == 1
#   fib_f(n-1) + fib_f(n-2)
# end



def fib_v1 n
	return nil if n < 0
	fib_ten = [0,1,1,2,3,5,8,13,21,34,55,89]
	return fib_ten[n] if n <= 11
	f_k = fib_ten[10]; f_k1 = fib_ten[11]; m = 10; i = 0
	while true
		i += 1
		f_2k = f_k*(2*f_k1 - f_k); f_2k1 = f_k1**2 + f_k**2

		f_k_prev = f_k; f_k1_prev = f_k1; m_prev = m
		f_k, f_k1, m = f_2k, f_2k1, 10*(2**i)
		
		if m > n
			break
		end
	end

	return f_k_prev if n == m_prev
	return f_k1_prev if n == m_prev+1
	#if now iterate up to n
	j = n - m_prev - 1
	f_n__2 = f_k_prev; f_n__1 = f_k1_prev; 

	for i in 1..j
		f_n = f_n__2 + f_n__1
		f_n__2, f_n__1 = f_n__1, f_n
	end

	return f_n
end

fibs = []
for i in 0..32
	fibs << fib_v1(i)
end
#p fibs
##p (fib_v1 400000).to_s.length

def fib_double f_k, f_k1, times
	for i in 1..times
		f_k, f_k1 = f_k*(2*f_k1 - f_k), f_k1**2 + f_k**2
	end
	result = []; result << f_k; result << f_k1
end

def fib n
	return nil if n < 0
	first_fibs = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 
				987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 
				121393, 196418, 317811, 514229, 832040, 1346269, 2178309]
	m = n.to_f; i = 0
	while m > first_fibs.length - 2  #true as long as m is 32 or more, keep dividing
		m /= 2
		i += 1
	end
	m = m.to_i

	fib_db = fib_double first_fibs[m], first_fibs[m+1], i
	f_k_2 = fib_db[0]; f_k_1 = fib_db[1]

	(n-m*(2**i)).times do
		f_k_2, f_k_1 = f_k_1, f_k_2+f_k_1
	end
	return f_k_2
end

def perimeter(n)
	(fib(n+3)-1)*4
end


def perimeter(n)
  (n.times.inject([1,2]){|a,x| a = [a.last, a.first+a.last]}.last-1)*4
end

require 'matrix'

def perimeter(n)
  4 * ((Matrix[[1, 1], [1, 0]] ** (n + 3))[1, 0] - 1)
end

def perimeter(n)
    # S(0) + ... + S(n) == S(n+2) - 1
    # I leave it as an exercise for the reader to prove this
    # by induction.
    a = 1 # S(1)
    b = 2 # S(2)
    n.times do
      c = a + b
      a = b
      b = c
    end
    return 4 * (b-1)
end

#HOW THE HELL DID THIS GET TO PASS!!!!!!! YOU GOTTA BE JOKING!!!!


# p fib_v2 123
# #p fib_double(832040,1346269,2)
# p fib_v1 123
# 
# puts ""
# puts ""
# p "#{fib_v1 80} -- #{fib_v1 81}"
# p fib_double(55,89,3)

#p fib_v1(100000) == fib_v2(100000)
#fib_v2 1000000

