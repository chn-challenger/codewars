def check_valid_tr_number(number)
	unless number.is_a?(Integer)
		return false
	end
	return false if number < 0 
	return false unless number.to_s.length == 11
	x = (number.to_s[0].to_i + number.to_s[2].to_i + number.to_s[4].to_i + number.to_s[6].to_i + 
		number.to_s[8].to_i)*7 - (number.to_s[1].to_i + number.to_s[3].to_i + number.to_s[5].to_i + number.to_s[7].to_i)
	x = x % 10
	unless (number % 100) / 10 == x 
		return false
	end
    y = 0
    for i in 0..9
    	y += number.to_s[i].to_i
    end
    y = y%10
    if number % 10  == y
    	return true
    else
    	return false
    end
end

def check_valid_tr_number(number)
  id = number.to_s
  id.match(/[1-9][0-9]{10}/) &&
  id[0..8].chars.map.with_index{|d,i| i % 2 == 0 ? d.to_i*7 : -d.to_i}.inject(:+) % 10 == id[9].to_i && 
  id[0..9].chars.map(&:to_i).inject(:+) % 10 == id[10].to_i ? true : false
end

def check_valid_tr_number(n)
  n.is_a?(Integer) and n.to_s[0] != "0" and n.to_s.size == 11 and (n.to_s[0..9].chars.map(&:to_i).reduce(:+) % 10 == n.to_s[10].to_i) and n.to_s.scan(/.{9}/)[0].chars.map.with_index{|x,i| i.odd? ? x.to_i * -1 : x.to_i*7}.reduce(:+) % 10 == n.to_s[9].to_i
end

def check_valid_tr_number(n)
  if n.class!=Fixnum or n.to_s.length!=11 then return false end
  n=n.to_s.split("").map{|x| x.to_i}
  if ((n[0]+n[2]+n[4]+n[6]+n[8])*7-n[1]-n[3]-n[5]-n[7])%10!=n[9] then return false end
  if (n[0,10].inject(:+))%10!=n[10] then return false end
  return true
end

puts "#{check_valid_tr_number(11111111111)}"
puts "#{check_valid_tr_number(6923522112)}"
puts "#{check_valid_tr_number(692352217312)}"
puts "#{check_valid_tr_number('x5810a78432')}"
puts "#{check_valid_tr_number(36637640050)}"
puts "#{check_valid_tr_number(12762438338)}"


#number.to_s[2].to_i + number[4].to_s.to_i + number[6].to_s.to_i + number[8].to_s.to_i