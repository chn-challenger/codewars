def sumFracts(lst)
	if lst == []
		return nil
	end	
	sum_numerator = 0
	new_lst = []
	denominators = []
	for i in 1..lst.length
		denominators << lst[i-1][1] 
	end
	lcd = denominators.reduce(:lcm)
	for i in 1..lst.length
		sum_numerator += lst[i-1][0]*(lcd/lst[i-1][1])
	end
	hcf = lcd.gcd(sum_numerator)
	sum_numerator = sum_numerator / hcf
	lcd = lcd / hcf
	if lcd == 1
		return sum_numerator
	end
	return [sum_numerator,lcd]
end


def gcd(x,y)
  gcd(y % x,x) rescue y
end

def sumFracts(lst)
  if lst==nil or lst ==[] then 
    nil
  else
    n,d = lst.inject([0,1]){|r,v| [r[0]*v[1]+v[0]*r[1],r[1]*v[1]]}
    g = gcd n,d
    d/g==1 ? n/g : [n/g, d/g]
  end
end

puts "#{sumFracts([[1,3],[3,4],[2,5],[4,10]])}"
puts "#{sumFracts([[1,2],[1,2],[1,4],[3,4]])}"
puts "#{sumFracts([[1, 2], [1, 3], [1, 4]])}"