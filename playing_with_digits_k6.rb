def dig_pow(n, p)
	sum = 0
    n.to_s.chars.map(&:to_i).each do |n| 
    	to_add = n ** p
    	sum += to_add
    	p += 1
    end
    if sum%n == 0
    	return sum/n	
    else
    	return -1
    end
end

# p dig_pow(46288, 3)

def dig_pow1(n, p)
	sum = 0
    n.to_s.chars.map{|x| x.to_i}.each do |n| 
    	sum += n**p
    	p += 1
    end
    return sum%n == 0 ? sum/n : -1
end

p dig_pow(46288, 3)