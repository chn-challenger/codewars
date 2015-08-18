def persistence(n,count = 0)
	count = count
	result = 1
	digits = n.to_s.split('')
	if digits.length > 1
	   	count += 1
	   	digits.each{|x| result *= x.to_i }
	end
	if result < 10
	   	return count
	else
	   	persistence(result,count)
	end
end
