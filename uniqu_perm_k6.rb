def factorial(n)
	(1..n).reduce(:*) || 1
end

def perms(element)
  result = []
  chars = element.to_s.split("")
  incase = 1
  while chars.length > 0 && incase < 100
  	curr_char = chars[0]
  	result << chars.count(curr_char)
  	chars.delete(curr_char)
  	incase += 1
  end
  result
  sum = result.inject(0){|r,e| r = r + e}
  value = factorial(sum)
  result.each do |num|
  	value = value / factorial(num)
  end
  value
end
