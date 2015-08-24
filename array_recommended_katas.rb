def digitize(n)
  n.to_s.reverse.split('').map(&:to_i)
end

def count_by(x, n)
  result = []
  (1..n).each{|i| result << x*i}
  result
end

def countSheeps array
   	true_array = []
  	true_array = array.select{|x| x}
	return true_array.length
end
