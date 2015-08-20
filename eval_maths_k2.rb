def basic_op a,b,op
	a = a.to_f; b = b.to_f
	case op
		when '+' then a+b
		when '-' then a-b
		when '*' then a*b
		when '/' then a/b
		else puts "#{op} operator error - not recognized"
	end
end

def valid_num(string)
	digits = ['0','1','2','3','4','5','6','7','8','9','.']
	string.split('').each{|x| return false if digits.include?(x) == false}
	return (string.count('.') == 1 || string.count('.') == 0) ? true : false
end


#p basic_op('-21','-23','aasfd+')


def eval_maths_no_brackets_v1 string
	#string = string.delete(' ')
	digits = ['0','1','2','3','4','5','6','7','8','9']
	index = nil; a = ''; b =''; op =''
	string_array = string.split('')
	string_array.each.with_index do |c,i| 
		if c == '*' || c == '/' 
			index = i
			op = c
			
			j = i - 1
			while j >= 0
				if digits.include?(string_array[j])
					a += string_array[j]
					j -= 1
				else
					j = -1 #breaks it if another operator is found
				end	
			end
			a = a.reverse


			b = string_array[i+1]
			k = i + 2
			while k < string.length
				if digits.include?(string_array[k])
					b += string_array[k]
					k += 1
				else
					k = string.length
				end
			end

			break		
		end
	end
			p a
			p op
			p b

	result = basic_op(a,b,op)
	


	#return result
	#multiply_index = string.index('*'); divide_index = string.index('/')
		
end




def eval_maths_no_brackets_v2 string
	#string = string.delete(' ')
	digits = ['0','1','2','3','4','5','6','7','8','9']
	index = nil; a = ''; b =''; op =''; insert_index = 0; insert_end_index = string.length - 1 #default value
	string_array = string.split('')
	string_array.each.with_index do |c,i| 
		if c == '*' || c == '/' 
			index = i
			op = c
			
			j = i - 1
			while j >= 0
				if digits.include?(string_array[j])
					a += string_array[j]
					j -= 1
				else
					insert_index = j+1
					j = -1 #breaks it if another operator is found
				end	
			end
			
			a = a.reverse


			b = string_array[i+1]
			k = i + 2
			while k < string.length
				if digits.include?(string_array[k])
					b += string_array[k]
					k += 1
				else
					insert_end_index = k - 1
					k = string.length
				end
			end

			break		
		end
	end
			p a
			p op
			p b

	result = basic_op(a,b,op).to_s
	p insert_index
	p string[insert_index]
	p insert_end_index
	p string[insert_end_index]
	return nil
	#return index


	#return result
	#multiply_index = string.index('*'); divide_index = string.index('/')
		
end

#p eval_maths_no_brackets('1234124+44312/-1232/498494+65551')



def eval_maths_no_brackets_v4 string
	#string = string.delete(' ')
	digits = ['0','1','2','3','4','5','6','7','8','9','.']
	index = nil; a = ''; b =''; op =''; insert_index = 0; insert_end_index = string.length - 1 #default value
	string_array = string.split('')
	string_array.each.with_index do |c,i| 
		if c == '*' || c == '/' 
			index = i
			op = c
			
			j = i - 1
			while j >= 0
				if digits.include?(string_array[j])
					a += string_array[j]
					j -= 1
				else
					insert_index = j+1
					j = -1 #breaks it if another operator is found
				end	
			end
			
			a = a.reverse


			b = string_array[i+1]
			k = i + 2
			while k < string.length
				if digits.include?(string_array[k])
					b += string_array[k]
					k += 1
				else
					insert_end_index = k - 1
					k = string.length
				end
			end

			break		
		end
	end


	result = basic_op(a,b,op).to_s
	string = string.sub(string.slice(insert_index..insert_end_index),result)	
	return string

	#return result
	#multiply_index = string.index('*'); divide_index = string.index('/')
		
end

#p eval_maths_no_brackets(eval_maths_no_brackets('5*7'))




def eval_maths_no_brackets_v5 string
	#string = string.delete(' ')
	digits = ['0','1','2','3','4','5','6','7','8','9','.']
	index = nil; a = ''; b =''; op =''; insert_index = 0; insert_end_index = string.length - 1 #default value
	mltpy_or_div_exist = false	
	string_array = string.split('')
	string_array.each.with_index do |c,i| 
		if c == '*' || c == '/' 
			index = i; mltpy_or_div_exist = true; op = c #find op

			j = i - 1 #start finding a
			while j >= 0
				if digits.include?(string_array[j])
					a += string_array[j]
					j -= 1
				else
					insert_index = j+1
					j = -1 #breaks it if another operator is found
				end	
			end
			a = a.reverse
			
			b = string_array[i+1] #find b
			k = i + 2
			while k < string.length
				if digits.include?(string_array[k])
					b += string_array[k]
					k += 1
				else
					insert_end_index = k - 1
					k = string.length
				end
			end
			break		
		end
	end

	if mltpy_or_div_exist == true
		result = basic_op(a,b,op).to_s
		string = string.sub(string.slice(insert_index..insert_end_index),result)	
		return string
	end	

	if mltpy_or_div_exist == false # ie no times or div sign was found during the first parse 
		#return 'I got you!'
		string_array.each.with_index do |c,i| 
			if c == '+' || c == '-' 
				index = i; op = c #find op

				j = i - 1 #start finding a
				while j >= 0
					if digits.include?(string_array[j])
						a += string_array[j]
						j -= 1
					else
						insert_index = j+1
						j = -1 #breaks it if another operator is found
					end	
				end
				a = a.reverse
				
				b = string_array[i+1] #find b
				k = i + 2
				while k < string.length
					if digits.include?(string_array[k])
						b += string_array[k]
						k += 1
					else
						insert_end_index = k - 1
						k = string.length
					end
				end
				break		
			end
		end		
	end 

	if mltpy_or_div_exist == false
		result = basic_op(a,b,op).to_s
		string = string.sub(string.slice(insert_index..insert_end_index),result)
		return string
	end	
		
end




def eval_maths_no_brackets_v6 string
	#string = string.delete(' ')
	digits = ['0','1','2','3','4','5','6','7','8','9','.']
	index = nil; a = ''; b =''; op =''; insert_index = 0; insert_end_index = string.length - 1 #default value
	mltpy_or_div_exist = false	
	string_array = string.split('')
	#check for multiplication or division sign, do that first
	string_array.each.with_index do |c,i| 
		if c == '*' || c == '/' 
			index = i; mltpy_or_div_exist = true; op = c #find op

			j = i - 1 #start finding a
			while j >= 0
				if digits.include?(string_array[j])
					a += string_array[j]
					j -= 1
				else
					insert_index = j+1
					j = -1 #breaks it if another operator is found
				end	
			end
			a = a.reverse
			
			b = string_array[i+1] #find b
			k = i + 2
			while k < string.length
				if digits.include?(string_array[k])
					b += string_array[k]
					k += 1
				else
					insert_end_index = k - 1
					k = string.length
				end
			end
			break		
		end
	end
	# if no times or div sign was found during the first parse, parse again for + or - sign
	if mltpy_or_div_exist == false 
		string_array.each.with_index do |c,i| 
			if c == '+' || c == '-' 
				index = i; op = c #find op

				j = i - 1 #start finding a
				while j >= 0
					if digits.include?(string_array[j])
						a += string_array[j]
						j -= 1
					else
						insert_index = j+1
						j = -1 #breaks it if another operator is found
					end	
				end
				a = a.reverse
				
				b = string_array[i+1] #find b
				k = i + 2
				while k < string.length
					if digits.include?(string_array[k])
						b += string_array[k]
						k += 1
					else
						insert_end_index = k - 1
						k = string.length
					end
				end
				break		
			end
		end		
	end 

		result = basic_op(a,b,op).to_s
		string = string.sub(string.slice(insert_index..insert_end_index),result)
		
end



def eval_maths_no_brackets string
	#string = string.delete(' ')
	string_array = string.split('')
	digits = ['0','1','2','3','4','5','6','7','8','9','.']
	index = nil; a = ''; b =''; op =''; insert_index = 0
	insert_end_index = string.length - 1; mltpy_or_div_exist = false	
	
	#check for multiplication or division sign, do that first
	string_array.each.with_index do |c,i| 
		if c == '*' || c == '/' 
			index = i; mltpy_or_div_exist = true; op = c #find op

			j = i - 1 #start finding a
			while j >= 0
				if digits.include?(string_array[j])
					a += string_array[j]
					j -= 1
				else
					insert_index = j+1
					j = -1 #breaks it if another operator is found
				end	
			end
			a = a.reverse
			
			b = string_array[i+1] #find b
			k = i + 2
			while k < string.length
				if digits.include?(string_array[k])
					b += string_array[k]
					k += 1
				else
					insert_end_index = k - 1
					k = string.length
				end
			end
			break		
		end
	end
	# if no times or div sign was found during the first parse, parse again for + or - sign
	if mltpy_or_div_exist == false 
		string_array.each.with_index do |c,i| 
			if c == '+' || c == '-' 
				index = i; op = c #find op

				j = i - 1 #start finding a
				while j >= 0
					if digits.include?(string_array[j])
						a += string_array[j]
						j -= 1
					else
						insert_index = j+1
						j = -1 #breaks it if another operator is found
					end	
				end
				a = a.reverse
				
				b = string_array[i+1] #find b
				k = i + 2
				while k < string.length
					if digits.include?(string_array[k])
						b += string_array[k]
						k += 1
					else
						insert_end_index = k - 1
						k = string.length
					end
				end
				break		
			end
		end		
	end 

	result = basic_op(a,b,op).to_s
	string = string.sub(string.slice(insert_index..insert_end_index),result)

	if valid_num(string)
		return string
	else
		p string
		return eval_maths_no_brackets(string)
	end 
end

#p eval_maths_no_brackets(eval_maths_no_brackets(eval_maths_no_brackets('123+5*7*3')))
#p eval_maths_no_brackets('998+-55--5656')
p eval_maths_no_brackets("56+898--87*15+55/5")
p eval("56+898--87*15+55/5").to_f
p eval('1/0')