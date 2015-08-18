


require "mathn"
def primeFactors1(n)
  n.prime_division.map{|p,k|
    if k == 1
      "(#{p})"
    else
      "(#{p}**#{k})"
    end
  }.join
end

def primeFactors2(n)
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


class PrimeFactorizer
	def initialize(n)
		@n = n
	end
	def factor
		result = Hash.new
		res = ""
    	fac = 2
    while (fac <= @n) do
        count = 0
        while (@n.modulo(fac) == 0)
            count += 1
            @n = @n / fac
        end
        if (count > 0) then
        	result[fac] = count        	
            #res << "(" + fac.to_s + (count > 1 ? "**" + count.to_s : "") + ")"
        end
        fac += 1
    end
    result
	end
end

x = PrimeFactorizer.new(20)
puts x.factor

#puts "#{primeFactors2(2312900)}"