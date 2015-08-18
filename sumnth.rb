def series_sum(n)
	sum = 0.to_f
	if n == 0
		return '0.00'
	else
		for i in 1..n
	 		sum += (1.to_f/(3.to_f*i.to_f-2.to_f))
	 	end

		if sum.round(2).to_s == sum.round(1).to_s
			return sum.round(1).to_s + '0'
		else
			return sum.round(2).to_s
		end
	end
end

def series_sum_new(n)
  n == 0 ? "0.00" : '%.2f' % (1..n).map{|x| 1.0/(1+(x-1)*3)}.reduce(:+)
end


n1 = (1.to_f/1.to_f).to_f
n2 = (1.to_f/1.to_f+1.to_f/4.to_f).to_f
n3 = (1.to_f/1.to_f+1.to_f/4.to_f+1.to_f/7.to_f).to_f
#puts "#{n1}  #{n2}  #{n3.round(2)}"
for j in 0..100
	puts "#{series_sum_new(j)}"
end