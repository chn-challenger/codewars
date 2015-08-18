def small_english_number(num)
	the_number = ''
	if num == 0
		the_number == 'zero'
	end
	ones =['one','two','three','four','five','six','seven','eight','nine']
	teens = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
	tens = ['ten','tweenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']

	if num > 99
		current = (num/100).to_i
		the_number = ones[current-1] + ' hundred '
		num = num - current*100 
	end

	if num > 0 && num < 10
		the_number = the_number + ones[num-1]
	elsif num > 10 && num < 20
		the_number = the_number + teens[num-11]
	elsif num > 19 && num < 100 
		the_number = the_number + tens[(num/10).to_i - 1] + ' ' + ones[(num%10).to_i - 1]
	end

	return the_number
end

def english_number(num)
	left = num
	current = 0
	the_number = ''
	if left.to_s.length > 12
		current = (left / 1000000000000).to_i
		left = left - current*1000000000000
		the_number = small_english_number(current) + ' trillion '
	end
	if left.to_s.length > 9
		current = (left / 1000000000).to_i
		left = left - current*1000000000
		the_number = the_number + small_english_number(current) + ' billion '
	end
	if left.to_s.length > 6
		current = (left / 1000000).to_i
		left = left - current*1000000
		the_number = the_number + small_english_number(current) + ' million '
	end
	if left.to_s.length > 3
		current = (left / 1000).to_i
		left = left - current*1000
		the_number = the_number + small_english_number(current) + ' thousand '
	end
	if left.to_s.length > 0
		current = left.to_i
		left = left - current
		the_number = the_number + small_english_number(current) + ''
	end
	return the_number 
end

puts small_english_number(857)
#the second part can surely be refactored...another day