def isTriangleNumber1(num)
  	num = num*2
  	lower = Math.sqrt(num).floor; upper = Math.sqrt(num).floor + 1
  	if lower*upper == num
  		return true
  	else
  		return false
  	end
end

def isTriangleNumber(num)
    return false if num.is_a?(Integer) == false
    return false if num.to_i.to_f != num.to_f
  	Math.sqrt(num*2).floor * (Math.sqrt(num*2).floor + 1) == num*2 ? true : false
end
