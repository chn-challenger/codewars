
#def pattern(n)
 # digits = (1..n).map{ |j| (j % 10).to_s }.join
  #(1..n).map{ |i| "#{' ' * (n - i)}#{digits}#{' ' * (i - 1)}" } * "\n"
#end
def pattern(n)
  digits = ""
  digits_fwd = ""
  digits_bkd = ""
  for i in 1..n
  digits_fwd = (1..i).map{ |j| (j % 10).to_s }.join
  digits_bkd = digits_fwd.reverse.slice(1..digits_fwd.length)
	  unless i == n
	  digits = digits + " "*(n-i) +digits_fwd + digits_bkd + " "*(n-i) + "\n"
	  else
	  digits = digits + " "*(n-i) +digits_fwd + digits_bkd + " "*(n-i)	
	  end
  end

  return digits
end



puts pattern(10)