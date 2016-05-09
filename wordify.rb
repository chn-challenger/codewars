def wordify(n)
	the_number = ''
	m = n
	if n == 0
		the_number = 'zero'
	end
	if n == 10
		the_number = 'ten'
	end
	ones =['one','two','three','four','five','six','seven','eight','nine']
	teens = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
	tens = ['ten','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']

	if n > 99
		current = (n/100).to_i
		the_number = ones[current-1] + ' hundred '
		n = n - current*100 
	end

	if n > 0 && n < 10
		the_number = the_number + ones[n-1]
	elsif n > 10 && n < 20
		the_number = the_number + teens[n-11]
	elsif n > 19 && n < 100 
		if n%10 == 0
			the_number = the_number + tens[(n/10).to_i - 1]		
		else
			the_number = the_number + tens[(n/10).to_i - 1] + ' ' + ones[(n%10).to_i - 1]
		end
	end

	if m%100 == 0
		the_number = the_number.slice(0...the_number.length-1)
	end

	return the_number
end

puts wordify(100)
#the second part can surely be refactored...another day