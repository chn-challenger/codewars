def small_english_number(num,with_and = false)
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
		the_number += 'and ' if with_and == true
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

def english_number(num,with_and = false)
	left = num
	current = 0
	the_number = ''
	large_units = [" trillion "," billion "," million "," thousand ",""]
	for i in 0..4
		power_index = 3*(4-i)
		if left.to_s.length > power_index
			current = (left / (10**power_index)).to_i
			left -= current*(10**power_index)
			if with_and == true
				the_number += (small_english_number(current,true) + large_units[i])	
			else
				the_number += (small_english_number(current) + large_units[i])	
			end
			the_number += 'and ' if (with_and == true && i != 4)
		end
	end
	return the_number 
end

puts english_number(551151,true)



def bottles_of_beerv1(n)
	num_beer = n

	puts ''
	puts 'Lyrics to \'99 Bottles of beer\''.center(70)
	puts ''

	while true
		puts 	num_beer.to_s + ' bottles of beer on the wall, ' + 
				num_beer.to_s + ' bottles of beer.'
		num_beer = num_beer - 1
		
		if num_beer != 0
			puts 	'Take one down and pass it around, ' + num_beer.to_s + 
					' bottles of beer on the wall.'			
		else
			puts 	'Take one down and pass it around, no more bottles of beer on the wall.' 
			break
		end
	end

	puts 'No bottles of beer on the wall, no more bottles of beer'
	puts 'Go to the store and buy some more, 99 bottles of beer on the wall'
end

#bottles_of_beerv1(12)









def english_numberV1(num)
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

def test1(x,y)
	test_range = (x..y).to_a
	num_of_error = 0
	test_range.each {|x| num_of_error += 1 unless english_number(x) == english_numberV1(x)}
	return num_of_error
end

#puts test1(50000000,50001000)
#the second part can surely be refactored...another day

