
#def pattern(n)
 # digits = (1..n).map{ |j| (j % 10).to_s }.join
  #(1..n).map{ |i| "#{' ' * (n - i)}#{digits}#{' ' * (i - 1)}" } * "\n"
#end
def pattern1(n)
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

def pattern2(n)
  v_array = []
  string = ""
  return "" if n <= 0
  return "1" if n == 1
  for i in 1..(n-1)
      v_array[i-1] = " "*(i-1) + (i%10).to_s + " "*(2*(n-i)-1) +  (i%10).to_s + " "*(i-1) 
      string = string + v_array[i-1] + "\n"
  end  
  
  string = string + " "*(n-1) + (n%10).to_s + " "*(n-1) + "\n"
  
  for i in 1..(n-1)
      if i == (n-1)
          string = string + v_array[n-i-1]
      else
          string = string + v_array[n-i-1] + "\n"
      end
  end
  return string
end

def pattern3(n)
  return "" if n <= 0
  return "1" if n == 1  
  digits = ""
  digits_fwd = ""
  digits_bkd = ""
  v_array = []
  for i in 1..n
      digits_fwd = (1..i).map{ |j| (j % 10).to_s }.join
      digits_bkd = digits_fwd.reverse.slice(1..digits_fwd.length)
      #digits = digits + " "*(n-i) +digits_fwd + digits_bkd + " "*(n-i) + "\n"
      v_array[i-1] = " "*(n-i) +digits_fwd + digits_bkd + " "*(n-i)
      digits = digits + v_array[i-1] + "\n"
  end
  for i in 1..n-2
      digits = digits + v_array[n-i-1] + "\n"
  end
      digits = digits + v_array[0]

  return digits
end

def pattern4(n)
  return "" if n <= 0
  return "1" if n == 1  
  digits = ""
  digits_temp = ""
  for j in 1..n
      for i in 1..n
          digits_temp = (j..j-1+i).map{ |j| (j % 10).to_s }.join + "\n"
      end
      digits = digits + digits_temp 
  end


  return digits
end

def pattern(n)
  if n <= 0
      return ""
  end
  if n == 1
      return "1"
  else
      top_section = ""
      bot_section = ""
      for i in 1..n-1
          top_section = top_section + " "*(n-1) + (i%10).to_s*n + " "*(n-1) + "\n"
      end  

      digits_fwd = (1..n).map{ |x| (x % 10).to_s }.join
      digits_bkd = digits_fwd.reverse
      digits = digits_fwd + (n%10).to_s*(n-2)  + digits_bkd + "\n"
      middle_section = digits *n

      bot_section = ""
      for i in 1..n-2
          bot_section = bot_section + " "*(n-1) + ((n-i)%10).to_s*n + " "*(n-1) + "\n"
      end  
          last_row = " "*(n-1) + 1.to_s*n + " "*(n-1)

      return top_section+middle_section+bot_section + last_row

      
  end
end


#puts "#{pattern1(6)}" 
#puts "#{pattern2(6)}" 
#puts "#{pattern3(6)}" 
#puts "#{pattern5(4)}" 
puts "#{pattern(5)}" 
#puts "#{pattern5(2)}" 
#puts "#{pattern5(1)}" 
#puts "#{pattern5(10)}" 
#puts "#{pattern5(14)}" 