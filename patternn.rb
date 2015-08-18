def pattern2(n)
	nstring = ''
   	for j in 1..n
   			nstring = nstring + ((j) % 10).to_s  
   	end
   	pattern = ''
   	for i in 1..(n-1)
		pattern = pattern + ' '*(n-i) + nstring + ' '*(i - 1)+'\\n'
   	end
   		pattern = pattern + nstring + ' '*(n - 1)
   	return pattern
end


def pattern1(n)
  digits = (1..n).map{ |j| (j % 10).to_s }.join
  (1..n).map{ |i| "#{' ' * (n - i)}#{digits}#{' ' * (i - 1)}" } * "\n"
end

def pattern(n)
  rst=[]
  (n-1).downto(0).each{|i|
    rst<<(' '*i + (1..n).map{|num|num%10}*'' + ' '*(n-1-i))
  }
  return rst*"\n"
end


puts pattern(3)
