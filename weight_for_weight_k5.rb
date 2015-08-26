# def digisum num  #string
# 	num.split('').inject(0){|result, n| result + n.to_i}
# end

# def order_weight(string)
# 	nums = string.split(' '); result = []; swaps = 0
# 	for i in 0...nums.length-1 
# 		if digisum(nums[i]) > digisum(nums[i+1])
# 			swaps += 1
# 			nums[i], nums[i+1] = nums[i+1], nums[i] 
# 		elsif digisum(nums[i]) == digisum(nums[i+1])
# 			if nums[i] > nums[i+1]
# 				swaps += 1
# 				nums[i], nums[i+1] = nums[i+1], nums[i] 
# 			end
# 		else
# 		end
# 	end
# 	nums = nums.join(' ')
# 	if swaps == 0
# 		return nums
# 	else
# 		return order_weight(nums)
# 	end
# end



def digisum num  #string
	num.split('').inject(0){|result, n| result + n.to_i}
end

def order_weight(string)
	nums = string.split(' '); result = []; swaps = 0
	for i in 0...nums.length-1 
		if digisum(nums[i]) > digisum(nums[i+1])
			nums[i], nums[i+1] = nums[i+1], nums[i] 
			swaps += 1
		elsif digisum(nums[i]) == digisum(nums[i+1]) && nums[i] > nums[i+1] 
			nums[i], nums[i+1] = nums[i+1], nums[i] 
			swaps += 1
		end
	end
	swaps == 0 ? nums.join(' ') : order_weight(nums.join(' '))
end



a =  "56 65 74 100 99 68 86 180 90"  #"100 180 90 56 65 74 68 86 99"
p order_weight a


#p '12345'.split('').inject(0){|result, n| result + n.to_i}

b = "2000 10003 1234000 44444444 9999 11 11 22 123"
p order_weight b
# Expected: "11 11 2000 10003 22 123 1234000 44444444 9999", instead got: "2000 11 10003 22 123 1234000 44444444 9999"
# ""


def weight(str)
  str.to_s.chars.map(&:to_i).reduce(:+)
end

def order_weight(str)
  str.split.sort { |a,b| [weight(a),a] <=> [weight(b),b] }.join(" ")
end