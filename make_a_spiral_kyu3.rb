def make_starting_array(n)
	array = []
	n.times do
		row = []
		n.times{row << 0}
		array << row
	end
	array
end

def rotate_clockwise_right_angle(array)
	array.transpose.reverse
end

def right_crawl(array,current_i,current_j)
	at_least_once = false
	while true
		current_j += 1
		if (array[current_i][current_j+1] == 0 || array[current_i][current_j+1] == nil) && array[current_i+1][current_j] == 0
			array[current_i][current_j] = 1 
			at_least_once = true
		else
			new_i = array.length - current_j
			new_j = current_i
			break
		end
	end
	if at_least_once == false
		return array
	else
		array = rotate_clockwise_right_angle(array)
		right_crawl(array,new_i,new_j)
	end
end

def spiralize(n)
  return [] if n == 0
  return [[1]] if n == 1
	array = make_starting_array(n)
	array[0][0] = 'start'
	array = right_crawl(array,0,0)
	while array[0][0] != 'start'
		array = rotate_clockwise_right_angle(array)
	end
	array[0][0] = 1
	return array
end

# a = [[1,2],[3,4]]
# p rotate_clockwise_right_angle(a)
# p a

p spiralize(2)